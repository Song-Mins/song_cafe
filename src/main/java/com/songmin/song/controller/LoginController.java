package com.songmin.song.controller;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.songmin.song.domain.PageCondition;
import com.songmin.song.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
@RequestMapping("/login")
public class LoginController {
	@Autowired
    UserService userService;


	@GetMapping("/login")
	public String loginForm(@ModelAttribute("pc") PageCondition pc, String url, String bno, String manager_id, Model m) {
		m.addAttribute("url", url);
		m.addAttribute("bno", bno);
		m.addAttribute("manager_id", manager_id);

		//	pc, url, bno
		return "loginForm";
	}

	@PostMapping("/login")
	public String login(String id, String pwd, boolean remember, String url, String bno, String manager_id, @ModelAttribute("pc") PageCondition pc,
						HttpServletRequest request, HttpServletResponse response, RedirectAttributes rttr, Model m) {


		//	로그인 실패하면
		try {
			if(!loginCheck(id, pwd)) {
				rttr.addAttribute("url", url);
				rttr.addAttribute("bno", bno);
				rttr.addAttribute("manager_id", manager_id);
				rttr.addAttribute("page", pc.getPage());
				rttr.addAttribute("option", pc.getOption());
				rttr.addAttribute("keyword", pc.getKeyword());
				rttr.addAttribute("readId", pc.getReadId());
				rttr.addAttribute("cafe_name", pc.getCafe_name());
				rttr.addAttribute("bulletin_board", pc.getBulletin_board());

				return "redirect:/login/login";
			}
		} catch (Exception e) {
			e.printStackTrace();
			return "error";
		}


		//	로그인 성공 하면
		//	세션에 아이디 저장
		request.getSession(true).setAttribute("id", id);

		if	(remember) {
			Cookie cookie = new Cookie("id", id);
			cookie.setDomain("localhost");
			cookie.setPath("/");
			cookie.setMaxAge(2*24*60*60);
			response.addCookie(cookie);
		}
		else {
			System.out.println("쿠키 없애자");
			Cookie cookie = new Cookie("id", id);
			cookie.setMaxAge(0);
			response.addCookie(cookie);
		}


		rttr.addAttribute("cafe_name", pc.getCafe_name());
		rttr.addAttribute("bulletin_board", pc.getBulletin_board());
		rttr.addAttribute("page", pc.getPage());
		rttr.addAttribute("option", pc.getOption());
		rttr.addAttribute("keyword", pc.getKeyword());
		rttr.addAttribute("readId", pc.getReadId());
		rttr.addAttribute("bno", bno);
		rttr.addAttribute("loginId", id);
		rttr.addAttribute("manager_id", manager_id);

		return "redirect:" + url;
	}

	private boolean loginCheck(String id, String pwd) throws Exception {
				return userService.loginCheck(id, pwd);
	}


	@GetMapping("/logout")
	public String logout(String url, HttpSession session) {

		session.invalidate();

		if ("/".equals(url)) {
			return "redirect:/";

		} else {
			return "redirect:/cafe/list";
		}

	}

	@GetMapping("/find")
	public String find(String mode, Model m) {

		m.addAttribute("mode", mode);

		return "loginFind";
	}

}
