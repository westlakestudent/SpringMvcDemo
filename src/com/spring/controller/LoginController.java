package com.spring.controller;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.spring.dao.UserMapper;
import com.spring.entity.User;
import com.spring.entity.UserExample;

@Controller
public class LoginController extends BaseController{
	
	@Resource
	private UserMapper userMapper;
	
	@RequestMapping("/login")
	public ModelAndView login(){
		ModelAndView mv = new ModelAndView("/login");
		return mv;
	}
	
	@RequestMapping("/dologin")
	public void doLogin(HttpServletResponse response,HttpServletRequest request){
		String username = requestParam(request,"username");
		String password = requestParam(request,"password");
		UserExample example = new UserExample();
		example.createCriteria().andUsernameEqualTo(username);
		List<User> users = userMapper.selectByExample(example);
		if(users != null && !users.isEmpty()){
			User user = users.get(0);
			if(user.getPassword().equals(password)){
				sendJson(response,true,"login successfully");
			}else{
				sendJson(response,false,"login falied , password wrong");
			}
		}else{
			sendJson(response,false,"login falied ,user not exsit");
		}
	}
}
