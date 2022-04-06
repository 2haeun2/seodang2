package kr.spring.kit.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import kr.spring.kit.vo.KitVO;
import kr.spring.kit.vo.KitLikeVO;

public interface KitMapper {
	//키트목록
	public List<KitVO> selectList(Map<String,Object> map);
	public int selectRowCount(Map<String,Object> map);
	//키트등록
	@Insert("INSERT INTO okit(kit_num,user_num,kit_name,kit_price,kit_quantity,kit_content,uploadfile,filename,kit_content2) "
			+ "VALUES (okit_seq.nextval,#{user_num},#{kit_name},#{kit_price},#{kit_quantity},#{kit_content},#{uploadfile},#{filename},#{kit_content2})") 
	public void insertKit(KitVO kit);
	//키트detail
    @Select("SELECT * FROM okit k JOIN ouser u ON k.user_num = u.user_num WHERE k.kit_num=#{kit_num}")
	public KitVO selectKit(Integer kit_num);
	//키트 조회수
	@Update("UPDATE okit SET hit=hit+1 WHERE kit_num=#{kit_num}")
	public void updateHit(Integer kit_num);	
	//키트 수정
	public void updateKit(KitVO kit);
	//키트 삭제
	@Delete("DELETE FROM okit WHERE kit_num=#{kit_num}")
	public void deleteKit(Integer kit_num);
	//파일삭제
	@Update("UPDATE okit SET uploadfile='',filename='' WHERE kit_num=#{kit_num}")
	public void deleteFile(Integer kit_num);
	
	
	
	//찜 눌렀는지 확인
	@Select("SELECT * FROM okitlike WHERE user_num = ${user_num} and kit_num = ${kit_num}")
	public KitLikeVO selectKitLike(@Param("user_num") Integer user_num,@Param("kit_num")Integer kit_num);
	//키트 찜하기
	@Insert("INSERT INTO okitlike (kitLike_num, kit_num, user_num,olike) "
			+ "VALUES (okitlike_seq.NEXTVAL,#{kit_num},#{user_num},1)")
	public void insertKitLike(@Param("user_num") Integer user_num,@Param("kit_num") Integer kit_num);
	//찜취소
	@Delete("DELETE FROM okitlike WHERE kitLike_num = ${kitLike_num}")
	public KitLikeVO deleteKitLike(int kitLike_num);
	//찜하기 Count
	@Select("SELECT COUNT(*) FROM okitlike WHERE kit_num=#{kit_num}")
	public int selectLikeCount(Integer kit_num);

}