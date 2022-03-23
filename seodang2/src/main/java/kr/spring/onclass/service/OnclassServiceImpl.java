package kr.spring.onclass.service;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.RequestParam;

import kr.spring.onclass.dao.OnclassMapper;
import kr.spring.onclass.vo.OnclassVO;
import kr.spring.onclass.vo.OnlikeVO;
import kr.spring.onclass.vo.OstarVO;


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

	@Override
	public OnlikeVO selectLike(Integer user_num,int on_num) {
		// TODO Auto-generated method stub
		return onclassMapper.selectLike(user_num,on_num);
	}

	@Override
	public void deleteLike(int onlike_num) {
		// TODO Auto-generated method stub
		onclassMapper.deleteLike(onlike_num);
	}

	@Override
	public void insertLike(Integer user_num,int on_num) {
		// TODO Auto-generated method stub
		onclassMapper.insertLike(user_num,on_num);
	}

	@Override
	public void updateHit(Integer on_num) {
		// TODO Auto-generated method stub
		onclassMapper.updateHit(on_num);
	}

	@Override
	public List<OnclassVO> hitList(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return onclassMapper.hitList(map);
	}

	@Override
	public OstarVO selectQna(Integer user_num) {
		// TODO Auto-generated method stub
		return onclassMapper.selectQna(user_num);
	}

	@Override
	public void insertqna(OstarVO ostarvo) {
		// TODO Auto-generated method stub
		onclassMapper.insertqna(ostarvo);
	}

	@Override
	public int avgQna(Integer on_num) {
		// TODO Auto-generated method stub
		return onclassMapper.avgQna(on_num);
	}

	@Override
	public List<OstarVO> listAll() {
		// TODO Auto-generated method stub
		return onclassMapper.listAll();
	}

}
