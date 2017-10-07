package com.ims.controller;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpSession;

import org.apache.tomcat.util.buf.StringUtils;
import org.bson.types.ObjectId;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.commons.CommonsMultipartFile;

import com.ims.model.Roles;
import com.ims.model.Users;
import com.ims.service.UserService;

@Controller
public class ContactsController {
	
	private static final String UPLOAD_DIRECTORY ="/home/dinesh/workspace/Dinesh/master/workspace/IMS/src/main/resources/static/images/"; 

	@Autowired
	private UserService userService;
	
	@RequestMapping(value="/contacts",method = RequestMethod.GET)
	public String contacts(ModelMap modelMap){
		List<Users> list=userService.findAll();
		modelMap.addAttribute("userList",list );
		return "app.userlisting";
	}
	@RequestMapping(value="/addNewUser",method = RequestMethod.GET)
	public String addNewUser(ModelMap modelMap){
		
		return "app.users";
	}
	
	@RequestMapping(value="/savecontacts",method = RequestMethod.POST)
	public String saveConttacts(@ModelAttribute("user") Users user,
			@RequestParam("file") MultipartFile file,ModelMap modelMap){
		try {

			if(user.getId()==null || user.getId().trim().equals("")){
				ObjectId id = ObjectId.get();
				user.setId(id.toString());
			}
			Roles role=userService.findByRole("test1");
			if(user != null){
				user.setRoleId(role);
				if (!file.isEmpty()) {
					user.setImagePath(uploadImage(file));
				}
				userService.saveUser(user);
			}
			contacts(modelMap);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} 


		return "app.userlisting";
	}
	
	private String uploadImage(MultipartFile file){
		String filename="";
		try {
			File serverFile =null;
			if (!file.isEmpty()) {
				byte[] bytes = file.getBytes();
				File dir = new File(UPLOAD_DIRECTORY);
				if (!dir.exists())
					dir.mkdirs();
				// Create the file on server
				serverFile = new File(dir.getAbsolutePath()+ File.separator + (Math.random()+file.getOriginalFilename()));
				BufferedOutputStream stream = new BufferedOutputStream(
						new FileOutputStream(serverFile));
				stream.write(bytes);
				stream.close();
				filename=serverFile.getAbsolutePath();
				System.out.println("filename="+ filename);

			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} 
		return filename;
	}
	
	@RequestMapping(value="/removeUser",method = RequestMethod.GET)
	public String updateConttacts(@RequestParam("id") String id,ModelMap modelMap){
		userService.removeUser(id);
		contacts(modelMap);
		return "app.userlisting";
	}
	
	@RequestMapping(value="/editUser",method = RequestMethod.GET)
	public String updateUser(@RequestParam("id") String id,ModelMap modelMap){
		Users users=userService.findById(id);
		modelMap.addAttribute("user",users );
		return "app.users";
	}
}
