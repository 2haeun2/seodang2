package kr.spring.kit.service;

import java.util.List;
import java.util.Map;

import kr.spring.kit.vo.KitVO;

public interface KitService {
	//상품등록
	public List<KitVO> selectList(Map<String,Object> map);
	public int selectRowCount(Map<String, Object> map);
	public void insertKit(KitVO kit);
	public KitVO selectKit(Integer kit_num);
	public void updateKit(KitVO kit);
	public void deleteKit(Integer kit_num);


}
