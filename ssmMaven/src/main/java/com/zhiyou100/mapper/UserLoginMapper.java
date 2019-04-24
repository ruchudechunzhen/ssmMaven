package com.zhiyou100.mapper;

import com.zhiyou100.model.User;

public interface UserLoginMapper {
	
	// 通过email查询用户    验证邮箱是否为空
	User findUserByEmail(String email);
	// 注册用户
	void insertUser(User user);
	

}
