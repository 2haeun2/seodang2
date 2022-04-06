package kr.spring.kit.service;

import java.util.List;
import java.util.Map;

import kr.spring.kit.vo.KitVO;
import kr.spring.onclass.vo.OnlikeVO;
import kr.spring.kit.vo.KitLikeVO;

public interface KitService {
	
	public List<KitVO> selectList(Map<String,Object> map);
	public int selectRowCount(Map<String, Object> map);
	public void insertKit(KitVO kit);
	public KitVO selectKit(Integer kit_num);
	public void updateHit(Integer kit_num);	
	public void updateKit(KitVO kit);
	public void deleteKit(Integer kit_num);
	public void deleteFile(Integer kit_num);
	
	//좋아요
	public KitLikeVO selectKitLike(Integer user_num,Integer kit_num);
	public void insertKitLike(Integer user_num, Integer kit_num);
	public void deleteKitLike(Integer kitLike_num);
	public int selectLikeCount(Integer kit_num);


}