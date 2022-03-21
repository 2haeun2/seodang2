package kr.spring.kit.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.spring.kit.dao.KitMapper;
import kr.spring.kit.vo.KitVO;

@Service
public class KitServiceImpl implements KitService{

	@Autowired
	private KitMapper kitMapper;

	
	@Override
	public List<KitVO> selectList(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int selectRowCount(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public void insertKit(KitVO kit) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public KitVO selectKit(Integer kit_num) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void updateKit(KitVO kit) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void deleteKit(Integer kit_num) {
		// TODO Auto-generated method stub
		
	}
	

	
	
}
