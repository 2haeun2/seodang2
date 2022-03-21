package kr.spring.onclass.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.spring.onclass.dao.OnclassMapper;
import kr.spring.onclass.vo.OnclassVO;

@Service
@Transactional
public class OnclassServiceImpl implements OnclassService{
	
	@Autowired
	OnclassMapper onclassMapper;
	
	@Override
	public void insertOnclass(OnclassVO onclassVO) {
		// TODO Auto-generated method stub
		onclassMapper.insertOnclass(onclassVO);
	}

	@Override
	public int getOnclassCount() {
		// TODO Auto-generated method stub
		return onclassMapper.getOnclassCount();
	}

	@Override
	public OnclassVO getOnclass(int num) {
		// TODO Auto-generated method stub
		return onclassMapper.getOnclass(num);
	}

	@Override
	public void updateOnclass(OnclassVO onclassVO) {
		// TODO Auto-generated method stub
		onclassMapper.updateOnclass(onclassVO);
	}

	@Override
	public void deleteOnclass(int on_num) {
		// TODO Auto-generated method stub
		onclassMapper.deleteOnclass(on_num);
	}

	@Override
	public int selectRowCount(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return onclassMapper.selectRowCount(map);
	}

	@Override
	public List<OnclassVO> selectList(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return onclassMapper.selectList(map);
	}

	@Override
	public OnclassVO selectOnclass(Integer on_num) {
		// TODO Auto-generated method stub
		return onclassMapper.selectOnclass(on_num);
	}

}
