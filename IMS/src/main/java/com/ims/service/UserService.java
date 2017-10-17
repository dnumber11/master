package com.ims.service;

import java.util.List;

import com.ims.model.Roles;
import com.ims.model.Users;

public interface UserService {
	
	public Users findByEmail(String email);
	
	public void saveUser(Users user);
	
	public Roles findByRole(String role);
	
	public List<Users> findAll();
	
	public void removeUser(String id);
	
	public Users findById(String id);
	
	public List<Users> findByUserType(String userType);
}
