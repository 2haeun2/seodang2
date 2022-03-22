package kr.spring.onclass.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import kr.spring.onclass.vo.OnclassVO;
import kr.spring.onclass.vo.OnlikeVO;

public interface OnclassMapper {
	public List<OnclassVO> selectList(Map<String,Object> map);
	public int selectRowCount(Map<String,Object> map);
	@Insert("insert into onclass (on_num, user_num,on_name,on_price,on_content,uploadfile,filename) "
			+ "values(onclass_seq.nextval,#{user_num},#{on_name},#{on_price},#{on_content},#{uploadfile},#{filename})")
	public void insertOnclass(OnclassVO onclassVO);
	@Select("select * from onclass where on_num = #{on_num}")
	public OnclassVO selectOnclass(Integer on_num);
	@Select("select count(*) from onclass")
	public int getOnclassCount();
	public List<OnclassVO> getOnclassList(Map<String,Object> map);
	@Select("select * from onclass where user_num = #{num}")
	public OnclassVO getOnclass(int num);
	public void updateOnclass(OnclassVO onclassVO);
	@Delete("delete from onclass where on_num = #{num}")
	public void deleteOnclass(int on_num);
	
	//찜 눌렀는지 확인
	@Select("select * from onlike where user_num = ${user_num} and on_num = ${on_num}")
	public OnlikeVO selectLike(int user_num,int on_num);
	//찜취소
	@Delete("delete from onlike where onlike_num = ${onlike_num}")
	public OnlikeVO deleteLike(int onlike_num);
	//찜 하기
	@Insert("insert into onlike (onlike_num,user_num,on_num,olike) values(onlike_seq.nextval,#{user_num},#{on_num},1)")
	public OnlikeVO insertLike(int user_num,int on_num);
}
