package com.example.demo.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.example.demo.domain.Registration;
import com.example.demo.service.MyPetsService;

@Controller
@RequestMapping("/")
public class MyPetsController {
	
	@Autowired
	private MyPetsService service;
	
	//나의반려동물 리스트 보기
	@GetMapping("petList")
	public void list (Model model) {
		
		Map<String, Object> list = service.petsList();
				
		model.addAllAttributes(list);
		
	}
	
	//펫 정보 보기
	@GetMapping("/id/{id}")
	public String myPet (@PathVariable("id") Integer id, Model model) {
		Registration registration = service.getPet(id);
		model.addAttribute("pet",registration);
		return "pet";
		
	}
	
	//펫 정보 수정 전 조회
	@GetMapping("/petModify/{id}")
	public String modify(@PathVariable("id") Integer id, Model model) {
		model.addAttribute("pet", service.getPet(id));
		return "petModify";
		
	}
	
	//펫 정보 수정
	@PostMapping("/petModify/{id}")
	public String modifyProcess(Registration registration, 
			@RequestParam(value="file", required = false) MultipartFile addFile,
			@RequestParam(value="removeFile", required = false) String removeFile,
			RedirectAttributes rttr) throws Exception {
		System.out.println(removeFile); //컨트롤러가 잘 받는지 확인용 
		boolean ok = service.modify(registration, removeFile, addFile);//서비스에게 넘김
		
		//DB가 수정되고 만약 잘 수정되었다면(true)이면 다음 실행흐름을 이어가라
		if (ok) {
			//해당 펫정보보기로 돌아가게 만들래 (리다이렉션)
			rttr.addFlashAttribute("message", registration.getId() + "번 게시물이 수정되었습니다.");
			return "redirect:/id/" + registration.getId();
		} else {
			//잘못수정이 되었을 때는 수정페이지로 돌아가게 만들래
			rttr.addFlashAttribute("message", registration.getId() + "번 게시물이 수정되지 않았습니다.");
			//rttr.addAttribute("fail", "fail");
			return "redirect:/modify/" + registration.getId();
		}
		
	}
	

}
