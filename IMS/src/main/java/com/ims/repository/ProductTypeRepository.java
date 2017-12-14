package com.ims.repository;

import java.util.List;

import org.springframework.data.repository.CrudRepository;

import com.ims.model.ProductTypes;
import com.ims.model.Users;

public interface ProductTypeRepository extends CrudRepository<ProductTypes, Long>{
	
	ProductTypes findById(String id);
	
}
