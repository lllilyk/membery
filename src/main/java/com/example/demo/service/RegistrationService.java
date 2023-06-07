package com.example.demo.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.example.demo.domain.Registration;
import com.example.demo.mapper.RegistrationMapper;

import software.amazon.awssdk.core.sync.RequestBody;
import software.amazon.awssdk.services.s3.S3Client;
import software.amazon.awssdk.services.s3.model.ObjectCannedACL;
import software.amazon.awssdk.services.s3.model.PutObjectRequest;

@Service
public class RegistrationService {
	
	@Autowired
	private RegistrationMapper mapper;
	
	@Autowired
	private S3Client s3;
	
	@Value("${aws.s3.bucketName}")
	private String bucketName;

	public void insert(Registration registration, MultipartFile file) throws Exception {
		
		//테이블에 정보 insert
		int cnt = mapper.insertAll(registration, file.getOriginalFilename());
		
		// s3에 파일 업데이트 
		String objectKey = "membery/" + registration.getId() + "/" + file.getOriginalFilename();
		PutObjectRequest por = PutObjectRequest.builder()
				.bucket(bucketName)
				.key(objectKey)
				.acl(ObjectCannedACL.PUBLIC_READ)
				.build();
		RequestBody rb = RequestBody.fromInputStream(file.getInputStream(), file.getSize());
		s3.putObject(por, rb);
		
	}

	
	
	

}
