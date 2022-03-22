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
	public List<OffclassVO> selectListOffClass(Map<String, Object> map);
	public int selectRowCount(Map<String, Object> map);
	@Insert("INSERT INTO offclass (off_num,category_num,off_name,off_limit,off_price,off_content,off_filename,off_uploadfile,user_num) "
						+ "VALUES (#{off_num},#{category_num},#{off_name},#{off_limit},#{off_price},#{off_content},#{off_filename},#{off_uploadfile},#{user_num})")
	public void insertOffClass(OffclassVO offclass);
	public List<OffTimetableVO> insertListOffTime(Map<String, Object> map);
	public OffclassVO selectOffClass(Integer off_num);
	public void updateHit(Integer off_num);
	public void updateOffClass(OffclassVO offclass);
	public void deleteOffClass(Integer off_num);
	public void deleteFile(Integer off_num);
}
