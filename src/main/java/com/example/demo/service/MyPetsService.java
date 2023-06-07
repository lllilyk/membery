package com.example.demo.service;

import java.time.LocalDate;
import java.time.Period;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.example.demo.domain.Registration;
import com.example.demo.mapper.MyPetsMapper;

import software.amazon.awssdk.core.sync.RequestBody;
import software.amazon.awssdk.services.s3.S3Client;
import software.amazon.awssdk.services.s3.model.DeleteObjectRequest;
import software.amazon.awssdk.services.s3.model.ObjectCannedACL;
import software.amazon.awssdk.services.s3.model.PutObjectRequest;

@Service
public class MyPetsService {

	@Autowired
	private MyPetsMapper mapper;

	@Autowired
	private S3Client s3;

	@Value("${aws.s3.bucketName}")
	private String bucketName;

	public Map<String, Object> petsList() {
		List<Registration> list = mapper.selectAll();
		
		var now = LocalDate.now();
		for(Registration r : list) {
			r.setDiff(Period.between(r.getTogether().toLocalDate(), now));
		}

		return Map.of("petsList", list);
	}

	public Registration getPet(Integer id) {
		return mapper.selectById(id);
	}

	public boolean modify(Registration registration, String removeFile, MultipartFile addFile) throws Exception {

		// 기존사진이 있다면,
		if (removeFile != null && !removeFile.isEmpty()) {

			// aws s3에서 삭제
			String objectKey = "membery/" + registration.getId() + "/" + removeFile;
			DeleteObjectRequest dor = DeleteObjectRequest.builder().bucket(bucketName).key(objectKey).build();
			s3.deleteObject(dor);

			// 테이블에 기존사진 삭제
			mapper.updatePhotoNull(registration.getId());

		}

		// 새 파일 추가

		// aws s3에 업로드
		String objectKey = "membery/" + registration.getId() + "/" + addFile.getOriginalFilename();
		PutObjectRequest por = PutObjectRequest.builder().bucket(bucketName).key(objectKey)
				.acl(ObjectCannedACL.PUBLIC_READ).build();
		RequestBody rb = RequestBody.fromInputStream(addFile.getInputStream(), addFile.getSize());
		s3.putObject(por, rb);

		// 테이블에 새로운 파일 추가, 수정
		int cnt = mapper.update(registration, addFile.getOriginalFilename());
		return cnt == 1;
	}
}
