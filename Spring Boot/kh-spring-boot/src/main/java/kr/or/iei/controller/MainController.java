package kr.or.iei.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import kr.or.iei.board.BoardVo;
import kr.or.iei.mybatis.BoardService;

@RestController // 프레젠테이션 레이어, 웹 요청과 응답 처리 
public class MainController {
	
	@Autowired
	BoardService boardService;
	
	@RequestMapping(value = "/", method = {RequestMethod.GET, RequestMethod.POST})
	public ModelAndView index() {
		ModelAndView mv = new ModelAndView();
		
		String message = "Hello Spring Boot!";
		
		mv.addObject("message", message);
		mv.setViewName("index");
		
		return mv;
		
	}
	
	@RequestMapping(value = "/select", method = {RequestMethod.GET, RequestMethod.POST})
	public ModelAndView select() {
		ModelAndView mv = new ModelAndView();
		
		List<BoardVo> list = boardService.select();
		
		mv.addObject("list", list);
		mv.setViewName("board/select");
		
		return mv;
	}
}
