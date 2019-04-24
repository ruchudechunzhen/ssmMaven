package com.zhiyou100.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.zhiyou100.Util.EmailUtil;
import com.zhiyou100.model.Email;
import com.zhiyou100.model.User;
import com.zhiyou100.service.UserLoginService;

@Controller
@RequestMapping("/user")
public class UserController {
	
	@Autowired
	UserLoginService userLoginServiceImpl;
	// 用户登录
	@RequestMapping(value="/loginUser.do",method=RequestMethod.POST)
	@ResponseBody
	public String loginByEmail(Email email,HttpServletRequest request){
		System.out.println("用户登录email"+email);
		User user = userLoginServiceImpl.findUserByEmail(email.getEmail());
		System.out.println("用户登录user"+user);
		if (user != null) {
			if ( user.getPassword().equals(email.getPassword()) ) {
				HttpSession session = request.getSession();
				session.setAttribute("user", user);
				return "success";
			}else{
				return null;
			}
		}else{
			return null;
		}
	}
	// 用户退出
	@RequestMapping(value="/loginOut.do",method=RequestMethod.GET)
	@ResponseBody
	public void loginOut(HttpServletRequest request){
		HttpSession session = request.getSession();
		session.invalidate();
	}
	// 个人中心
	@RequestMapping(value="/showMyProfile.do",method=RequestMethod.GET)
	public String findUserByEmail(Model model,HttpServletRequest request){
		HttpSession session = request.getSession();
		User userSssion = (User) session.getAttribute("user");
		System.out.println("个人中心中的userSssion-->"+userSssion);
//		User user = userLoginServiceImpl.findUserByEmail(email);
//		System.out.println("个人中心接收到的user-->"+user);
//		model.addAttribute("user", user);
		return "/before/user/index";
	}
	
	// 验证邮箱是否为空
	@RequestMapping(value="/validateEmail.do",method=RequestMethod.POST)
	@ResponseBody
	public String findEmail(Model model,String email){
			System.out.println("验证邮箱是否为空进来了");
			User user = userLoginServiceImpl.findUserByEmail(email);
			System.out.println("通过邮箱返回的对象是否为空user-->"+user);
			if (null == user) {
				return "success";
			}else{
				return "";
			}
			
	}
	// 注册用户
	@RequestMapping(value="/registerUser.do",method=RequestMethod.POST)
	@ResponseBody
	public String registerUser(Model model,User user){
		userLoginServiceImpl.insertUser(user);
		return "success";
	}
	// 忘记密码
	@RequestMapping(value="/forgetPassword.do",method=RequestMethod.GET)
	public String forgetPassword(){
		return "forward:/WEB-INF/before/user/forget_pwd.jsp";
	}
	
	// 忘记密码重置密码
	@RequestMapping(value="/reset.do",method=RequestMethod.POST)
	public String resetPassword(){
		return "forward:/WEB-INF/before/user/forget_pwd.jsp";
	}
	// 发送验证码
	@RequestMapping(value="/code.do",method=RequestMethod.POST)
	@ResponseBody
	public String sendCode(String email){
		System.out.println("进来了");
		System.out.println("发送验证码中的email-->"+email);
		//EmailUtil.sendEmail(toEmailAddress, emailTitle, emailContent);
		return "";
	}
}

















