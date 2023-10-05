package com.songmin.song.controller;

import com.songmin.song.domain.UserDto;
import com.songmin.song.service.UserService;
import jakarta.validation.Valid;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.text.SimpleDateFormat;
import java.util.Date;

@Controller
@RequestMapping("/register")
public class RegisterController {

	@Autowired
	UserService service;

	//   WebDataBinder에 등록 -> @Valid가 붙은 매개변수에 적용
	@InitBinder
	public void toUser(WebDataBinder binder) {
		//   (yyyyMMdd)형식의 String 클래스를 Date 클래스로 변환하는 에디터 등록
		SimpleDateFormat df = new SimpleDateFormat("yyyyMMdd");
		//   date 와 typeMismatch 를 이용해서 에러코드를 만듦...??
		binder.registerCustomEditor(Date.class, new CustomDateEditor(df, false));

		//   유효성 검사하는 UserValidator 등록
		binder.setValidator(new UserValidator());	//	GlobalValidator를 안쓰는중
//		binder.addValidators(new UserValidator());

	}



	@GetMapping("/add")
	public String registerForm(@ModelAttribute("userDto") UserDto userDto) {
		//	userDto
		return "registerForm";
	}


	@PostMapping("/add")
	//   UserDto로 변환 + 유효성 검사 -> 에러 발생 result에 저장 -> result를 모델에 저장
	public String registerAdd(@Valid @ModelAttribute("userDto") UserDto userDto, BindingResult result, RedirectAttributes rttr, Model m) {
		System.out.println("|||------------------------------------");
		System.out.println("result = " + result);
		System.out.println("---------------------------------------");
		System.out.println("userDto = " + userDto);
		System.out.println("------------------------------------|||");


		//   (변환 + 검증)시 에러가 있으면 회원가입화면 보여주기
		//   redirect를 하면 모델에 저장 되어 있는 result가 넘어가지 않음
		if(result.hasErrors()) {
			//	userDto, result
			return "registerForm";
		}

		try {
			if(registerCheck(userDto)) {
		 		service.register(userDto);
				rttr.addFlashAttribute("msg","register_OK");
				return "redirect:/";
			}
		} catch (Exception e) {
			e.printStackTrace();
			return "error";
		}

		rttr.addFlashAttribute("msg", "register_ERR");
		return "redirect:/register/add";
	}

	private boolean registerCheck(UserDto userDto) throws Exception {
		return service.registerCheck(userDto);
	}

}
