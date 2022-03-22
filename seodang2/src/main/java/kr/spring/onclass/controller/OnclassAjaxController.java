package kr.spring.onclass.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.spring.onclass.service.OnclassService;
import kr.spring.onclass.vo.OnlikeVO;



@Controller
public class OnclassAjaxController {
	@Autowired
	private OnclassService onclassService;
	
	@RequestMapping("/onclass/like.do")
	@ResponseBody
	
	public Map<String, Object> likeForm(int on_num,OnlikeVO vo,HttpSession session) {
		Integer user_num = (Integer)session.getAttribute("session_user_num");
		System.out.println(user_num);
		
		Map<String,Object> map = new HashMap<String,Object>();
		vo = onclassService.selectLike(user_num,on_num);
		
		if(vo!=null) { //이미 추천을 한 경우
			onclassService.deleteLike(vo.getOnlike_num());
			map.put("result", "success");
			map.put("status", "noFav");
		}else{
			onclassService.insertLike(user_num,on_num);
			map.put("result", "success");
			map.put("status", "yesFav");
		}
		
		return map; 
	}
}