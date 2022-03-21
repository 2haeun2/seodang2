package kr.spring.user.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.spring.user.dao.UserMapper;
import kr.spring.user.vo.UserVO;

@Service
@Transactional
public class UserServiceImpl implements UserService{

	@Autowired
	private UserMapper userMapper;
	
	@Override
	public int selectUser_num() {
		return 0;
	}

	@Override
	public void insertUser(UserVO user) {
		user.setUser_num(userMapper.selectUser_num());
		userMapper.insertUser(user);
		userMapper.insertUser_detail(user);
	}

	@Override
	public void insertUser_detail(UserVO user) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public UserVO selectCheckUser(String id) {
		return userMapper.selectCheckUser(id);
	}

	@Override
	public UserVO selectUser(Integer user_num) {
		return userMapper.selectUser(user_num);
	}

	@Override
	public void updateUser(UserVO user) {
		userMapper.updateUser(user);
		
	}

	@Override
	public void updatePassword(UserVO user) {
		userMapper.updatePassword(user);
		
	}

	@Override
	public void deleteUser(Integer user_num) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void deleteUser_detail(Integer user_num) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void updateProfile(UserVO user) {
		// TODO Auto-generated method stub
		
	}

}
