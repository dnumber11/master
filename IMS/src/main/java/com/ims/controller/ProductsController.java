package com.ims.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.ims.model.ProductTypes;
import com.ims.service.ProductTypeService;

@Controller
public class ProductsController {
	
//	@Autowired
//	private UserService userService;
	
	@Autowired
	private ProductTypeService productTypeService;
	
	@RequestMapping(value="/products",method = RequestMethod.GET)
	public String contacts(){
		return "app.products";
	}
	
	@RequestMapping(value="/createproducttype",method = RequestMethod.POST)
	public String saveProdcutType(@ModelAttribute("productType")ProductTypes productType){
		if(productType != null){
			ProductTypes productTypes=productTypeService.saveProductTypes(productType);
			System.out.println(productTypes);
		}
		return "app.products";
	}
}
