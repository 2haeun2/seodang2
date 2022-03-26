package kr.spring.myclass.service;

import java.util.List;
import java.util.Map;

import kr.spring.myclass.vo.MyclassVO;
import kr.spring.onclass.vo.OnclassVO;

public interface MyclassService {
	public int selectRowCount(Map<String,Object> map);
	public List<MyclassVO> selectList(Map<String,Object> map);
}
