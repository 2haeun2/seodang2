package kr.spring.offclass.controller;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
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
	
	//오프라인 클래스 폼
	@GetMapping("/offclass/offclassOpen.do")
	public String form() {
		return "offclassOpen";
	}
	
	//오프라인 클래스 등록
	@PostMapping("/offclass/offclassOpen.do")
	public String sumbit(@Valid OffclassVO offclassVO,BindingResult result,HttpSession session) {
		
		logger.info("<<오프라인 클래스 등록>>: "+offclassVO);
		
		if(result.hasErrors()) {
			return form();
		}
		
		Integer user_num = (Integer)session.getAttribute("session_user_num");
		//회원번호 세팅
		offclassVO.setUser_num(user_num);
		//글 작성
		offclassService.insertOffClass(offclassVO);
		
		return "redirect:/offclass/offclassList.do";
	}
	
	//오프라인 클래스 목록
	@RequestMapping("/offclass/offclassList.do")
	public ModelAndView process() {
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("offclassList");
		
		return mav;
	}
}
