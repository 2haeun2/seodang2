package kr.spring.myclass.service;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Insert;

import kr.spring.myclass.vo.MyclassVO;
import kr.spring.myclass.vo.PaymentVO;

public interface MyclassService {
	public int selectRowCount(Map<String,Object> map);
	public List<MyclassVO> selectList(Map<String,Object> map);
	
	//사용자가 구매한 강의
	public void insertRegister(PaymentVO paymentVO);
}
