package com.zhiyou100.service;

import com.zhiyou100.model.Admin;

public interface UserService {

	Admin findUserByUserName(String username);
	
}
