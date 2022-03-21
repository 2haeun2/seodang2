package kr.spring.user.service;

import kr.spring.user.vo.UserVO;

public interface UserService {
	//사용자
	public int selectUser_num();
	public void insertUser(UserVO user);
	public void insertUser_detail(UserVO user);
	public UserVO selectCheckUser(String id);
	public UserVO selectUser(Integer user_num);
	public void updateUser(UserVO user);
	public void updatePassword(UserVO user);
	public void deleteUser(Integer user_num);
	public void deleteUser_detail(Integer user_num);
	public void updateProfile(UserVO user);
}
