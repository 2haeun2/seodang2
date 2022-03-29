package kr.spring.offclass.service;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;

import kr.spring.offclass.vo.OffTimetableVO;
import kr.spring.offclass.vo.OffclassVO;
import kr.spring.offclass.vo.OfflikeVO;

public interface OffclassService {
	//부모글	
	public List<OffclassVO> selectListOffClass(Map<String, Object> map);
	public int selectRowCount(Map<String, Object> map);
	public void insertOffClass(OffclassVO offclass,List<OffTimetableVO> list);
	public OffclassVO selectOffClass(Integer off_num);
	public void updateOffClass(OffclassVO offclass);
	public void deleteOffClass(Integer off_num);
	public void deleteFile(Integer off_num);
	
	//찜기능
	public OfflikeVO insertLike(Integer user_num,Integer off_num);
	public OfflikeVO deleteLike(Integer offlike_num);
	public OfflikeVO selectLike(Integer user_num,Integer off_num);
	public int selectLikeCount(Integer off_num);
}
