package kr.spring.myclass.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import kr.spring.myclass.service.MyclassService;
import kr.spring.myclass.vo.MyclassVO;
import kr.spring.onclass.service.OnclassService;
import kr.spring.onclass.vo.OnlikeVO;
import kr.spring.util.PagingUtil;

@Controller
public class MyclassController {
	@Autowired
	private MyclassService myclassService;
	@Autowired
	private OnclassService onclassService;
	
	@GetMapping("/myclass/myclassMain.do")
	public String mainForm() {
		return "myclassMain";
	}
	
	@RequestMapping("/myclass/myclassList.do")
	public ModelAndView classList(
			@RequestParam(value="pageNum",defaultValue="1")
			int currentPage,
			@RequestParam(value="keyfield",defaultValue="")
			String keyfield,
			@RequestParam(value="keyword",defaultValue="")
			String keyword, HttpSession session
			) {
		
		Integer user_num = (Integer)session.getAttribute("session_user_num");
		
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("keyfield", keyfield);
		map.put("keyword", keyword);
		
		int count = myclassService.selectRowCount(map);
		
		PagingUtil page = new PagingUtil(keyfield,keyword,
                currentPage,count,4,10,"myclassList.do");
		map.put("user_num", user_num);
		map.put("start",page.getStartCount());
		map.put("end", page.getEndCount());
		
		
		List<MyclassVO> list = null;
			if(count > 0) {
				list = myclassService.selectList(map);
			}

		ModelAndView mav = new ModelAndView();
		mav.setViewName("myclassList");
		mav.addObject("user_num",user_num);
		mav.addObject("count", count);
		mav.addObject("list",list);
		mav.addObject("pagingHtml", page.getPagingHtml());

		return mav;
	}
	
	@RequestMapping("/myclass/likeList.do")
	public ModelAndView likeForm(@RequestParam(value="pageNum",defaultValue="1")
											int currentPage, HttpSession session) {
		
		Integer user_num = (Integer)session.getAttribute("session_user_num");
		Map<String,Object> map = new HashMap<String,Object>();
		
		int count = myclassService.selectRowCount3(map);
		
		PagingUtil page = new PagingUtil(currentPage,count,4,10,"likeList.do");
		map.put("user_num", user_num);
		map.put("start",page.getStartCount());
		map.put("end", page.getEndCount());
		
		List<OnlikeVO> list = null;

		if(count > 0) {
			list = myclassService.selectLikeList(map);
		}

		ModelAndView mav = new ModelAndView();
		mav.setViewName("likeList");
		mav.addObject("user_num",user_num);
		mav.addObject("count", count);
		mav.addObject("list",list);
		mav.addObject("pagingHtml", page.getPagingHtml());

		return mav;	
	}
	
	
	  //찜목록에서 찜 취소하기
	  @PostMapping("/myclass/likeDelete.do") 
	  public String deleteLike(int on_num,int onoff,Model model,HttpServletRequest request) {
	  
	  //System.out.println("삭제 온넘  : "+on_num);
	  //System.out.println("삭제 온오프  : "+onoff);
	  
	  if(onoff == 1) {
		  myclassService.onDeleteLike(on_num);
	  }else if(onoff == 2) {
		  myclassService.offDeleteLike(on_num);
	  }
		  
	  model.addAttribute("message", "게시물 삭제 완료"); 
	  model.addAttribute("url", request.getContextPath() + "/myclass/likeList.do");
	  
	  return "common/resultView"; 
	  }	
}
