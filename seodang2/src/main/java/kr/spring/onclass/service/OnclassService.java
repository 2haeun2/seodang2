package kr.spring.onclass.service;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import kr.spring.onclass.vo.OnclassVO;
import kr.spring.onclass.vo.OnlikeVO;


public interface OnclassService {
	public int selectRowCount(Map<String,Object> map);
	public void insertOnclass(OnclassVO onclassVO);
	public int getOnclassCount();
	public List<OnclassVO> selectList(Map<String,Object> map);
	public OnclassVO getOnclass(int num);
	public void updateOnclass(OnclassVO onclassVO);
	public void deleteOnclass(int on_num);
	public OnclassVO selectOnclass(Integer on_num);
	
	//찜 누럴ㅆ는지 확인
	public OnlikeVO selectLike(int user_num,int on_num);
	public OnlikeVO deleteLike(int onlike_num);
	public OnlikeVO insertLike(int user_num,int on_num);
}
