package kr.spring.offclass.service;

import java.util.List;
import java.util.Map;

import kr.spring.offclass.vo.OffclassVO;

public interface OffclassService {
	//부모글	
	public List<OffclassVO> selectListOffClass(Map<String, Object> map);
	public int selectRowCount(Map<String, Object> map);
	public void insertOffClass(OffclassVO offclass);
	public OffclassVO selectOffClass(Integer off_num);
	public void updateOffClass(OffclassVO offclass);
	public void deleteOffClass(Integer off_num);
	public void deleteFile(Integer off_num);
}
