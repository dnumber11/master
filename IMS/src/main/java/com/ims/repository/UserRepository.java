package com.ims.repository;




import org.springframework.data.repository.CrudRepository;

import com.ims.model.Users;
import java.lang.String;

public interface UserRepository extends CrudRepository<Users, Long> {
	
	Users findByEmail(String email);
	
	Users findById(String id);
	
}
