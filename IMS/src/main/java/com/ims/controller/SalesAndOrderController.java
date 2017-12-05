package com.ims.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.ims.model.ProductTypes;
import com.ims.model.Users;
import com.ims.service.ProductTypeService;
import com.ims.service.UserService;

@Controller
public class SalesAndOrderController {
	
	@Autowired
	private UserService userService;
	
	@Autowired
	private ProductTypeService productTypeService;
	
	@RequestMapping(value="/sales",method = RequestMethod.GET)
	public String sales(ModelMap modelMap){
		List<Users> list=userService.findByUserType("C");
		List<ProductTypes> productTypList =	productTypeService.findAll();
		modelMap.addAttribute("userList",list );
		modelMap.addAttribute("productTypList",productTypList );
		return "app.sales";
	}
	
	@RequestMapping(value="/purchase",method = RequestMethod.GET)
	public String purchase(ModelMap modelMap){
		List<Users> list=userService.findByUserType("V");
		List<ProductTypes> productTypList =	productTypeService.findAll();
		modelMap.addAttribute("userList",list );
		modelMap.addAttribute("productTypList",productTypList );
		return "app.purchase";
	}
}
