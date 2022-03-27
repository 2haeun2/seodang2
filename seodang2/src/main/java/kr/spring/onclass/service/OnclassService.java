package kr.spring.onclass.service;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import kr.spring.onclass.vo.OnclassVO;
import kr.spring.onclass.vo.OnlikeVO;
import kr.spring.onclass.vo.OstarVO;
import kr.spring.qna.vo.OqnaReplyVO;
import kr.spring.user.vo.UserVO;



public interface OnclassService {
	public int selectRowCount(Map<String,Object> map);
	public void insertOnclass(OnclassVO onclassVO);
	public int getOnclassCount();
	public List<OnclassVO> selectList(Map<String,Object> map);
	public List<OnclassVO> hitList(Map<String,Object> map);
	public OnclassVO getOnclass(int num);
	public void updateOnclass(OnclassVO onclassVO);
	public void deleteOnclass(Integer on_num);
	public OnclassVO selectOnclass(Integer on_num);
	public void updateHit(Integer on_num);
	//프로필 정보 출력
	public UserVO getProfile(int user_num);
	//찜 누럴ㅆ는지 확인
	public OnlikeVO selectLike(Integer user_num,Integer on_num);
	public void deleteLike(int onlike_num);
	public void insertLike(Integer user_num,Integer on_num);
	
	//평점
	public OstarVO selectQna(Integer user_num);
	public void insertqna(OstarVO ostarvo);
	public int avgQna(Integer on_num);
	//리스트
	public List<OstarVO> listALL(Map<String,Object> map);
	
}
