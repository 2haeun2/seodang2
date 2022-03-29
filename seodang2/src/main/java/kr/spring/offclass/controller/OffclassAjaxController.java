package kr.spring.offclass.controller;

import java.io.IOException;
import java.time.LocalDate;
import java.time.LocalTime;
import java.time.format.DateTimeFormatter;
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
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fasterxml.jackson.core.JsonParseException;
import com.fasterxml.jackson.databind.JsonMappingException;

import kr.spring.offclass.service.OffclassService;
import kr.spring.offclass.vo.OffTimetableVO;
import kr.spring.offclass.vo.OfflikeVO;

@Controller
public class OffclassAjaxController {

	private static final Logger logger= LoggerFactory.getLogger(OffclassAjaxController.class);
	
	@Autowired
	private OffclassService offclassService;
	
	//클래스 등록
	@RequestMapping("/offclass/offTimetableAjax.do")
	@ResponseBody
	public Map<String, String> openClass(OffTimetableVO offTimtableVO,
										 HttpSession session,HttpServletRequest request) throws JsonParseException, JsonMappingException, IOException{
		
		//RequestBody:json 기반 메세지의 경우 사용
		Map<String, String> map = new HashMap<String, String>();

		logger.info("<<잘보내지는지 확인>>"+offTimtableVO);
		System.out.println(offTimtableVO);
		ArrayList<OffTimetableVO> list =(ArrayList<OffTimetableVO>)session.getAttribute("list");
		if(list!=null) {
			if(offTimtableVO!=null) {
				for(int i=0;i<list.size();i++) {
					OffTimetableVO list_offTimetable= list.get(i);
					if(list_offTimetable.getTime_date().equals(offTimtableVO.getTime_date())) {//동일한 날짜에
						//String -> time으로 변경해서 비교
						DateTimeFormatter formatter = DateTimeFormatter.ofPattern("HH:mm");
						
						if((LocalTime.parse(list_offTimetable.getTime_start(), formatter).isBefore(LocalTime.parse(offTimtableVO.getTime_start(), formatter)) 
								&& LocalTime.parse(list_offTimetable.getTime_end(), formatter).isAfter(LocalTime.parse(offTimtableVO.getTime_start(), formatter)))
							|| (LocalTime.parse(list_offTimetable.getTime_start(), formatter).isBefore(LocalTime.parse(offTimtableVO.getTime_end(), formatter))  
									&& LocalTime.parse(list_offTimetable.getTime_end(), formatter).isAfter(LocalTime.parse(offTimtableVO.getTime_end(), formatter)))
							|| (LocalTime.parse(list_offTimetable.getTime_start(), formatter).isAfter(LocalTime.parse(offTimtableVO.getTime_end(), formatter))  
									&& LocalTime.parse(list_offTimetable.getTime_end(), formatter).isBefore(LocalTime.parse(offTimtableVO.getTime_end(), formatter)))
							|| (LocalTime.parse(list_offTimetable.getTime_start(), formatter).isAfter(LocalTime.parse(offTimtableVO.getTime_end(), formatter))  
									&& LocalTime.parse(list_offTimetable.getTime_end(), formatter).isBefore(LocalTime.parse(offTimtableVO.getTime_end(), formatter)))) {
							//list에 있는 시작하는 시간이 입력한 시작하는 시간보다 전에 존재&& list에 끝나는 시간이 들어온 시작하는 시간보다 늦게 존재할 경우
							//또는 list에 있는 시작하는 시간이 입력한 끝나는 시간보다 전에 존재 && list에 끝나는 시간이 들어온 끝나는 시간보다 늦게 존재할 경우
							//즉,, start< <end 사이에 start 시간이나 end 시간을 넣을 경우
							map.put("result", "timeDuplicated");//시간 중복
							return map;
						}
					}
				}
				list.add(offTimtableVO);
				session.setAttribute("list", list);
				
			}
		}else {
			ArrayList<OffTimetableVO> list2 = new ArrayList<OffTimetableVO>();
			list2.add(offTimtableVO);
			session.setAttribute("list", list2);

			map.put("result", "success");
		}
		return map;
	}
	
	//클래스 등록 취소
	@RequestMapping("/offclass/offTimetableDeleteAjax.do")
	@ResponseBody
	public Map<String, String> DeleteClass(HttpSession session,HttpServletRequest request,@RequestParam(value="index") int index){
	
		Map<String, String> map = new HashMap<String, String>();
		logger.info("<<지우기 잘보내지는지 확인 index>>"+index);
		ArrayList<OffTimetableVO> list =(ArrayList<OffTimetableVO>)session.getAttribute("list");
		if(index!=-1) {
			list.remove(index);
			if(list.isEmpty()) {
				map.put("result", "noClass");
				return map;
			}
			session.setAttribute("list", list);
		}
		map.put("result", "success");
		
		return map;
	}
	
	//찜하기 기능
	@RequestMapping("/offclass/like.do")
	@ResponseBody
	public Map<String, String> likeForm(int off_num,HttpSession session){
		Integer user_num= (Integer)session.getAttribute("session_user_num");
		
		logger.info("<<확인 - off_num>>"+off_num);
		Map<String, String> map = new HashMap<String, String>();
		if(user_num==null) {
			map.put("result","logout");
		}else {
			OfflikeVO offLikeVO = offclassService.selectLike(user_num, off_num);
			if(offLikeVO!=null) {//이미 추천한 경우
				offclassService.deleteLike(offLikeVO.getOfflike_num());
				map.put("result", "cancelLike");
			}else {
				offclassService.insertLike(user_num, off_num);
				map.put("result", "success");
			}
		}
		return map;
	}
	
	//찜하기 Count
	@RequestMapping("/offclass/countLike.do")
	@ResponseBody
	public Map<String, Object> likeCount(int off_num){
		
		logger.info("<<확인 - off_num>>"+off_num);
		Map<String,Object> mapJson = new HashMap<String, Object>();
		int count = offclassService.selectLikeCount(off_num);
		mapJson.put("count", count);
		
		return mapJson;
	}
	
}
