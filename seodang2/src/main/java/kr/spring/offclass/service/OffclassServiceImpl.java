package kr.spring.offclass.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.spring.offclass.dao.OffclassMapper;
import kr.spring.offclass.vo.OffclassVO;

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
	public void insertOffClass(OffclassVO offclass) {
		offclass.setOff_num(offclassMapper.selectOff_num());
		offclassMapper.insertOffClass(offclass);
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


}
