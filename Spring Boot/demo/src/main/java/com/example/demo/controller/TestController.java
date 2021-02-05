package com.example.demo.controller;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.example.demo.member.MemberVo;

// ModelAndView, Java Object 둘 다 반환 가능한 어노테이션
@RestController
public class TestController {
	
	@RequestMapping(value = "/test", method = RequestMethod.GET)
	public String test() {
		String message = "Hi Spring!";
		
		return message;
		
	}
	
	@RequestMapping(value="/gugudan", method = RequestMethod.GET)
	public ModelAndView multiplicationTable() {
		ModelAndView mv = new ModelAndView();
		
		String multiplication = "<h3>구구단 출력</h3>";
		
		int i = 2;
		for (int j=1; j<10; j++) {
			multiplication += i + "*" + j + "=" + i*j + "<br/>";
		}
		
		mv.addObject("gugudan", multiplication);
		mv.setViewName("gugudan");
		
		return mv;
		
	}
	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public ModelAndView signin(String id, String password) {
		ModelAndView mv = new ModelAndView();
		MemberVo memberVo = new MemberVo();
		
		memberVo.setId("hong");
		memberVo.setPassword("1234");
		
		String result = "로그인 실패.";
		
		if (id.equals(memberVo.getId())&& password.equals(memberVo.getPassword())) {
			result = "로그인 성공.";
		}
		
		mv.addObject("result", result);
		mv.setViewName("login_result");
		
		return mv;
	}
	
	@RequestMapping(value = "/loginByInput", method = RequestMethod.GET)
	public ModelAndView loginByInput(String id, String password) {
		ModelAndView mv = new ModelAndView();
		
		mv.setViewName("login");
		return mv;
	}
	
	@RequestMapping(value = "/loginByInputResult", method = RequestMethod.POST)
	public ModelAndView loginByInputResult(MemberVo memberVo) {
		ModelAndView mv = new ModelAndView();
		
		
		String result = "로그인 실패.";
		
		if ("hong".equals(memberVo.getId())&& "1234".equals(memberVo.getPassword())) {
			result = "로그인 성공.";
		}
		
		mv.addObject("result", result);
		mv.setViewName("login_result");
		
		return mv;
	}
}
