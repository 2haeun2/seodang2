package kr.spring.kit.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import kr.spring.kit.service.KitService;
import kr.spring.kit.vo.KitVO;
import kr.spring.util.PagingUtil;

@Controller
public class KitController {
	private static final Logger logger = LoggerFactory.getLogger(KitController.class);
	
	@Autowired
	private KitService kitService;
	
	//자바빈 초기화
	@ModelAttribute
	public KitVO initCommand() {
		return new KitVO();
	};
	//kit 등록
	@GetMapping("/kit/kitWrite.do")
	public String form() {
		return "kitWrite";
	}
	//글 등록 폼에서 전송된 데이터 처리
		@PostMapping("/kit/kitWrite.do")
		public String submit(@Valid KitVO kitVO,
				             BindingResult result,
				             HttpSession session,
				             HttpServletRequest request) {
			logger.info("<<게시판 글 저장>> : " + kitVO);
			
			//유효성 체크 결과 오류가 있으면 폼 호출
			if(result.hasErrors()) {
				return form();
			}
			
			Integer user_num = (Integer)session.getAttribute("user_num");
			//회원 번호 셋팅
			kitVO.setKit_num(user_num);
			
			//글쓰기
			kitService.insertKit(kitVO);
			
			return "redirect:/kit/kitList.do";
		}
	
	//Kit 목록
	@RequestMapping("/kit/kitList.do")
	public ModelAndView process(
			@RequestParam(value="pageNum",defaultValue="1")
			int currentPage,
			@RequestParam(value="keyfield",defaultValue="")
			String keyfield,
			@RequestParam(value="keyword",defaultValue="")
			String keyword) {
		
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("keyfielld",keyfield);
		map.put("keyword",keyword);
		
		int count = kitService.selectRowCount(map);
		
		PagingUtil page = new PagingUtil(keyfield,keyword,currentPage,count,20,10,"kitList.do");
		
		map.put("start",page.getStartCount());
		map.put("end",page.getEndCount());
		
		List<KitVO> list = null;
		if(count > 0) {
			list = kitService.selectList(map);
		}
		ModelAndView mav = new ModelAndView();
		mav.setViewName("kitList");
		mav.addObject("count", count);
		mav.addObject("list",list);
		mav.addObject("pagingHtml",page.getPagingHtml());
		
		return mav;
	}
}
