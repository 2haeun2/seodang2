package kr.spring.cart.controller;

import java.util.List;

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
import org.springframework.web.servlet.ModelAndView;

import kr.spring.cart.dao.OrderMapper;
import kr.spring.cart.service.CartService;
import kr.spring.cart.service.OrderService;
import kr.spring.cart.vo.CartVO;
import kr.spring.cart.vo.OrderDetailVO;
import kr.spring.cart.vo.OrderVO;
import kr.spring.user.service.UserService;
import kr.spring.user.vo.UserVO;

@Controller
public class OrderController {

	//로그처리 준비
	private static final Logger logger = LoggerFactory.getLogger(CartController.class);
	
	//(1) 의존관계 주입
	@Autowired
	private OrderService orderService;
	@Autowired
	private CartService cartService;
	@Autowired
	private UserService userService;
	
	
	
	//(2) 주문 화면
	@RequestMapping("/cart/orderForm.do")
	public ModelAndView orderForm(HttpSession session) {
		
		ModelAndView mav = new ModelAndView();
		
		// 로그인이 되어있지 않은경우
		Integer user_num = (Integer)session.getAttribute("session_user_num");
		if(user_num == null) {
			mav.setViewName("redirect:/user/login.do");
			return mav;
		}
		
		// 로그인이 되어있는 경우 
		List<CartVO>list = cartService.getCartList(user_num);	//user_num에 해당하는 전체 장바구니 데이터를 뽑아옴
		
		for(int i=0; i<list.size(); i++) {
			if(list.get(i).getClass_kind().equals("on")) {	//list에 OnclassVO담기   &  (list에 sub_total담기)
				list.get(i).setOnclassVO(cartService.getOnclass(list.get(i).getClass_num()));
				list.get(i).setSub_total(list.get(i).getOnclassVO().getOn_price()*list.get(i).getOrder_quantity());
			}
			else if(list.get(i).getClass_kind().equals("off")) {	//list에 OffclassVO담기   &  (list에 sub_total담기)
				list.get(i).setOffclassVO(cartService.getOffclass(list.get(i).getClass_num()));
				list.get(i).setSub_total(list.get(i).getOffclassVO().getOff_price()*list.get(i).getOrder_quantity());
			}
			else if(list.get(i).getClass_kind().equals("kit")) {	//list에 kitVO담기   &  list에 sub_total담기
				list.get(i).setKitVO(cartService.getKit(list.get(i).getClass_num()));
				list.get(i).setSub_total(list.get(i).getKitVO().getKit_price()*list.get(i).getOrder_quantity());
			}
		}

		//<3> request에 데이터 저장
		mav.setViewName("orderForm");
		mav.addObject("user_num", user_num);	
		mav.addObject("list", list);
		return mav;
	}
	
	
	//(3-1) OrderForm - OrderVO 초기화
	@ModelAttribute
	public OrderVO initCommand() {
		return new OrderVO();
	}
	
	//(3-2) 주문등록 (VO 유효성체크 ver)
	@GetMapping("/cart/order.do")
	public String form(HttpSession session, Model model) {
		
		Integer user_num = (Integer)session.getAttribute("session_user_num");
		UserVO userVO = userService.selectUser(user_num);	//회원가입된 user의 정보 (나중에 placeholder로 뿌리기)
		model.addAttribute("userVO", userVO);

		return "orderForm";
	}	
	
