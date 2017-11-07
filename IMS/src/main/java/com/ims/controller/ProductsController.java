package com.ims.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.ims.model.ProductTypes;
import com.ims.model.Users;
import com.ims.service.ProductTypeService;
import com.ims.util.Constants;

@Controller
public class ProductsController {
	
	@Autowired
    private Constants constants;
	
	@Autowired
	private ProductTypeService productTypeService;
	
	@RequestMapping(value="/products", method = RequestMethod.GET)
	public String productList(Model model){
		model.addAttribute("product","Products");
		System.out.println(constants.UPLOAD_DIRECTORY);
		return "app.itemlist";
	}
	
	@RequestMapping(value="/productsType", method = RequestMethod.GET)
	public String productType(){
		System.out.println(constants.UPLOAD_DIRECTORY);
		return "app.productType";
	}
	
	@RequestMapping(value="/items", method = RequestMethod.GET)
	public String products(Model model){
		List<ProductTypes> productTypList =	productTypeService.findAll();
		model.addAttribute("productTypList", productTypList);
		return "app.items";
	}
	
	@RequestMapping(value="/createProductType", method = RequestMethod.POST)
	public String saveProdcutType(@ModelAttribute ProductTypes productTypes,Model model){
		if(productTypes != null){
			if(productTypes.getProductType() != null){
			ProductTypes productType=productTypeService.saveProductTypes(productTypes);
			}
		}
		productTypeList(model);
		return "app.itemlist";
	}
	
	@RequestMapping(value="/productTypes", method = RequestMethod.GET)
	public String productTypeList(Model model){
		List<ProductTypes> productTypList =	productTypeService.findAll();
		model.addAttribute("product","Type");
		model.addAttribute("productTypList", productTypList);
		return "app.itemlist";
	}
	
	
	@RequestMapping(value="/removeProductType",method = RequestMethod.GET)
	public String removeProductType(@RequestParam("id") String id,Model model){
		productTypeService.removeProductType(id);
		productTypeList(model);
		return "app.itemlist";
	}
	
	@RequestMapping(value="/editProductType",method = RequestMethod.GET)
	public String updateProductType(@RequestParam("id") String id,ModelMap modelMap){
		ProductTypes productTypes=productTypeService.findById(id);
		modelMap.addAttribute("productType",productTypes );
		return "app.productType";
	}
}
