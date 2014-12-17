package com.spring.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import org.springframework.stereotype.Controller;


@Controller
public class BaseController {

	
	protected void sendJson(HttpServletResponse response,JSONObject json){
		try {
			if(json == null)
				return;
			response.setHeader("Pragma", "No-cache");
			response.setHeader("Cache-Control", "no-cache");
			response.setContentType("application/json" +"; charset=utf-8");
			PrintWriter writer = response.getWriter();
			writer.write(json.toString());
		} catch (IOException e) {
			System.err.println(e.getMessage());
		}
	}
	
	protected void sendJson(HttpServletResponse response,boolean result,String data){
		try {
			response.setHeader("Pragma", "No-cache");
			response.setHeader("Cache-Control", "no-cache");
			response.setContentType("application/json" +"; charset=utf-8");
			PrintWriter writer = response.getWriter();
			JSONObject json = new JSONObject();
			json.put("result", result);
			json.put("data", data);
			writer.write(json.toString());
		} catch (IOException e) {
			System.err.println(e.getMessage());
		}
	}
	
	
	protected void sendString(HttpServletResponse response,String str){
		try {
			PrintWriter writer = response.getWriter();
			writer.write(str);
		} catch (IOException e) {
			System.err.println(e.getMessage());
		}
	}
	
	
	protected void sendJsonArray(HttpServletResponse response,JSONArray array){
		try {
			PrintWriter writer = response.getWriter();
			writer.write(array.toString());
		} catch (IOException e) {
			System.err.println(e.getMessage());
		}
	}
	
	protected String requestParam(HttpServletRequest request,String key){
		return request.getParameter(key);
	}
	
	protected boolean isNUll(String cop){
		return cop != null && !cop.equals("");
	}
}
