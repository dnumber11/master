package com.ims.service;

import com.ims.model.Roles;
import com.ims.model.Users;

public interface UserService {
	
	public Users findByEmail(String email);
	
	public void saveUser(Users user);
	
	public Roles findByRole(String role);
}
