package kr.spring.kit.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import kr.spring.kit.vo.KitVO;

public interface KitMapper {
	//키트목록
	public List<KitVO> selectList(Map<String,Object> map);
	public int selectRowCount(Map<String,Object> map);
	//키트등록
	@Insert("INSERT INTO okit(kit_num,kit_name,kit_price,kit_quantity,kit_content,user_num,uploadfile,filename, "
			+ "VALUES (okit_seq.nextval,#{kit_name},#{kit_price},#{kit_quantity},#{kit_contnent},#{uploadfile},#{filename},{user_num})")
	public void insertKit(KitVO kit);
	//키트detail
	//@Select("SELECT * FROM okit k join ouser u " 
		//    + "ON k.user_num=u.user_num WHERE k.kit_num=#{kit_num}")
	public KitVO selectKit(Integer kit_num);
	//키트 조회수
	//@Update("UPDATE okit SET hit=hit+1 WHERE kit_num=#{board_num}")
	public void updateHit(Integer kit_num);	
	public void updateKit(KitVO kit);
	public void deleteKit(Integer kit_num);
}
