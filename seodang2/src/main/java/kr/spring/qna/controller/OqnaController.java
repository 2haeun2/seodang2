package kr.spring.qna.controller;

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

import kr.spring.qna.dao.OqnaMapper;
import kr.spring.qna.service.OqnaService;
import kr.spring.qna.vo.OqnaVO;
import kr.spring.util.PagingUtil;

@Controller
public class OqnaController {

	private static final Logger logger = LoggerFactory.getLogger(OqnaController.class);
	
	//(1) 의존관계 주입
	@Autowired
	private OqnaService oqnaService;
	
	//(2) 자바빈 초기화
	@ModelAttribute
	public OqnaVO initCommand() {
		return new OqnaVO();
	}
	
	//(3) 글등록 form
	@GetMapping("/oqna/oqnaWrite.do")
	public String form() {
		return "oqnaWrite";
	}
	
	//(4) 글등록form에서 전송된 데이터 처리
	@PostMapping("/oqna/oqnaWrite.do")
	public String submit(@Valid OqnaVO oqnaVO, BindingResult result,
						HttpSession session, HttpServletRequest request) {
		
		//<1>로그처리
		logger.info("<<Oqna게시판 글 저장>> : " + oqnaVO);
		
		//<2>유효성 체크결과 오류가 있으면 form호출
		if(result.hasErrors()) {
			return form();
		}
		
		//<3>유효성 체크결과 오류가 없을시
		//회원번호 세팅
		Integer user_num = (Integer)session.getAttribute("session_user_num");
		oqnaVO.setUser_num(user_num);
		//글쓰기
		oqnaService.insertOqna(oqnaVO);
		
		//<4> 글등록 후 목록으로 redirect
		return "redirect:/oqna/oqnaList.do";
	}
	
	

	//(5) 게시판 글 목록
	@RequestMapping("/oqna/oqnaList.do")
	public ModelAndView process(@RequestParam(value="pageNum", defaultValue="1") int currentPage,
								@RequestParam(value="keyfield", defaultValue="") String keyfield,
								@RequestParam(value="keyword", defaultValue="") String keyword,
								HttpSession session){
		
		//<1> keyfield, keyword데이터를 Map객체에 넘기기
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("keyfield", keyfield);
		map.put("keyword", keyword);
		
		
		//<2> 글의 총 갯수 또는 검색된 글의 갯수
		int count = oqnaService.selectOqnaRowCount(map);
				
		//<3> 페이지처리
		PagingUtil page = new PagingUtil(keyfield,keyword,currentPage,count,20,10,"oqnaList.do");
		map.put("start", page.getStartCount());	
		map.put("end", page.getEndCount());
		
		//<4> map을 넘겨줘서 글목록 뽑아오기
		List<OqnaVO> list = null;
		if(count >0) {
			list = oqnaService.getOqnaList(map);
		}
		
		//<5> request에 데이터 저장
		Integer session_num = (Integer)session.getAttribute("session_user_num");
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("oqnaList");
		mav.addObject("session_num",session_num);
		mav.addObject("count",count);
		mav.addObject("list",list);
		mav.addObject("pagingHtml",page.getPagingHtml());
		
		return mav;
	}
	
	
	//(6) 게시판 글상세
	
	//(7) 수정form
	
	//(8) 수정form에서 전송된 데이터 처리
	
	//(9) 게시판 글 삭제
}
