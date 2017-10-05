package com.ims.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.ims.model.Roles;
import com.ims.model.Users;
import com.ims.service.UserService;

@Controller
public class ContactsController {

	@Autowired
	private UserService userService;
	
	@RequestMapping(value="/contacts",method = RequestMethod.GET)
	public String contacts(){
		return "app.contacts";
	}
	
	@RequestMapping(value="/savecontacts",method = RequestMethod.GET)
	public String saveConttacts(@ModelAttribute("user") Users user){
		Roles role=userService.findByRole("test1");
		if(user != null){
			user.setRoleId(role);
			userService.saveUser(user);
		}
		return "app.contacts";
	}
}
