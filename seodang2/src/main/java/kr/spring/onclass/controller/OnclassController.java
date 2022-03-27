package kr.spring.onclass.controller;

import java.net.http.HttpRequest;
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
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import kr.spring.myclass.vo.PaymentVO;
import kr.spring.onclass.service.OnclassService;
import kr.spring.onclass.vo.OnclassVO;
import kr.spring.user.controller.UserController;
import kr.spring.user.service.UserService;
import kr.spring.user.vo.UserVO;
import kr.spring.util.PagingUtil;

@Controller
public class OnclassController {
	public static final Logger logger = LoggerFactory.getLogger(UserController.class);
	@Autowired
	private OnclassService onclassService;
	@Autowired
	private UserService userService;
	
	@ModelAttribute
	public OnclassVO initCommand() {
		return new OnclassVO();
	}
	
	//온라인 클래스 목록
	@RequestMapping("/onclass/onclassList.do")
	public ModelAndView process(
			@RequestParam(value="pageNum",defaultValue="1")
			int currentPage,
			@RequestParam(value="keyfield",defaultValue="")
			String keyfield,
			@RequestParam(value="keyword",defaultValue="")
			String keyword, @RequestParam(value="category",defaultValue="0") int category
			) {
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("keyfield", keyfield);
		map.put("keyword", keyword);
		map.put("category", category);
		
		int count = onclassService.selectRowCount(map);
		
		PagingUtil page = new PagingUtil(keyfield,keyword,
                currentPage,count,6,10,"onclassList.do");

		map.put("start",page.getStartCount());
		map.put("end", page.getEndCount());
		
		//카테고리 로그
		System.out.println(category);
		
		List<OnclassVO> list = null;
			if(count > 0) {
				list = onclassService.selectList(map);
			}

		ModelAndView mav = new ModelAndView();
		mav.setViewName("onclassList");
		mav.addObject("count", count);
		mav.addObject("list",list);
		mav.addObject("pagingHtml", page.getPagingHtml());

		return mav;
	}
	
	//수업 등록
	@GetMapping("/onclass/onclassInsert.do")
	public String insertForm() {
		return "onclassInsert";
	}
	
	@PostMapping("/onclass/onclassInsert.do")
	public String insert(@Valid OnclassVO onclassVO,BindingResult result,HttpSession session) {
		
		if(result.hasErrors()) {
			return insertForm();
		}
		
		Integer user_num = (Integer)session.getAttribute("session_user_num");
		onclassVO.setUser_num(user_num);
		onclassService.insertOnclass(onclassVO);
		
		return "redirect:/onclass/onclassList.do";
	}
	
	
	@GetMapping("/onclass/onclassModify.do")
	public String updateForm(@RequestParam int on_num, Model model) {
		OnclassVO onclassVO = onclassService.selectOnclass(on_num);
		model.addAttribute("onclassVO",onclassVO);
		
		return "onclassModify";		
	}
	@PostMapping("/onclass/onclassModify.do")
	public String update(@Valid OnclassVO onclassVO,BindingResult result,HttpServletRequest request,Model model) {
		
		if(result.hasErrors()) {
			return "onclassModify";
		}
		
		onclassService.updateOnclass(onclassVO);

		model.addAttribute("message", "글 수정 완료!!");
		model.addAttribute("url", request.getContextPath() + "/onclass/onclassList.do");
		
		return "common/resultView";
	}
	
	@GetMapping("/onclass/onclassDelete.do")
	public String delete(int on_num,OnclassVO onV) {
		onV.setOn_num(on_num);
		return "onclassDelete";
	}
	
	@PostMapping("/onclass/onclassDelete.do")
	public String deleteCheck(UserVO uvo,OnclassVO vo,String deletePasswd,HttpSession session,HttpServletRequest request,Model model) {
		Integer user_num = (Integer)session.getAttribute("session_user_num");
		int on_num = vo.getOn_num();
		UserVO zvo = userService.selectUser(user_num);
		if(deletePasswd.equals(zvo.getPasswd())) {
			onclassService.deleteOnclass(on_num);
			model.addAttribute("message", "게시물 삭제 완료");
			model.addAttribute("url", request.getContextPath() + "/onclass/onclassList.do");
		}else {
			model.addAttribute("message", "게시물 삭제 실패");
			model.addAttribute("url", request.getContextPath() + "/onclass/onclassList.do");
		}
		return "common/resultView";
	}
	
	@GetMapping("/onclass/onclassDetail.do")
	public String detailForm(Integer on_num,Model model,HttpSession session) {
		Integer user_num = (Integer)session.getAttribute("session_user_num");
		onclassService.updateHit(on_num);
		OnclassVO oVO = onclassService.selectOnclass(on_num);
		oVO.setAvgqna(onclassService.avgQna(on_num));
		//개인프로필 저장
		UserVO oUser = onclassService.getProfile(user_num);
		model.addAttribute("onclass",oVO);
		//프로필 뿌림
		model.addAttribute("ouser",oUser);
		return "onclassDetail";
	}
	
	@RequestMapping("/onclass/imageView.do")
	public ModelAndView viewImage(@RequestParam int on_num) {
		OnclassVO onclass = onclassService.selectOnclass(on_num);
		ModelAndView mav = new ModelAndView();
		mav.setViewName("imageView");
		mav.addObject("imageFile",onclass.getUploadfile());
		mav.addObject("filename", onclass.getFilename());
		return mav;
	}

}

















