package kr.spring.offclass.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import kr.spring.offclass.service.OffclassService;
import kr.spring.offclass.vo.OffclassVO;

@Controller
public class OffclassController {
	
	private Logger logger = LoggerFactory.getLogger(OffclassController.class);
	
	@Autowired
	private OffclassService offclassService;
	
	//자바빈(VO) 초기화
	@ModelAttribute
	public OffclassVO initCommand() {
		return new OffclassVO();
	}
	
	//오프라인 클래스 등록
	@GetMapping("/offclass/offclassWrite.do")
	public String form() {
		return "offclassWrite";
	}
	
	//오프라인 클래스 목록
	@RequestMapping("/offclass/offclassList.do")
	public ModelAndView process() {
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("offclassList");
		
		return mav;
	}
}
