package kr.spring.myclass.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import kr.spring.myclass.vo.MyclassVO;
import kr.spring.myclass.vo.PaymentVO;

public interface MyclassMapper {
	public List<MyclassVO> selectList(Map<String,Object> map);
	public int selectRowCount(Map<String,Object> map);
	
	//구매한 과목 저장
	//구매목록 시퀀스 생성
	@Select("select onreg_seq.nextval from dual")
	public int selectSeq();
	//onreg 저장
	@Insert("insert into onreg(onreg_num,user_num) values(#{onreg_num},#{user_num})")
	public void insertRegister(PaymentVO paymentVO);
	//onreg_detail 저장
	@Insert("insert into onreg_detail(onreg_num,on_num,on_payment,on_status) "
			+ "values(#{onreg_num},#{on_num},#{on_payment},#{on_status})")
	public void insertDetailRegister(PaymentVO paymentVO);
	//중복된 강의 확인
	@Select("select count(*) from onreg a join onreg_detail z on a.onreg_num = z.onreg_num "
			+ "where z.on_num = #{on_num} and a.user_num = #{user_num}")
	public int overlap(@Param("on_num") int on_num,@Param("user_num") int user_num);
}
