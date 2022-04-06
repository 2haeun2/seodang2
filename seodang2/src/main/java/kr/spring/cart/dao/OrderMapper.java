package kr.spring.cart.dao;

import java.util.List;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import kr.spring.cart.vo.CartVO;
import kr.spring.cart.vo.OrderDetailVO;
import kr.spring.cart.vo.OrderVO;

public interface OrderMapper {

	//1. CartVO반환
	@Select("SELECT * FROM ocart WHERE cart_num =#{cart_num}")
	public CartVO searchCartVO(int cart_num);
	
	
	//2-1. order과 order_detail에서 사용할 공통 sequence 생성
	@Select("SELECT oorder_seq.nextval FROM dual")
	public int orderSequence();
	
	//2-2. 주문목록  등록(oorder)
	@Insert("INSERT INTO "
			+ "oorder(order_num, item_name, order_total, payment, receive_name, "
			+ "receive_post, receive_address1, receive_address2, receive_phone, notice, user_num) "
			+ "VALUES (#{order_num}, #{item_name}, #{order_total}, #{payment}, #{receive_name}, "
			+ "#{receive_post},#{receive_address1},#{receive_address2},#{receive_phone},#{notice},#{user_num})")
	public void insertOrder(OrderVO orderVO);
	
	//2-3. 주문목록 등록(oorder_detail)
	@Insert("INSERT INTO "
			+ "oorder_detail(odetail_num, class_num, item_name, item_price, item_total, order_quantity, order_num, class_kind, status) "
			+ "VALUES(odetail_seq.nextval, #{class_num}, #{item_name}, #{item_price}, #{item_total}, #{order_quantity}, #{order_num}, #{class_kind}, #{status})")
	public void insertOrderDetail(OrderDetailVO detailVO);
	
	//2-4. 주문번호(order_num)에 해당하는 oorder_detail의 상품정보 구하기 - (주문시 재고수 차감)
	@Select("SELECT * FROM oorder_detail WHERE order_num=#{order_num}")
	public List<OrderDetailVO> getDetailList(int order_num);
	
	//2-5. 해당 user_num의 orderVO 리스트 추출
	@Select("SELECT * FROM oorder WHERE user_num=#{user_num}")
	public List<OrderVO> getOrderList(int user_num);
	
	//2-6.  oorder_detail의 Kit 주문수량을 재고에서 차감 - (주문시 재고수 차감)
	@Update("UPDATE okit SET kit_quantity=kit_quantity-#{order_quantity} WHERE kit_num=#{class_num}")
	public void updateKitQuantity(CartVO transVO);
	
	//2-7.  oorder_detail의 오프클래스 주문수를 오프클래스 정원에서 차감 - (주문시 재고수 차감)
	@Update("UPDATE offclass SET off_limit=off_limit-1 WHERE off_num=#{class_num}")
	public void updateOffQuantity(int class_num);
}






















