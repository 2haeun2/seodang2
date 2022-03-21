package kr.spring.offclass.dao;

import java.util.List;
import java.util.Map;

import kr.spring.offclass.vo.OffclassVO;

public interface OffclassMapper {
	//부모글	
	public List<OffclassVO> selectList(Map<String, Object> map);
	public int selectRowCount(Map<String, Object> map);
	public void insertOffClass(OffclassVO offclass);
	public OffclassVO selectOffClass(Integer off_num);
	public void updateHit(Integer off_num);
	public void updateOffClass(OffclassVO offclass);
	public void deleteOffClass(Integer off_num);
	public void deleteFile(Integer off_num);
}
