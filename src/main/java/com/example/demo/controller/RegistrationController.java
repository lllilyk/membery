package com.example.demo.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.example.demo.domain.Registration;
import com.example.demo.service.RegistrationService;

@Controller
@RequestMapping("/")
public class RegistrationController {
	
	@Autowired
	private RegistrationService service;
	
	@GetMapping("/registration")
	public void registrationForm() {
		
	}
	
	@PostMapping("/registration")
	public String addRegistration(@RequestParam("file") MultipartFile file, 
								Registration registration, RedirectAttributes rttr) throws Exception {
		service.insert(registration, file);
		
		rttr.addAttribute("registration", "registration");
		
		return "redirect:/petList";
		
	}

}
