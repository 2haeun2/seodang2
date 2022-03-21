package kr.spring.kit.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;

import kr.spring.kit.vo.KitVO;

public interface KitMapper {
	
	public List<KitVO> selectList(Map<String,Object> map);
	public int selectRowCount(Map<String,Object> map);
//	@Insert("INSERT INTO okit(kit_num,name,price,quantity,photo1,photo2,detail,"
//			+ "status,user_num) VALUES (okit_seq.nextval,#{name},"
//			+ "#{price},#{quantity},#{photo1},#{photo2},#{status},{user_num})")
	public void insertKit(KitVO kit);
//	@Select("SELECT * FROM okit k join ouser u " 
//		    + "ON k.user_num=u.user_num WHERE k.kit_num=#{kit_num}")
	public KitVO selectKit(Integer board_num);
	public void updateKit(KitVO board);
	public void deleteKit(Integer board_num);
}
