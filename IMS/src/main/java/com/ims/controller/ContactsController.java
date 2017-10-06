package com.ims.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.ims.model.Roles;
import com.ims.model.Users;
import com.ims.service.UserService;

@Controller
public class ContactsController {

	@Autowired
	private UserService userService;
	
	@RequestMapping(value="/contacts",method = RequestMethod.GET)
	public String contacts(ModelMap modelMap){
		List<Users> list=userService.findAll();
		modelMap.addAttribute("userList",list );
		return "app.listing";
	}
	@RequestMapping(value="/addNewUser",method = RequestMethod.GET)
	public String addNewUser(ModelMap modelMap){
		
		return "app.users";
	}
	
	@RequestMapping(value="/savecontacts",method = RequestMethod.POST)
	public String saveConttacts(@ModelAttribute("user") Users user,ModelMap modelMap){
		Roles role=userService.findByRole("test1");
		if(user != null){
			user.setRoleId(role);
			userService.saveUser(user);
		}
		contacts(modelMap);
		return "app.listing";
	}
	
	@RequestMapping(value="/updatecontacts",method = RequestMethod.GET)
	public String updateConttacts(@ModelAttribute("user") Users user){
		Roles role=userService.findByRole("test1");
		if(user != null){
			user.setRoleId(role);
			userService.saveUser(user);
		}
		return "app.listing";
	}
	
	@RequestMapping(value="/editUser",method = RequestMethod.GET)
	public String updateUser(@RequestParam("id") String id,ModelMap modelMap){
		Users users=userService.findById(id);
		modelMap.addAttribute("user",users );
		return "app.users";
	}
}
