package com.spring.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.entities.User;
import com.spring.repositories.UserRepository;

@Service
public class UserService {

	@Autowired
	private UserRepository userRepository;

	public boolean findUser(String userName, String password) {
		User user = userRepository.findUser(userName, password);
		if (user != null && user.getUserName() != null) {
			return true;
		} else
			return false;
	}
}
