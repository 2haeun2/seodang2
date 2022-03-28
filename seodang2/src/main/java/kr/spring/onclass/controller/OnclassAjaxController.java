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
	public Map<String, Object> likeForm(int on_num,HttpSession session) {
		Integer user_num = (Integer)session.getAttribute("session_user_num");
		System.out.println(user_num);
		
		Map<String,Object> map = new HashMap<String,Object>();
		OnlikeVO vo = onclassService.selectLike(user_num,on_num);
		
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
	
	//게시물 들어갔을때 하트 빈하트 여부
	@RequestMapping("/onclass/getFav.do")
	@ResponseBody	
	public Map<String, Object> execute(int on_num,HttpSession session,OnlikeVO onlikeVO) {
		
		Map<String,Object> map = new HashMap<String,Object>();
		Integer user_num = (Integer)session.getAttribute("session_user_num");
		
		if(user_num == null) {//로그인 안됨
			map.put("result", "success"); //좋아요 표시
			map.put("status", "noFav"); //빈 하트 표시
			map.put("count", onclassService.selectLikeCount(on_num)); //좋아요 총 개수 표시
		}else {	
			onlikeVO = onclassService.selectLike(user_num, on_num);
			
			if(onlikeVO!=null) { //vo가 null이 아니면 추천을 이미 한 경우
				map.put("result", "success");
				map.put("status", "yesFav"); // 추천하트로 표시
				map.put("count", onclassService.selectLikeCount(on_num)); //좋아요 총 개수 표시
			}else{ // 추천을 안한 경우
				map.put("result", "success");
				map.put("status", "noFav"); //빈 하트 표시 
				map.put("count", onclassService.selectLikeCount(on_num)); //좋아요 총 개수 표시
			}
		}
		return map;
	}
}