	//(3-3) 주문등록 처리
	@PostMapping("/cart/order.do")
	public String submit(@Valid OrderVO orderVO, BindingResult result, HttpSession session, Model model) {
		
		logger.info("<<1. 들어오는 orderVO확인 >>: "+orderVO);
		
		//로그인체크
		Integer user_num = (Integer)session.getAttribute("session_user_num");
		if(user_num == null) {
			return "redirect:/user/login.do";
		}
		
		
		// item_name만들어주기
		List<CartVO>list = cartService.getCartList(user_num);
		for(int i=0; i<list.size(); i++) {
			if(list.get(i).getClass_kind().equals("on")) {	//list에 OnclassVO담기   &  (list에 sub_total담기)
				list.get(i).setOnclassVO(cartService.getOnclass(list.get(i).getClass_num()));
				list.get(i).setSub_total(list.get(i).getOnclassVO().getOn_price()*list.get(i).getOrder_quantity());
			}
			else if(list.get(i).getClass_kind().equals("off")) {	//list에 OffclassVO담기   &  (list에 sub_total담기)
				list.get(i).setOffclassVO(cartService.getOffclass(list.get(i).getClass_num()));
				list.get(i).setSub_total(list.get(i).getOffclassVO().getOff_price()*list.get(i).getOrder_quantity());
			}
			else if(list.get(i).getClass_kind().equals("kit")) {	//list에 kitVO담기   &  list에 sub_total담기
				list.get(i).setKitVO(cartService.getKit(list.get(i).getClass_num()));
				list.get(i).setSub_total(list.get(i).getKitVO().getKit_price()*list.get(i).getOrder_quantity());
			}
		}
		
		String item_name = "";
		if(list.size()==1) {
			if(list.get(0).getClass_kind().equals("on")) {
				item_name = list.get(0).getOnclassVO().getOn_name();
			}else if(list.get(0).getClass_kind().equals("off")) {
				item_name = list.get(0).getOffclassVO().getOff_name();
			}else if(list.get(0).getClass_kind().equals("kit")) {
				item_name = list.get(0).getKitVO().getKit_name();
			}
		}else {
			if(list.get(0).getClass_kind().equals("on")) {
				item_name = list.get(0).getOnclassVO().getOn_name()+" 외 "+ (list.size()-1)+"건";
			}else if(list.get(0).getClass_kind().equals("off")) {
				item_name = list.get(0).getOffclassVO().getOff_name()+" 외 "+ (list.size()-1)+"건";
			}else if(list.get(0).getClass_kind().equals("kit")) {
				item_name = list.get(0).getKitVO().getKit_name()+" 외 "+ (list.size()-1)+"건";
			}
		}
		
		int order_num = orderService.orderSequence();
		
		orderVO.setOrder_num(order_num);
		orderVO.setItem_name(item_name);
		orderVO.setUser_num(user_num);
		
		logger.info("<<주문확인>>"+orderVO);
		
		if(result.hasErrors()) {
			return form(session, model);	//*******model인자 고쳐야한다.********
		}
		
		//oorder테이블에 orderVO(장바구니주문)데이터 insert
		orderService.insertOrder(orderVO);
		logger.info("<<oorder테이블에 Insert완료 >>");
		
		//oorder_detail테이블에 orderVO(장바구니주문)데이터 목록으로 insert
		OrderDetailVO detailVO = new OrderDetailVO();
		
		for(int i=0; i<list.size(); i++) {
			if(list.get(i).getClass_kind().equals("on")) {
				detailVO.setItem_name(list.get(i).getOnclassVO().getOn_name());
				detailVO.setItem_price(list.get(i).getOnclassVO().getOn_price());
				detailVO.setStatus(5);//배송 및 수강 상태 (1:배송대기 /2:배송준비중 /3:배송중 /4:배송완료 /5:수강신청/6:수강중/7:수강완료/8:주문취소)
			}else if(list.get(i).getClass_kind().equals("off")) {
				detailVO.setItem_name(list.get(i).getOffclassVO().getOff_name());
				detailVO.setItem_price(list.get(i).getOffclassVO().getOff_price());
				detailVO.setStatus(5);//배송 및 수강 상태 (1:배송대기 /2:배송준비중 /3:배송중 /4:배송완료 /5:수강신청/6:수강중/7:수강완료/8:주문취소)
			}else if(list.get(i).getClass_kind().equals("kit")) {
				detailVO.setItem_name(list.get(i).getKitVO().getKit_name());
				detailVO.setItem_price(list.get(i).getKitVO().getKit_price());
				detailVO.setStatus(1);	//배송 및 수강 상태 (1:배송대기 /2:배송준비중 /3:배송중 /4:배송완료 /5:수강신청/6:수강중/7:수강완료/8:주문취소)
			}
			detailVO.setClass_kind(list.get(i).getClass_kind());
			detailVO.setClass_num(list.get(i).getClass_num());
			detailVO.setItem_total(list.get(i).getSub_total());
			detailVO.setOrder_quantity(list.get(i).getOrder_quantity());
			detailVO.setOrder_num(orderVO.getOrder_num());	
			orderService.insertOrderDetail(detailVO);
		}
		logger.info("<<oorder_detail테이블에 Insert완료 >>");
		
		
		// 주문시 재고수 차감 
		//해당 order_num의 order_detail 데이터들에 접근해서 order_quantity를 읽고,
		//해당하는 order_quantity만큼 kit의 수량(kit_quantity)를 update
		//orderVO.setOrder_num(order_num);  
		
		//1. 해당 order_num에 해당하는 order_detail의 정보 모두 읽어오기
		List<OrderDetailVO>detailList = orderService.getDetailList(order_num);
		
		//2. 읽어온 order_detail의 데이터 list들을 for문을 돌면서 order_quantity(주문수량)를 구한 후
		//   해당 주문수량만큼, 해당 class_num의 재고수량을 차감
		for(int i=0; i<detailList.size(); i++) {
			int order_quantity = detailList.get(i).getOrder_quantity();
			int class_num = detailList.get(i).getClass_num();
			
			CartVO transVO = new CartVO();
			transVO.setOrder_quantity(order_quantity);
			transVO.setClass_num(class_num);
			
			
			if(detailList.get(i).getClass_kind().equals("kit")) {
				// kit주문시 재고수 차감
				orderService.updateKitQuantity(transVO);
				logger.info("<< kit재고수 차감 완료 >>");
			}else if(detailList.get(i).getClass_kind().equals("off")) {
				// 오프라인클래스 주문시 정원(off_limit) 차감
				orderService.updateOffQuantity(class_num);
				logger.info("<< 오프클래스 정원 차감 완료 >>");
			}
		}

		//해당 user_num에 해당하는 order테이블의 orderVO리스트 모두 읽어오기
		List<OrderVO>orderList = orderService.getOrderList(user_num);
		model.addAttribute("orderList", orderList); 
		logger.info("<< orderList확인 >>" + orderList);
		
		model.addAttribute("detailList", detailList);
		logger.info("<< detailList확인 >>" + detailList);

		return "orderList";	//주문내역 화면 
	}
	
	
	//(4) 주문목록 
	@RequestMapping("/cart/orderList.do")
	public String list(HttpSession session, Model model) {
		
		//로그인체크
		Integer user_num = (Integer)session.getAttribute("session_user_num");
		if(user_num == null) {
			return "redirect:/user/login.do";
		}
		
		//해당 user_num에 해당하는 order테이블의 orderVO리스트 모두 읽어오기
		List<OrderVO>orderList = orderService.getOrderList(user_num);
		model.addAttribute("orderList", orderList); 
		logger.info("<< orderList확인 >>" + orderList);

		
		return "orderList";
	}
	
	//(5) 주문내역 상세
	@RequestMapping("/cart/orderDetail.do")
	public String orderList(HttpSession session, OrderVO orderVO, Model model) {
		
		//로그인체크
		Integer user_num = (Integer)session.getAttribute("session_user_num");
		if(user_num == null) {
			return "redirect:/user/login.do";
		}
		logger.info("<< orderVO확인 >>" + orderVO);
		
		
		// order_num에 해당하는 order_detail데이터 전부 출력
		List<OrderDetailVO> detailList = orderService.getDetailList(orderVO.getOrder_num());
		
		model.addAttribute("detailList", detailList);
		logger.info("<< detailList확인 >>" + detailList);
		
		return "orderDetail";
	}
		
	
}
