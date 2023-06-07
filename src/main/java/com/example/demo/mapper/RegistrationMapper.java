package com.example.demo.mapper;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Options;

import com.example.demo.domain.Registration;

@Mapper
public interface RegistrationMapper {

	@Insert("""
			INSERT INTO Pet (petName, type, weight, birth, together, gender, neutered, registrationNum, photo)
			VALUES (#{registration.petName}, #{registration.type}, #{registration.weight}, #{registration.birth}, #{registration.together}, #{registration.gender}, #{registration.neutered}, #{registration.registrationNum}, #{originalFilename})
			""")
	@Options(useGeneratedKeys = true, keyProperty = "registration.id")
	Integer insertAll(Registration registration, String originalFilename);


	
	

}
