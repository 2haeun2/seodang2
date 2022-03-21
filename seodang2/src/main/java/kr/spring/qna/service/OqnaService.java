package kr.spring.qna.service;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Insert;

import kr.spring.qna.vo.OqnaVO;

public interface OqnaService {

	//[ 부모글 ] 
	
	//글 목록
	public List<OqnaVO> getOqnaList(Map<String,Object> map);
	
	//글 목록 - rowCount
	public int selectOqnaRowCount(Map<String,Object> map);
	
	/*=============1.글등록==============*/
	public void insertOqna(OqnaVO Oqna);
	
	/*=============글상세==============*/
	public OqnaVO selectOqna(Integer Oqna_num);
	
	/*=============조회수==============*/
	public void updateOqnaHit(Integer Oqna_num);
	
	/*=============글수정(OnqnaMapper.xml에 명시)==============*/
	public void updateOqna(OqnaVO Oqna);
	
	/*=============글삭제==============*/
	public void deleteOqna(int num);
	
	/*=============파일삭제==============*/
	public void deleteOqnaFile(Integer Oqna_num);
	
	
	
	//[ 댓글 ] 
	
}
