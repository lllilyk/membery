package com.example.demo.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.example.demo.domain.Registration;

@Mapper
public interface MyPetsMapper {

	@Select("""
			SELECT * FROM Pet
			""")
	List<Registration> selectAll();

	@Select("""
			SELECT * FROM Pet
			WHERE id = #{id}
			""")
	Registration selectById(Integer id);

	@Update("""
			UPDATE Pet SET photo = null
			WHERE Id = #{id}
			""")
	Integer updatePhotoNull(Integer id);

	@Update("""
			UPDATE Pet SET
				id = #{registration.id},
				petName = #{registration.petName},
				type = #{registration.type},
				birth = #{registration.birth},
				together = #{registration.together},
				gender = #{registration.gender},
				neutered = #{registration.neutered},
				registrationNum = #{registration.registrationNum},
				photo = #{originalFilename},
				weight = #{registration.weight},
				memberId = #{registration.memberId}
			WHERE Id = #{registration.id}
			""")
	Integer update(Registration registration, String originalFilename);




}
