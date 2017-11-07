package com.ims.service;

import java.util.List;

import com.ims.model.ProductTypes;
import com.ims.model.Users;


public interface ProductTypeService {
	
	public ProductTypes saveProductTypes(ProductTypes productTypes);
	
	public List<ProductTypes> findAll();
	
	public void removeProductType(String id);
	
	public ProductTypes findById(String id);
	
}
