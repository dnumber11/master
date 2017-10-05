package com.ims.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.ims.model.Users;
import com.ims.service.UserService;

@Controller
public class LoginController {
	
	@Autowired
	private UserService userService;
	
	@RequestMapping(value="/authenticate",method = RequestMethod.POST)
	public String authenticate(@RequestParam("userid") String id,@RequestParam("password") String password){
		Users users=userService.findByEmail(id);
		if(users != null){
			if(users.getPassword().equals(password))
				return "app.homepage";
			else 
				return "login";	
			}
		return "login";
	}

}
