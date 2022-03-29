package kr.spring.offclass.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.spring.offclass.dao.OffclassMapper;
import kr.spring.offclass.vo.OffTimetableVO;
import kr.spring.offclass.vo.OffclassVO;
import kr.spring.offclass.vo.OfflikeVO;

@Service
@Transactional
public class OffclassServiceImpl implements OffclassService{
	
	@Autowired
	private OffclassMapper offclassMapper;

	@Override
	public List<OffclassVO> selectListOffClass(Map<String, Object> map) {
		return offclassMapper.selectListOffClass(map);
	}

	@Override
	public int selectRowCount(Map<String, Object> map) {
		return offclassMapper.selectRowCount(map);
	}

	@Override
	public void insertOffClass(OffclassVO offclass,List<OffTimetableVO> list) {
		offclass.setOff_num(offclassMapper.selectOff_num());
		offclassMapper.insertOffClass(offclass);
		for(int i=0;i<list.size();i++) {
			OffTimetableVO offTimetableVO=list.get(i);
			offTimetableVO.setOff_num(offclass.getOff_num());
		}
		offclassMapper.insertListOffTime(list);
	}

	@Override
	public OffclassVO selectOffClass(Integer off_num) {
		return offclassMapper.selectOffClass(off_num);
	}

	@Override
	public void updateOffClass(OffclassVO offclass) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void deleteOffClass(Integer off_num) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void deleteFile(Integer off_num) {
		// TODO Auto-generated method stub
		
	}

	//찜 기능
	@Override
	public OfflikeVO insertLike(Integer user_num, Integer off_num) {
		return offclassMapper.insertLike(user_num, off_num);
	}

	@Override
	public OfflikeVO deleteLike(Integer offlike_num) {
		return offclassMapper.deleteLike(offlike_num);
	}

	@Override
	public OfflikeVO selectLike(Integer user_num, Integer off_num) {
		return offclassMapper.selectLike(user_num, off_num);
	}

	@Override
	public int selectLikeCount(Integer off_num) {
		return offclassMapper.selectLikeCount(off_num);
	}



}
