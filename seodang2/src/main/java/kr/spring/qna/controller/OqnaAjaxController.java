package kr.spring.qna.controller;

import java.security.cert.CollectionCertStoreParameters; 
import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.spring.qna.service.OqnaService;
import kr.spring.util.PagingUtil;

@Controller
public class OqnaAjaxController {

	//로그 처리 준비
	private static final Logger logger = LoggerFactory.getLogger(OqnaAjaxController.class);
	
	//rowCount 지정
	private int rowCount = 10;
	
	//1. 의존관계 주입
	@Autowired
	private OqnaService oqnaService;
	
	//2. 부모글 업로드된 파일 삭제 ( 수정form에서 파일삭제 )
	@RequestMapping("/oqna/deleteFile.do")
	@ResponseBody
	public Map<String,String> processFile(int qna_num,HttpSession session){
		
		Map<String,String>map = new HashMap<String,String>();
		
		Integer user_num = (Integer)session.getAttribute("session_user_num");
		if(user_num == null){	
			map.put("result", "logout");
		}else {
			oqnaService.deleteOqnaFile(qna_num);
			map.put("result", "success");
		}
		return map;
	}
	
	//3. 댓글등록
	/*
	@RequestMapping("/board/writeReply.do")
	@ResponseBody	//json문자열을 만들기위해서
	public Map <String,String> writeReply(BoardReplyVO boardReplyVO, HttpSession session, HttpServletRequest request){
		
		//로그처리
		logger.info("<<댓글 등록>> : " + boardReplyVO);
		
		//1. 반환시킬 Map객체 생성
		Map<String,String>map = new HashMap<String,String>();
		
		//2. session으로부터 user_num 받아오기
		Integer user_num = (Integer)session.getAttribute("user_num");
		
		//3. 로그인이 되지않은 경우
		if(user_num == null) { 
			map.put("result", "logout");
			
		//4. 로그인 된경우	
		}else {	
			//(1) boardReplyVO에 회원번호 등록
			boardReplyVO.setMem_num(user_num);
			//(2) boardReplyVO에 ip등록
			boardReplyVO.setRe_ip(request.getRemoteAddr());
			//(3) boardReplyVO - 댓글등록 메서드 실행
			boardService.insertReply(boardReplyVO);
			map.put("result", "success");
		}
		return map;
	}	
	
	
	//4. 댓글 목록
	@RequestMapping("/board/listReply.do")
	@ResponseBody
	public Map<String,Object> getList( @RequestParam(value="pageNum",defaultValue="1") int currentPage,
									   @RequestParam int board_num,
									   HttpSession session){
		
		//로그처리
		logger.info("<<목록 호출>> currentPage : " + currentPage);
		logger.info("<<목록 호출>> board_num : " + board_num);
		
		//<1> Map객체 생성
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("board_num", board_num);
		
		//<2> 페이지 처리
		int count = boardService.selectRowCountReply(map);	//총 글의 갯수
		PagingUtil page = new PagingUtil(currentPage, count, rowCount,10,null);
														// 호출할 페이지가 없기때문에 null처리
											//PagingUtil메서드를 이용해서 나온 결과값을 실제로 페이지에 적용할 것이 아니라
											//연산만 해서 Start/End Count만 구하려고 하는것이기때문에 => 호출할 페이지를 null처리 
		map.put("start", page.getStartCount());
		map.put("end", page.getEndCount());
		
		//<3> 댓글 list 만들기 
		List<BoardReplyVO> list = null;
		if(count>0) {
			list = boardService.selectListReply(map);
		}else {
			list = Collections.emptyList();
		}
		
		//<4> session에서 user_num 데이터값 받기
		Integer user_num = (Integer)session.getAttribute("user_num");
		
		//<4> 데이터를 json문자열로 만들어서 반환
		Map<String,Object> mapJson = new HashMap<String,Object>();
		mapJson.put("count", count);
		mapJson.put("rowCount", rowCount);
		mapJson.put("list", list);
		mapJson.put("user_num",user_num);
		
		//<5> Map객체 반환
		return mapJson;
	}
	
	
	
	//5. 댓글 수정
	@RequestMapping("/board/updateReply.do")
	@ResponseBody
	public Map<String,String> modifyReply(BoardReplyVO boardReplyVO,
										  HttpSession session, 
										  HttpServletRequest request){
		//로그처리
		logger.info("<<댓글 수정>> : " + boardReplyVO);
		
		//(1) Map객체 생성
		Map<String,String> map = new HashMap<String,String>();
		
		//(2) Session으로 로그인된 회원번호 구하기 
		Integer user_num = (Integer)session.getAttribute("user_num");
		//(3) selecReply()메서드를 통해, 기존 댓글 데이터를 전부 뽑아와서, 댓글 작성자 회원번호 구하기
		BoardReplyVO db_reply = boardService.selectReply(boardReplyVO.getRe_num());
		
		//(4) 로그인이 되어있지 않은 경우
		if(user_num == null) {
			map.put("result", "logout");
			
		//(5) 로그인 회원번호와 작성자 회원번호가 일치하는 경우	
		}else if(user_num !=null && user_num==db_reply.getMem_num()) {
			//ip등록 
			boardReplyVO.setRe_ip(request.getRemoteAddr());
			//댓글 수정
			boardService.updateReply(boardReplyVO);
			map.put("result","success");
			
		//(6) 로그인 회원번호와 작성자 회원번호가 불일치	
		}else{
			map.put("result", "wrongAccess");
		}		
		//(7) Map객체 반환
		return map;
	}
	
	
	//댓글 삭제
	@RequestMapping("/board/deleteReply.do")
	@ResponseBody
	public Map<String,String> deleteReply(@RequestParam int re_num, HttpSession session){
		
		//(1) Map 객체 생성
		Map<String,String> map = new HashMap<String,String>();
		
		//(2) 로그인한 회원번호와 작성자 회원번호가 일치하는지 확인
		//1. session으로부터 user_num 받아오기
		Integer user_num = (Integer)session.getAttribute("user_num");
		//2. selectReply()으로부터 한건의 데이터 받아오기  ==> 로그인한(user_num)과 댓글 작성자(re_num)이 일치하는지 확인필요
		BoardReplyVO db_reply = boardService.selectReply(re_num);
				
		//3.로그인이 되지않은 경우
		if(user_num ==null) {
			map.put("result","logout");
		}
		//4. 로그인이 되어있고, 로그인한 회원번호와 작성자 회원번호 일치
		else if(user_num!=null && user_num==db_reply.getMem_num()) {
			boardService.deleteReply(re_num);	//삭제처리
			map.put("result","success");
		}
		//5. 로그인한 회원번호와 작성자 회원번호 불일치
		else {
			map.put("result","wrongAccess");
		}
		return map;
	}
	*/
	
}
