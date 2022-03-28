package kr.spring.offclass.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;

import kr.spring.offclass.vo.OffTimetableVO;
import kr.spring.offclass.vo.OffclassVO;

public interface OffclassMapper {
	//부모글
	@Select("SELECT offclass_seq.nextval FROM  dual")
	public int selectOff_num();
	public void insertOffClass(OffclassVO offclass);
	public void insertListOffTime(List<OffTimetableVO> list);
	public List<OffclassVO> selectListOffClass(Map<String, Object> map);
	public int selectRowCount(Map<String, Object> map);
	@Select("SELECT * FROM offclass o JOIN ouser_detail d ON o.user_num = d.user_num WHERE user_num=#{user_num}")
	public OffclassVO selectOffClass(Integer off_num);
	public void updateOffClass(OffclassVO offclass);
	public void deleteOffClass(Integer off_num);
	public void deleteFile(Integer off_num);
}
