package kr.spring.myclass.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.spring.myclass.dao.MyclassMapper;
import kr.spring.myclass.vo.MyclassVO;
import kr.spring.onclass.vo.OnclassVO;

@Service
@Transactional
public class MyclassServiceImpl implements MyclassService{
	
	@Autowired
	MyclassMapper myclassMapper;
	
	@Override
	public int selectRowCount(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return myclassMapper.selectRowCount(map);
	}

	@Override
	public List<MyclassVO> selectList(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return myclassMapper.selectList(map);
	}

}