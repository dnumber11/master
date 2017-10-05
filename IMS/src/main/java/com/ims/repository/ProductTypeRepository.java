package com.ims.repository;

import org.springframework.data.repository.CrudRepository;

import com.ims.model.ProductTypes;

public interface ProductTypeRepository extends CrudRepository<ProductTypes, Long>{
	
}
