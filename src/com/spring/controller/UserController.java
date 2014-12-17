package com.spring.controller;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONObject;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.spring.dao.UserMapper;
import com.spring.entity.User;
import com.spring.entity.UserExample;

@Controller
public class UserController extends BaseController {

	@Resource
	protected UserMapper userMapper;

	@RequestMapping("/get_users")
	public void getusers(HttpServletRequest request,
			HttpServletResponse response) {
		int page = Integer.valueOf(requestParam(request, "page"));
		int rows = Integer.valueOf(requestParam(request, "rows"));
		List<User> users = userMapper.selectByExample(null);
		JSONObject JSON = new JSONObject();
		List<User> urts = new ArrayList<User>();
		int size = users.size();
		if (users != null && !users.isEmpty()) {
			for (int i = (page - 1) * rows; i < rows * page; i++) {
				if (i >= size)
					break;
				User user = users.get(i);
				urts.add(user);
			}

		}
		JSON.put("rows", urts);
		JSON.put("total", size);
		sendJson(response, JSON);

	}

	@RequestMapping("/save")
	public void save(HttpServletResponse response, HttpServletRequest request) {
		String username = requestParam(request, "username");
		String password = requestParam(request, "password");
		String email = requestParam(request, "email");
		String mark = requestParam(request, "mark");

		System.out.println("username: " + username + "; password: " + password
				+ "; email: " + email + "; mark: " + mark);

		if (isNUll(username) && isNUll(password)) {
			User user = new User();
			user.setUsername(username);
			user.setPassword(password);
			user.setEmail(email);
			user.setMark(mark);
			userMapper.insert(user);

			JSONObject json = new JSONObject();
			json.put("result", true);
			json.put("data", "success");
			sendJson(response, json);
		}
	}

	@RequestMapping("/edit")
	public void edit(HttpServletResponse response, HttpServletRequest request) {
		String id = requestParam(request, "id");
		String username = requestParam(request, "username");
		String password = requestParam(request, "password");
		String email = requestParam(request, "email");
		String mark = requestParam(request, "mark");
		UserExample example = new UserExample();
		example.createCriteria().andIdEqualTo(Integer.valueOf(id));
		if (isNUll(username) && isNUll(password)) {
			User user = new User();
			user.setUsername(username);
			user.setPassword(password);
			user.setEmail(email);
			user.setMark(mark);
			user.setId(Integer.valueOf(id));
			userMapper.updateByExample(user, example);

			JSONObject json = new JSONObject();
			json.put("result", true);
			json.put("data", "success");
			sendJson(response, json);
		}
	}

	@RequestMapping("/remove")
	public void remove(HttpServletResponse response, HttpServletRequest request) {
		String id = requestParam(request, "id");
		int r = userMapper.deleteByPrimaryKey(Integer.valueOf(id));
		System.out.println("r:" + r);
		if (r == 1) {
			JSONObject json = new JSONObject();
			json.put("result", true);
			json.put("data", "success");
			sendJson(response, json);
		}
	}
}
