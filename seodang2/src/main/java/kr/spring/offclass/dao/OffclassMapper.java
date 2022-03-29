package kr.spring.offclass.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;

import kr.spring.offclass.vo.OffTimetableVO;
import kr.spring.offclass.vo.OffclassVO;
import kr.spring.offclass.vo.OfflikeVO;

public interface OffclassMapper {
	//부모글
	@Select("SELECT offclass_seq.nextval FROM  dual")
	public int selectOff_num();
	public void insertOffClass(OffclassVO offclass);
	public void insertListOffTime(List<OffTimetableVO> list);
	public List<OffclassVO> selectListOffClass(Map<String, Object> map);
	public int selectRowCount(Map<String, Object> map);
	@Select("SELECT * FROM offclass o JOIN ouser_detail d ON o.user_num = d.user_num WHERE off_num=#{off_num}")
	public OffclassVO selectOffClass(Integer off_num);
	public void updateOffClass(OffclassVO offclass);
	public void deleteOffClass(Integer off_num);
	public void deleteFile(Integer off_num);
	
	//찜하기
	@Insert("INSERT INTO offlike (offlike_num,user_num,off_num,olike) VALUES (offlike_seq.nextval,#{user_num},#{off_num},1")
	public OfflikeVO insertLike(Integer user_num,Integer off_num);
	//찜하기 취소
	@Delete("DELETE offlike WHERE off_num=#{off_num}")
	public OfflikeVO deleteLike(Integer offlike_num);
	//찜눌렀는지 확인
	@Select("SELECT * FROM offlike WHERE user_num=#{user_num} and off_num=#{user_num}")
	public OfflikeVO selectLike(Integer user_num,Integer off_num);
	//찜하기 Count
	@Select("SELECT COUNT(*) FROM offlike WHERE off_num=#{off_num}")
	public int selectLikeCount(Integer off_num);
	
}
