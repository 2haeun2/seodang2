package kr.spring.onclass.service;

import java.util.List;
import java.util.Map;

import kr.spring.onclass.vo.OnclassVO;

public interface OnclassService {
	public int selectRowCount(Map<String,Object> map);
	public void insertOnclass(OnclassVO onclassVO);
	public int getOnclassCount();
	public List<OnclassVO> selectList(Map<String,Object> map);
	public OnclassVO getOnclass(int num);
	public void updateOnclass(OnclassVO onclassVO);
	public void deleteOnclass(int on_num);
	public OnclassVO selectOnclass(Integer on_num);
}
