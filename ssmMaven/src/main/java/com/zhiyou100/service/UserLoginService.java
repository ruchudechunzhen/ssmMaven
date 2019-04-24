package com.zhiyou100.service;

import com.zhiyou100.model.User;

public interface UserLoginService {
	
	// 通过email查询用户    验证邮箱是否为空
	User findUserByEmail(String email);
	// 注册用户
	void insertUser(User user);

}
