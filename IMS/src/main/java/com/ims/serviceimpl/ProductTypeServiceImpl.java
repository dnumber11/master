package com.ims.serviceimpl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.ims.model.ProductTypes;
import com.ims.repository.ProductTypeRepository;
import com.ims.service.ProductTypeService;

@Service("productTypeService")
@Transactional
public class ProductTypeServiceImpl implements ProductTypeService{
	
	@Autowired
	private ProductTypeRepository productTypeRepository;

	@Override
	public ProductTypes saveProductTypes(ProductTypes productTypes) {
		ProductTypes productType=productTypeRepository.save(productTypes);
		return productType;
	}

}
