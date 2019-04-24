package com.zhiyou100.service.serviceImpl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.zhiyou100.mapper.UserLoginMapper;
import com.zhiyou100.model.User;
import com.zhiyou100.service.UserLoginService;

@Service
public class UserLoginServiceImpl implements UserLoginService {
	
	@Autowired
	UserLoginMapper userLoginMapper;
	
	// 通过email查询用户    验证邮箱是否为空
	public User findUserByEmail(String email) {
		
		User user = userLoginMapper.findUserByEmail(email);
		return user;
	}
	// 注册用户
	public void insertUser(User user) {
		
		userLoginMapper.insertUser(user);
	}

}
