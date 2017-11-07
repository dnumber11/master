package com.ims.serviceimpl;

import java.util.List;

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
		return productTypeRepository.save(productTypes);
	}

	@Override
	public List<ProductTypes> findAll() {
		return (List<ProductTypes>) productTypeRepository.findAll();
	}
	

	@Override
	public void removeProductType(String id) {
		ProductTypes productTypes=productTypeRepository.findById(id);
		productTypeRepository.delete(productTypes);
		
	}

	@Override
	public ProductTypes findById(String id) {
		return productTypeRepository.findById(id);
	}
	
	

}
