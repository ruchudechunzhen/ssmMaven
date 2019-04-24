package com.zhiyou100.service.serviceImpl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.zhiyou100.mapper.WebVideoMapper;
import com.zhiyou100.model.Subject;
import com.zhiyou100.model.Video;
import com.zhiyou100.service.WebVideoService;

@Service
public class WebVideoServiceImpl implements WebVideoService {
	
	@Autowired
	WebVideoMapper webVideoMapper;
	

	// 查询学科信息表Subject 通过id
	public Subject findSubjectById(int id) {
		Subject subject = webVideoMapper.findSubjectById(id);
		return subject;
	}

	// 通过id展示视频信息
	public Video showVideoById(int id) {
		Video video = webVideoMapper.showVideoById(id);
		return video;
	}
}
