package kr.spring.qna.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import kr.spring.qna.vo.OnqnaVO;
import kr.spring.qna.vo.OqnaVO;

public interface OqnaMapper {

	//[ 부모글 ] 
	
	/*=============글목록==============*/
	public List<OqnaVO> getOqnaList(Map<String,Object> map);
	
	/*=============글 목록 - rowCount==============*/
	public int selectOqnaRowCount(Map<String,Object> map);
	
	/*=============글등록==============*/
	@Insert("INSERT INTO oqna(qna_num, user_num, title, content, uploadfile, filename) "
			+ "VALUES (oqna_seq.nextval,#{user_num},#{title},#{content},#{uploadfile},#{filename})")
	public void insertOqna(OqnaVO Oqna);
	
	/*=============글상세==============*/
	@Select("SELECT*FROM oqna q JOIN ouser u ON q.user_num=u.user_num JOIN ouser_detail d ON u.user_num=d.user_num "
			+ "WHERE q.qna_num=#{qna_num}")
	public OqnaVO selectOqna(Integer qna_num);
	
	
	/*=============글수정(OnqnaMapper.xml에 명시)==============*/
	public void updateOqna(OqnaVO Oqna);
	
	/*=============글삭제==============*/
	@Delete("DELETE FROM oqna WHERE qna_num=#{qna_num}")
	public void deleteOqna(int qna_num);
	
	/*=============파일삭제==============*/
	@Update("UPDATE oqna SET uploadfile='', filename='' WHERE qna_num=#{qna_num}")
	public void deleteOqnaFile(Integer qna_num);
	
	
	
	//[ 댓글 ] 
	
}
