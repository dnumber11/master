package com.ims.controller;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.util.List;
import java.util.Random;

import org.bson.types.ObjectId;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.ims.model.Roles;
import com.ims.model.Users;
import com.ims.service.UserService;

@Controller
public class ContactsController {
	
	@Value("${image.path.user}")
    private String imagePath;

	@Autowired
	private UserService userService;
	
	@RequestMapping(value="/user",method = RequestMethod.GET)
	public String user(ModelMap modelMap){
		List<Users> list=userService.findByUserType("U");
		modelMap.addAttribute("userList",list );
		modelMap.addAttribute("account","User" );
		return "app.userlisting";
	}
	
	@RequestMapping(value="/customer",method = RequestMethod.GET)
	public String customer(ModelMap modelMap){
		List<Users> list=userService.findByUserType("C");
		modelMap.addAttribute("userList",list );
		modelMap.addAttribute("account","Customer" );
		return "app.userlisting";
	}
	
	@RequestMapping(value="/vendor",method = RequestMethod.GET)
	public String vendor(ModelMap modelMap){
		List<Users> list=userService.findByUserType("V");
		modelMap.addAttribute("userList",list );
		modelMap.addAttribute("account","Vendor" );
		return "app.userlisting";
	}
	@RequestMapping(value="/addNewUser",method = RequestMethod.GET)
	public String addNewUser(ModelMap modelMap,@RequestParam("userType") String userType){
		modelMap.addAttribute("account",userType );
		modelMap.addAttribute("action","Create" );
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
			System.out.println(user.getUserType());
			renderPageTo(user.getUserType(),modelMap);
		} catch (Exception e) {
			e.printStackTrace();
		} 
		return "app.userlisting";
	}
	
	private String renderPageTo(String userType,ModelMap modelMap){
		if(!StringUtils.isEmpty(userType)){
			if(userType.trim().equals("U") || userType.trim().equals("User")){
				return user(modelMap);
			}else if(userType.trim().equals("C") || userType.trim().equals("Customer")){
				return customer(modelMap);
			}else if(userType.trim().equals("V") || userType.trim().equals("Vendor")){
				return vendor(modelMap);
			}else{
				//
			}
		}
		return "app.userlisting";
	}
	
	private String uploadImage(MultipartFile file){
		String filename="";
		try {
			File serverFile =null;
			if (!file.isEmpty()) {
				byte[] bytes = file.getBytes();
				File dir = new File(imagePath);
				if (!dir.exists())
					dir.mkdirs();
				// Create the file on server
				Random random = new Random();
				serverFile = new File(dir.getAbsolutePath()+ File.separator + (
						String.format("%04d", random.nextInt(10000))+file.getOriginalFilename()));
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
	public String updateConttacts(@RequestParam("id") String id,@RequestParam("userType") String userType,ModelMap modelMap){
		userService.removeUser(id);
		renderPageTo(userType, modelMap);
		return "app.userlisting";
	}
	
	@RequestMapping(value="/editUser",method = RequestMethod.GET)
	public String updateUser(@RequestParam("id") String id,@RequestParam("userType") String userType,ModelMap modelMap){
		Users users=userService.findById(id);
		modelMap.addAttribute("user",users );
		modelMap.addAttribute("account",userType );
		modelMap.addAttribute("action","Edit" );
		return "app.users";
	}
	
	//View User Profile
	@RequestMapping(value="/viewProfile",method = RequestMethod.GET)
	public String getProfile(@RequestParam("id") String id,@RequestParam("userType") String userType,ModelMap modelMap){
		Users users=userService.findById(id);
		modelMap.addAttribute("user",users );
		modelMap.addAttribute("account",userType );
		modelMap.addAttribute("action","Profile");
		return "app.viewprofile";
	}
}
