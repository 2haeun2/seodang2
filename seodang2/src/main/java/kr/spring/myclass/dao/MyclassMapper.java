package kr.spring.myclass.dao;

import java.util.List;
import java.util.Map;

import kr.spring.myclass.vo.MyclassVO;
import kr.spring.onclass.vo.OnclassVO;

public interface MyclassMapper {
	public List<MyclassVO> selectList(Map<String,Object> map);
	public int selectRowCount(Map<String,Object> map);

}
