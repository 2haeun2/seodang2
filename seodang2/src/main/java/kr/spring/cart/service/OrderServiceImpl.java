package kr.spring.cart.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.spring.cart.dao.OrderMapper;
import kr.spring.cart.vo.CartVO;
import kr.spring.cart.vo.OrderDetailVO;
import kr.spring.cart.vo.OrderVO;

@Service
public class OrderServiceImpl implements OrderService{

	//* 의존관계 주입
	@Autowired
	private OrderMapper orderMapper;
		
	
	@Override
	public CartVO searchCartVO(int cart_num) {
		return orderMapper.searchCartVO(cart_num);
	}

	@Override
	public int orderSequence() {
		return orderMapper.orderSequence();
	}
	
	@Override
	public void insertOrder(OrderVO orderVO) {
		orderMapper.insertOrder(orderVO);
	}

	@Override
	public void insertOrderDetail(OrderDetailVO detailVO) {
		orderMapper.insertOrderDetail(detailVO);
	}

	@Override
	public List<OrderDetailVO> getDetailList(int order_num) {
		return orderMapper.getDetailList(order_num);
	}

	@Override
	public void updateKitQuantity(CartVO transVO) {
		orderMapper.updateKitQuantity(transVO);
	}

	@Override
	public void updateOffQuantity(int class_num) {
		orderMapper.updateOffQuantity(class_num);
	}

	@Override
	public List<OrderVO> getOrderList(int user_num) {
		return orderMapper.getOrderList(user_num);
	}



}
