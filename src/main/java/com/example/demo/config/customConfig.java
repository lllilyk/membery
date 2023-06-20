package com.example.demo.config;

import org.springframework.beans.factory.annotation.*;
import org.springframework.context.annotation.*;
import org.springframework.security.config.annotation.method.configuration.*;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.crypto.bcrypt.*;
import org.springframework.security.crypto.password.*;
import org.springframework.security.web.SecurityFilterChain;
import org.springframework.security.web.authentication.*;

import com.example.demo.config.oauth.*;

import jakarta.annotation.*;
import jakarta.servlet.*;
import software.amazon.awssdk.auth.credentials.AwsBasicCredentials;
import software.amazon.awssdk.auth.credentials.AwsCredentialsProvider;
import software.amazon.awssdk.auth.credentials.StaticCredentialsProvider;
import software.amazon.awssdk.regions.Region;
import software.amazon.awssdk.services.s3.S3Client;

@Configuration
@EnableMethodSecurity
@PropertySource("classpath:custom.properties")
public class customConfig {

	@Value("${aws.accessKeyId}")
	private String accessKeyId;
	@Value("${aws.secretAccessKeyId}")
	private String secretAccessKey;
	@Value("${aws.bucketUrl}")
	private String bucketUrl;
	@Value("${spring.security.oauth2.client.registration.google.client-id}")
	private String clientId;
	@Value("${spring.security.oauth2.client.registration.google.client-secret}")
    private String clientSecret;
	@Value("${spring.security.oauth2.client.registration.naver.client-id}")
	private String naverClientId;
	@Value("${spring.security.oauth2.client.registration.naver.client-secret}")
    private String naverClientSecret;
	@Value("${spring.security.oauth2.client.registration.naver.redirect-uri}")
    private String redirectUri;
	
	@Autowired
	private ServletContext application;

	@Autowired
	private AuthenticationSuccessHandler loginSuccessHandler;

	@Autowired
	private AuthenticationFailureHandler userLoginFailHandler;
	
	@Autowired
	private PrincipalOauth2UserService principalOauth2UserService;

	@PostConstruct
	public void init() {
		application.setAttribute("bucketUrl", bucketUrl);
	}

	public void googleLogin() {
        System.out.println("Client ID: " + clientId);
        System.out.println("Client Secret: " + clientSecret);
    }
	
	@Bean
	public PasswordEncoder passwordEncoder() {
		return new BCryptPasswordEncoder();
	}

	@Bean
	public SecurityFilterChain securityFilterChain(HttpSecurity http) throws Exception {
		http.csrf().disable();
		http.authorizeHttpRequests().anyRequest().permitAll();
		http.formLogin().loginPage("/member/login").successHandler(loginSuccessHandler).failureHandler(userLoginFailHandler);
		http.oauth2Login().loginPage("/member/login").userInfoEndpoint().userService(principalOauth2UserService);
		http.logout().logoutUrl("/member/logout");
		return http.build();
	}

	@Bean
	public S3Client s3client() {
 
		AwsBasicCredentials credentials = AwsBasicCredentials.create(accessKeyId, secretAccessKey);
		AwsCredentialsProvider provider = StaticCredentialsProvider.create(credentials);

		S3Client s3client = S3Client.builder()
				.credentialsProvider(provider)
				.region(Region.AP_NORTHEAST_2)
				.build();

		return s3client;
	}

}
