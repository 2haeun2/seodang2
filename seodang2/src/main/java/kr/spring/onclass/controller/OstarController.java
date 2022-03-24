package kr.spring.onclass.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import kr.spring.onclass.service.OnclassService;
import kr.spring.onclass.vo.OnclassVO;
import kr.spring.onclass.vo.OstarVO;
import kr.spring.util.PagingUtil;

@Controller
public class OstarController {
	@Autowired
	private OnclassService onclassService;
	@ModelAttribute
	public OstarVO initCommand() {
		return new OstarVO();
	}
	@GetMapping("/onclass/qnaList.do")
	public ModelAndView process(
			@RequestParam(value="pageNum",defaultValue="1")
			int currentPage,
			@RequestParam(value="keyfield",defaultValue="")
			String keyfield,
			@RequestParam(value="keyword",defaultValue="")
			String keyword, int on_num,OstarVO ostarVO,HttpSession session) {
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("keyfield", keyfield);
		map.put("keyword", keyword);
		
		Integer user_num = (Integer)session.getAttribute("session_user_num");
		ostarVO.setOn_num(on_num);
		ostarVO.setUser_num(user_num);
		
		int count = onclassService.selectRowCount(map);
		
		PagingUtil page = new PagingUtil(keyfield,keyword,
                currentPage,count,6,10,"qnaList.do");

		map.put("start",page.getStartCount());
		map.put("end", page.getEndCount());

		List<OstarVO> list = null;
			if(count > 0) {
				list = onclassService.listALL(map);
			}

		ModelAndView mav = new ModelAndView();
		mav.setViewName("qnaList");
		mav.addObject("count", count);
		mav.addObject("list",list);
		mav.addObject("pagingHtml", page.getPagingHtml());

		return mav;
	}
	//별점 처리
	@PostMapping("/onclass/qnaList.do")
	public String qna(OstarVO ostarVO,int on_num,HttpSession session,Model model) {
		Integer user_num = (Integer)session.getAttribute("session_user_num");
		ostarVO.setUser_num(user_num);
		onclassService.insertqna(ostarVO);

		return "redirect:/onclass/qnaList.do?on_num="+on_num;
	}
}
