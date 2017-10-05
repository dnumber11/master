package com.ims.serviceimpl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.ims.model.Roles;
import com.ims.model.Users;
import com.ims.repository.RoleRepository;
import com.ims.repository.UserRepository;
import com.ims.service.UserService;

@Service("userService")
@Transactional
public class UserServiceImpl implements UserService{

	@Autowired
	private UserRepository userRepository;
	
	@Autowired
	private RoleRepository roleRepository;
	
	
	@Override
	public Users findByEmail(String email) {
		return userRepository.findByEmail(email);
	}

	@Override
	public void saveUser(Users user) {
		userRepository.save(user);
	}

	@Override
	public Roles findByRole(String role) {
		return roleRepository.findByRole(role);
	}

}