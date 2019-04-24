package com.zhiyou100.mapper;

import com.zhiyou100.model.Admin;

public interface UserMapper {

	Admin findUserByUserName(String username);
	
}
