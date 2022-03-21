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

	@Override
	public OqnaVO selectOqna(Integer Oqna_num) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void updateOqnaHit(Integer Oqna_num) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void updateOqna(OqnaVO Oqna) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void deleteOqna(int num) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void deleteOqnaFile(Integer Oqna_num) {
		// TODO Auto-generated method stub
		
	}

}
