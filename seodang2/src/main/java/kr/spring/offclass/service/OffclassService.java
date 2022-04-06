package kr.spring.offclass.service;

import java.util.List;
import java.util.Map;

import kr.spring.offclass.vo.OffTimetableVO;
import kr.spring.offclass.vo.OffclassVO;
import kr.spring.offclass.vo.OfflikeVO;
import kr.spring.offclass.vo.OffstarReplyVO;
import kr.spring.offclass.vo.OffstarVO;

public interface OffclassService {
	//부모글	
	public List<OffclassVO> selectListOffClass(Map<String, Object> map);
	public int selectRowCount(Map<String, Object> map);
	public void insertOffClass(OffclassVO offclass,List<OffTimetableVO> list);
	public OffclassVO selectOffClass(Integer off_num);
	public List<OffTimetableVO> selectListOffTimetable(Map<String, Object> map);
	public List<OffTimetableVO> selectListOffTimeDate(int off_num);	
	public void updateOffClass(OffclassVO offclass,List<OffTimetableVO> list);
	public void deleteOffClass(Integer off_num);
	
	//찜기능
	public void insertLike(Integer user_num,Integer off_num);
	public void deleteLike(Integer offlike_num);
	public OfflikeVO selectLike(Integer user_num,Integer off_num);
	public int selectLikeCount(Integer off_num);
	
	//후기 
	public void insertOffReview(OffstarVO offstarVO);
	public List<OffstarVO> selectListOffReview(Map<String, Object> map);
	public int selectRowReviewCount(Map<String, Object> map);
	public float selectReviewRating(int off_num);
	public OffstarVO selectOffReview(Map<String, Object> map);
	public void updateOffReview(OffstarVO offstarVO);
	public void deleteOffReview(int offstar_num);

	public void inserOffReviewReply(OffstarReplyVO offstarReplyVO);
	public OffstarReplyVO selectOffReviewReply(int offstar_num);
}
