package com.zhiyou100.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.zhiyou100.model.Subject;
import com.zhiyou100.model.Video;
import com.zhiyou100.service.WebVideoService;

@Controller
@RequestMapping("/webVideo")
public class WebVideoController {
	
	@Autowired
	WebVideoService webVideoServiceImpl;
	
	// 查询学科信息表Subject 通过id
	@RequestMapping(  value="list.do",method=RequestMethod.GET)
	public String webVideoList(int id,Model model){
		System.out.println("进来了");
		Subject subject = webVideoServiceImpl.findSubjectById(id);
		model.addAttribute("subject", subject);
		System.out.println("查询学科信息表Subject 通过id"+subject);
		return "/before/course/beforeCourseIndex";
	}
	
	// 通过id展示视频信息
	@RequestMapping(  value="videoShow.do",method=RequestMethod.GET)
	public String showVideo(int id,Model model){
		System.out.println("通过id展示视频信息中的id-->"+id);
		Video video = webVideoServiceImpl.showVideoById(id);
		model.addAttribute("video", video);
		return "/before/video/beforeVideoIndex";
	}
	
}
