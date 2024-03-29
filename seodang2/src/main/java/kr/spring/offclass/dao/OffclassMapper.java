package kr.spring.offclass.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import kr.spring.offclass.vo.OffTimetableVO;
import kr.spring.offclass.vo.OffclassVO;
import kr.spring.offclass.vo.OfflikeVO;
import kr.spring.offclass.vo.OffstarReplyVO;
import kr.spring.offclass.vo.OffstarVO;

public interface OffclassMapper {
	//부모글
	@Select("SELECT offclass_seq.nextval FROM  dual")
	public int selectOff_num();
	public void insertOffClass(OffclassVO offclass);
	//타임테이블 Insert
	public void insertListOffTime(List<OffTimetableVO> list);
	public List<OffclassVO> selectListOffClass(Map<String, Object> map);
	public int selectRowCount(Map<String, Object> map);
	@Select("SELECT * FROM offclass o JOIN ouser_detail d ON o.user_num = d.user_num WHERE off_num=#{off_num}")
	public OffclassVO selectOffClass(Integer off_num);
	public List<OffTimetableVO> selectListOffTimetable(Map<String, Object> map);
	@Select("SELECT DISTINCT time_date FROM off_timetable WHERE off_num=#{off_num} AND CONCAT(TO_CHAR(time_date,'YY/MM/DD '),time_start) >=TO_CHAR(SYSDATE,'YY/MM/DD HH24:MI') ORDER BY time_date")
	public List<OffTimetableVO> selectListOffTimeDate(int off_num);
	public void updateOffClass(OffclassVO offclass);
	@Delete("DELETE FROM off_timetable WHERE off_num=#{off_num} AND CONCAT(TO_CHAR(time_date,'YY/MM/DD '),time_start) >=TO_CHAR(SYSDATE,'YY/MM/DD HH24:MI')")
	public void deleteOffTimetable(int off_num);
	public void deleteOffClass(Integer off_num);
	
	//찜하기
	@Insert("INSERT INTO offlike (offlike_num,user_num,off_num,olike) VALUES (offlike_seq.nextval,#{user_num},#{off_num},1)")
	public void insertLike(@Param("user_num") Integer user_num,@Param("off_num") Integer off_num);
	//찜하기 취소
	@Delete("DELETE offlike WHERE offlike_num=#{offlike_num}")
	public void deleteLike(Integer offlike_num);
	//찜눌렀는지 확인
	@Select("SELECT * FROM offlike WHERE user_num=#{user_num} and off_num=#{off_num}")
	public OfflikeVO selectLike(@Param("user_num") Integer user_num,@Param("off_num") Integer off_num);
	//찜하기 Count
	@Select("SELECT COUNT(*) FROM offlike WHERE off_num=#{off_num}")
	public int selectLikeCount(Integer off_num);
	
	//후기 작성하기
	@Insert("INSERT INTO offstar (offstar_num,user_num,off_num,rating,text) VALUES (offstar_seq.nextval,#{user_num},#{off_num},#{rating},#{text})")
	public void insertOffReview(OffstarVO offstarVO);
	//후기 목록
	public List<OffstarVO> selectListOffReview(Map<String, Object> map);
	public int selectRowReviewCount(Map<String, Object> map);
	@Select("SELECT ROUND(avg(rating),1) FROM offstar WHERE off_num=#{off_num} ORDER BY offstar_num DESC")
	public float selectReviewRating(int off_num);
	@Select("SELECT * FROM offstar WHERE off_num=#{off_num} AND user_num=#{user_num}")
	public OffstarVO selectOffReview(Map<String, Object> map);
	@Update("UPDATE offstar SET rating=#{rating},text=#{text} WHERE offstar_num=#{offstar_num}")
	public void updateOffReview(OffstarVO offstarVO);
	@Delete("DELETE FROM offstar WHERE offstar_num=#{offstar_num}")
	public void deleteOffReview(int offstar_num);
	
	//후기 작성 댓글
	@Insert("INSERT INTO offstar_reply (offre_num,offstar_num,user_num,offre_content) VALUES (offstar_reply_seq.nextval,#{offstar_num},#{user_num},#{offre_content})")
	public void inserOffReviewReply(OffstarReplyVO offstarReplyVO);
	//후기 작성 답변 select
	@Select("SELECT * FROM offstar_reply r JOIN ouser_detail d ON r.user_num = d.user_num WHERE offstar_num=#{offstar_num}")
	public OffstarReplyVO selectOffReviewReply(int offstar_num);
	@Delete("DELETE FROM offstar_reply WHERE offstar_num=#{offstar_num}")
	public void deleteOffReviewReplyByOffstar(int offstar_num);
	@Update("UPDATE offstar_reply SET offre_content=#{offre_content} WHERE offre_num=#{offre_num}")
	public void updateOffReviewReply(OffstarReplyVO offstarReplyVO);
	@Delete("DELETE FROM offstar_reply WHERE offre_num=#{offre_num}")
	public void deleteOffReviewReply(int offre_num);
}
