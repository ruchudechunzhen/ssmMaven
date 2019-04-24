package com.zhiyou100.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.zhiyou100.model.Admin;
import com.zhiyou100.model.User;
import com.zhiyou100.service.UserService;

@Controller
@RequestMapping("/admin")
public class AdminController {
	
	@Autowired
	UserService userServie;
	
	@RequestMapping(value="/login.do",method=RequestMethod.POST)
	public String testLogin(String username,String password,Model model ){
		Admin admin = userServie.findUserByUserName(username);
		System.out.println(admin);
		System.out.println(password);
		if(admin != null){
			if(password.equals(admin.getPassword())){
				model.addAttribute("admin", admin);
				return "forward:/video/list.do";
			}else{
				//model.addAttribute("message", "密码错误");
				return "redirect:/login.jsp ";
			}
		}else{
			//model.addAttribute("message", "用户名不存在");
			return "redirect:/login.jsp ";
		}
		
		
	}
}
