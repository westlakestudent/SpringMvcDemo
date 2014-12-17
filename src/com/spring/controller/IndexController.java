package com.spring.controller;

import java.io.IOException;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.spring.dao.UserMapper;
import com.spring.entity.User;
import com.spring.entity.UserExample;



@Controller
public class IndexController extends BaseController{

	@Resource
	protected UserMapper userMapper;
	
	@RequestMapping("/")
	public ModelAndView index(){
		ModelAndView mv = new ModelAndView("/index");
		return mv;
	}
	
	
	@RequestMapping("/main")
	public ModelAndView main(){
		ModelAndView mv = new ModelAndView("/main");
		return mv;
	}
	
	@RequestMapping(value="/defaul",method=RequestMethod.POST)
	public void defaul(HttpServletResponse response,HttpServletRequest request) {
			String def = request.getParameter("def");
			System.out.println(def);
		
	}
	
	@RequestMapping(value="/defaul1",method=RequestMethod.GET)
	public void defaul1(HttpServletResponse response,HttpServletRequest request){
		try {
			response.setHeader("Pragma", "No-cache");
			response.setHeader("Cache-Control", "no-cache");
			response.setContentType("text/html" +"; charset=utf-8");
			JSONObject json = new JSONObject();
			JSONArray arr = new JSONArray();
			json.put("message", "message from server1");
			json.put("status", "success1");
			arr.add(json);
			response.getWriter().write(arr.toString());
			response.getWriter().flush();
			response.getWriter().close();
		} catch (IOException e) {
			e.printStackTrace();
			System.err.println(e.getMessage());
		}
	}
	
	@RequestMapping("/hello")
	public ModelAndView hello(){
		ModelAndView mv = new ModelAndView("/hello");
		mv.addObject("message", "Hello World! Haha...");
		UserExample example = new UserExample();
		example.createCriteria().andUsernameEqualTo("westlakestudent");
		List<User> users = userMapper.selectByExample(example);
		if (users != null && !users.isEmpty()) {
			User user = users.get(0);
			mv.addObject("user", user);
		}
		return mv;
	}
	
	@RequestMapping("/tree")
	public void tree(HttpServletResponse response){
		JSONArray array = new JSONArray();
		JSONObject tmp = new JSONObject();
		tmp.put("id", "1.1");
		tmp.put("text", "Filed1");
		tmp.put("checked", true);
		array.add(tmp);
		
//		JSONArray tmparr = new JSONArray();
//		tmp = new JSONObject();
//		tmp.put("text", "PhotoShop");
//		tmp.put("checked", true);
//		tmparr.add(tmp);
		
		tmp = new JSONObject();
		tmp.put("id", "1.2");
		tmp.put("text", "Sub Books");
		tmp.put("state", "closed");
		array.add(tmp);
		
//		tmp = new JSONObject();
//		tmp.put("text", "Books");
//		tmp.put("state", "open");
//		tmp.put("children", tmparr);
//		array.add(tmp);
		
//		tmp = new JSONObject();
//		tmp.put("text", "languages");
//		tmp.put("state", "closed");
//		
//		tmparr = new JSONArray();
//		tmparr.add(new JSONObject().put("text", "java"));
//		tmparr.add(new JSONObject().put("text", "C++"));
//		tmp.put("children", tmparr);
		
		JSONObject obj = new JSONObject();
		obj.put("id", "1");
		obj.put("text", "Folder1");
		obj.put("iconCls", "icon-save");
		obj.put("children", array);
		
		sendJson(response, obj);
		
	}
}
