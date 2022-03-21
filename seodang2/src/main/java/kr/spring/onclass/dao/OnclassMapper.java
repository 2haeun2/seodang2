package kr.spring.onclass.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;

import kr.spring.onclass.vo.OnclassVO;

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
}
