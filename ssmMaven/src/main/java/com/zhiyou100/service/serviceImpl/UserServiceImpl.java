package com.zhiyou100.service.serviceImpl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.zhiyou100.mapper.UserMapper;
import com.zhiyou100.model.Admin;
import com.zhiyou100.service.UserService;

@Service
public class UserServiceImpl implements UserService {
	
	@Autowired
	UserMapper userMapper;
	
	public Admin findUserByUserName(String username) {
		Admin admin = userMapper.findUserByUserName(username);
		return admin;
	}

}
