package kr.spring.offclass.controller;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.spring.offclass.service.OffclassService;
import kr.spring.offclass.vo.OffTimetableVO;
import kr.spring.offclass.vo.OffclassVO;

@Controller
public class OffclassAjaxController {

	private static final Logger logger= LoggerFactory.getLogger(OffclassAjaxController.class);
	
	@Autowired
	private OffclassService offclassService;
	
//	//클래스 등록
//	@RequestMapping("/offclass/offclassOpen.do")
//	@ResponseBody
//	public Map<String, Object> openClass(OffclassVO offclassVO,
//										 @RequestParam("time") String time,
//										 HttpSession session,HttpServletRequest request){
//		
//		Map<String, Object> map = new HashMap<String, Object>();
//		logger.info("<<잘보내지는지 확인>>"+offclassVO);
//		logger.info("<<잘보내지는지 확인>>"+time);
//		
//		
//		
//		return map;
//	}
	
}
