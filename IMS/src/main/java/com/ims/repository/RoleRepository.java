package com.ims.repository;

import org.springframework.data.repository.CrudRepository;

import com.ims.model.Roles;

public interface RoleRepository extends CrudRepository<Roles, Long>{
	
	Roles findByRole(String role);
}
