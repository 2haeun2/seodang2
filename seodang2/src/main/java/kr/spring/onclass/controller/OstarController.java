package kr.spring.onclass.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

import kr.spring.onclass.service.OnclassService;
import kr.spring.onclass.vo.OstarVO;

@Controller
public class OstarController {
	@Autowired
	private OnclassService onclassService;
	@ModelAttribute
	public OstarVO initCommand() {
		return new OstarVO();
	}
	@GetMapping("/onclass/qnaList.do")
	public String qnaForm(Model model,OstarVO ostarVO,int on_num,HttpServletRequest request) {
		ostarVO.setOn_num(on_num);
		model.addAttribute("list",onclassService.listAll());
		return "qnaList";
	}
	//별점 처리
	@PostMapping("/onclass/qnaList.do")
	public String qna(OstarVO ostarVO,int on_num,HttpSession session,Model model) {
		Integer user_num = (Integer)session.getAttribute("session_user_num");
		ostarVO.setUser_num(user_num);
		onclassService.insertqna(ostarVO);
		return "qnaList";
	}
}
