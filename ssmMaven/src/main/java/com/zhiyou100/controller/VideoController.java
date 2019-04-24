package com.zhiyou100.controller;

import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.FilenameUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.zhiyou100.model.Course;
import com.zhiyou100.model.SearchVideo;
import com.zhiyou100.model.Speaker;
import com.zhiyou100.model.Video;
import com.zhiyou100.service.VideoService;

@Controller
@RequestMapping("/video")
public class VideoController {
	
	@Autowired
	VideoService videoService;
	
	// 查询所有video 模糊查询
	@RequestMapping("/list.do")
	public String videoList(Model model,SearchVideo searchVideo,@RequestParam(value="pageNo",defaultValue="1") int pageNo){
		// 查询speaker
		List<Speaker> speakers =  videoService.findSpeaker();
		// 查询course
		List<Course> courses = videoService.findCourse();
		// 查询video
		PageHelper.startPage(pageNo,3);
		List<Video> videos =  videoService.videoList(searchVideo);
		PageInfo page = new PageInfo(videos);
		System.out.println("模糊查询的页面接收的对象video-->"+searchVideo);
		model.addAttribute("searchVideo", searchVideo);
		model.addAttribute("page", page);
		model.addAttribute("speakers", speakers);
		model.addAttribute("searchVideo", searchVideo);
		model.addAttribute("videos", videos);
		//model.addAttribute("courses", courses);
		//HttpSession session = request.getSession();
		//session.setAttribute("videos", videos);
		return"/behind/video/listVideo";
	}
	// 跳转add页面
	@RequestMapping(value="/add.do",method=RequestMethod.GET)
	public String add(Model model){
		// 查询speaker
		List<Speaker> speakers =  videoService.findSpeaker();
		// 查询course
		List<Course> courses = videoService.findCourse();
		// 查询所有video
		//List<Video> videos =  videoService.videoList();
		//model.addAttribute("videos", videos);
		model.addAttribute("speakers", speakers);
		model.addAttribute("courses", courses);
		return"/behind/video/addVideo";
	}
	// 添加video
	@RequestMapping(value="/add.do",method=RequestMethod.POST)
	public String addVideo(@RequestParam("files") MultipartFile[] files,Video video) throws Exception{
		
		String path0 = doFileName(files[0].getOriginalFilename());
		files[0].transferTo(new File(path0));
		System.out.println("添加video中的path0"+path0); 
		if( (path0 != null) && (!"".equals(path0))){
			// 裁剪imageUrl
			StringBuffer sbImageUrl = new StringBuffer(path0);
			String subString = sbImageUrl.substring(9);
			System.out.println("添加video中裁剪之后的path0"+subString); 
			video.setImageUrl(subString);
		}
		String path1 = doFileName(files[1].getOriginalFilename());
		files[1].transferTo(new File(path1));
		if( (path1 != null) && (!"".equals(path1))){
			// 裁剪videoUrl
			StringBuffer sbVideoUrl = new StringBuffer(path1);
			String subString2 = sbVideoUrl.substring(9);
			video.setVideoUrl(subString2);
		}
		System.out.println(video);
		videoService.addVideo(video);
		return "redirect:/video/list.do";
	}
	
	// 编辑video 回显
	@RequestMapping(value="/update.do",method=RequestMethod.GET)
	public String updateVideo(int id,Model model){
		List<Speaker> speakers =  videoService.findSpeaker();
		List<Course> courses = videoService.findCourse();
		Video video =  videoService.updateVideo(id);
		System.out.println("编辑video 回显中的video"+video);
		model.addAttribute("videoId", video);
		model.addAttribute("speakers", speakers);
		model.addAttribute("courses", courses);
		return "/behind/video/updateVideo";
	}
	// 编辑 并保存video
	@RequestMapping(value="/update.do",method=RequestMethod.POST)
	public String updateVideoMax(Video video,@RequestParam("files") MultipartFile[] files, 
		String imgUrl,String videoUrl) throws IllegalStateException, IOException{
		
		String imgPath = files[0].getOriginalFilename();
		System.out.println("获取到的imgPath"+imgPath);
		String videoPath = files[1].getOriginalFilename();
		if( !"".equals(imgPath)  ){
			String imgPathMax = doFileName(imgPath);
			files[0].transferTo(new File(imgPathMax));
			video.setImageUrl(imgPathMax);
			System.out.println("进来了");
		}else{
			String imgUrlMax = "D:\\video\\"+imgUrl; 
			video.setImageUrl(imgUrlMax);
			System.out.println("imgUrlMax的值-->"+imgUrlMax);
		}
		if( !"".equals(videoPath)  ){
			String videoPathMax = doFileName(videoPath);
			files[1].transferTo(new File(videoPathMax));
			video.setVideoUrl(videoPathMax);
			System.out.println("进来了");
		}else{
			String videoUrlMax = "D:\\video\\"+videoUrl; 
			video.setVideoUrl(videoUrlMax);
			System.out.println("videoUrlMax的值-->"+videoUrlMax);
		}
		//video.setImageUrl(path0);
		//files[1].transferTo(new File(path1));
		//System.out.println("文件地址-->"+path);
		System.out.println(video);
		videoService.updateVideoMax(video);
		return"redirect:/video/list.do";
	}
	// 批量删除
	@RequestMapping(value="/deleteBatch.do",method=RequestMethod.POST)
	public String deleteBatchVideo(int[] checkId){
		if(checkId != null){
			videoService.deleteBatchVideo(checkId);
		}
		return "redirect:/video/list.do";
	}
	
	// 删除video
	@RequestMapping(value="/deleteVideo.do",method=RequestMethod.GET)
	public String deleteVideo(int id){
			videoService.deleteVideo(id);
		return "redirect:/video/list.do";
	}
	
	
	
	// 为文件创建随机名
	private String doFileName(String originalFilename) {
		//获取文件的后缀名
		String extension  = FilenameUtils.getExtension(originalFilename);
		//获取uuid字符串-->随机数当做文件名
		String uuid = UUID.randomUUID().toString();
		// 随机数+后缀
		return "D:\\video\\"+uuid+"."+extension;
	}

}
