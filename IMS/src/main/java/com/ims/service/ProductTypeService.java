package com.ims.service;

import java.util.List;

import com.ims.model.ProductTypes;
import com.ims.model.Users;


public interface ProductTypeService {
	
	public ProductTypes saveProductTypes(ProductTypes productTypes);
	
	public List<ProductTypes> findAll();
	
<<<<<<< HEAD
	public ProductTypes retriveProductType(Long productTypes);
=======
	public void removeProductType(String id);
	
	public ProductTypes findById(String id);
>>>>>>> 577fd4acfae70361c90ef8114f7a39b206ac45cd
	
}
