package com.ims.service;

import java.util.List;

import com.ims.model.ProductTypes;


public interface ProductTypeService {
	
	public ProductTypes saveProductTypes(ProductTypes productTypes);
	
	public List<ProductTypes> findAll();
	
}
