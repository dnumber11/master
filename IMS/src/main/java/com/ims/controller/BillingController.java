package com.ims.controller;


import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;



@Controller
public class BillingController {
	
	@RequestMapping(value="/billing",method = RequestMethod.GET)
	public String user(ModelMap modelMap){
		return "app.billing";
	}
	
	@RequestMapping(value="/addBilling",method = RequestMethod.GET)
	public String addVilling(@RequestParam("itemCode") String itemCode,@RequestParam("quantity") String quantity ,ModelMap modelMap){
		try{
			System.out.println("itemCode-->"+itemCode);
			System.out.println("quantity-->"+quantity);
		} catch (Exception e) {
			e.printStackTrace();
		} 
		return "app.billing";
	}

}
