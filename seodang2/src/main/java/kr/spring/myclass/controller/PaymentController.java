package kr.spring.myclass.controller;

import java.net.http.HttpRequest;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;

import kr.spring.myclass.service.MyclassService;
import kr.spring.myclass.vo.PaymentVO;
import kr.spring.qna.controller.OqnaController;

@Controller
public class PaymentController {
	private static final Logger logger = LoggerFactory.getLogger(PaymentController.class);
	@Autowired
	public MyclassService myclassService;
	
	//구매한 클래스 내 정보 구매목록에 저장
	@PostMapping("/onclass/payment.do")
	public String payment(PaymentVO paymentVO,HttpSession session,Model model,HttpServletRequest request) {
		Integer user_num = (Integer)session.getAttribute("session_user_num");
		paymentVO.setUser_num(user_num);
		myclassService.insertRegister(paymentVO);
		
		logger.info("!!paymentVO : " + paymentVO);
		
		model.addAttribute("message", "구매 완료 !!");
		model.addAttribute("url", request.getContextPath() + "/main/main.do");
		
		return "common/resultView";
	}
}
