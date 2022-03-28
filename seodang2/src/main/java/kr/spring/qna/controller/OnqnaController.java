package kr.spring.qna.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import kr.spring.qna.service.OnqnaService;
import kr.spring.qna.vo.OnqnaVO;



@Controller
public class OnqnaController {

	private static final Logger logger = LoggerFactory.getLogger(OnqnaController.class);
	
	
	//(1)의존관계 주입
	@Autowired
	private OnqnaService onqnaService;
	
	
	//(2)자바빈 초기화
	@ModelAttribute
	public OnqnaVO initCommand() {
		return new OnqnaVO();
	}
	
	//(3)글등록 form
	@GetMapping("/onqna/onqnaWrite.do")	//view생성
	public String form() { 
		return "onqnaWrite";	//tiles등록
	}
	
	//onqna 글 목록
	@RequestMapping("/onqna/onqnaList.do")
	public ModelAndView process() {
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("onqnaList");
		
		return mav;
	}
	
	
}
