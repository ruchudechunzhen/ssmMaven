package com.zhiyou100.mapper;

import com.zhiyou100.model.Subject;
import com.zhiyou100.model.Video;

public interface WebVideoMapper {
	
	// 查询学科信息表Subject 通过id
	Subject findSubjectById(int id);
	// 通过id展示视频信息
	Video showVideoById(int id);

}
