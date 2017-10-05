package com.ims.main;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.data.mongodb.repository.config.EnableMongoRepositories;

@SpringBootApplication(scanBasePackages="com.ims.*")
//@Configuration
//@EnableAutoConfiguration
//@ComponentScan("com.ims.*")
@ComponentScan("com.ims.*")
//@EntityScan("com.ims.model")
//@EnableJpaRepositories("com.ims.repository") 
@EnableMongoRepositories("com.ims.repository")
public class ImsApplication {

	public static void main(String[] args) {
		SpringApplication.run(ImsApplication.class, args);
	}
}
