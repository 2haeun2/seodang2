package kr.spring.qna.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.spring.qna.dao.OqnaMapper;
import kr.spring.qna.vo.OqnaVO;

@Service
public class OqnaServiceImpl implements OqnaService{

	//(1)의존관계 주입
	@Autowired
	private OqnaMapper oqnaMapper;
	
	
	//(3-1) 글 목록
	@Override
	public List<OqnaVO> getOqnaList(Map<String, Object> map) {
		return oqnaMapper.getOqnaList(map);
	}

	//(3-2) 글 목록2
	@Override
	public int selectOqnaRowCount(Map<String, Object> map) {
		return oqnaMapper.selectOqnaRowCount(map);
	}

	//(2) oQna 글 등록
	@Override
	public void insertOqna(OqnaVO Oqna) {
		oqnaMapper.insertOqna(Oqna);
	}

	//(4) 글 상세
	@Override
	public OqnaVO selectOqna(Integer qna_num) {
		return oqnaMapper.selectOqna(qna_num);
	}

	//(6) 글 수정
	@Override
	public void updateOqna(OqnaVO Oqna) {
		oqnaMapper.updateOqna(Oqna);
	}

	//(7) 글 삭제
	@Override
	public void deleteOqna(int qna_num) {
		oqnaMapper.deleteOqna(qna_num);
	}
	
	//(5) 글 수정form - 파일 삭제
	@Override
	public void deleteOqnaFile(Integer qna_num) {
		oqnaMapper.deleteOqnaFile(qna_num);
	}

}
