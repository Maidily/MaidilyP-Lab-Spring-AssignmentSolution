package com.lab6.studentmanagement.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;

import com.lab6.studentmanagement.entity.User;
import com.lab6.studentmanagement.repository.UserRepository;
import com.lab6.studentmanagement.security.MyUserDetails;

public class UserDetailsServiceImpl implements UserDetailsService {
	
	@Autowired
	private UserRepository userRepository;

	@Override
	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
		
		List<User> users = userRepository.findAll();
		System.out.println(users);
		
		User user = userRepository.getUserByUsername(username);
		System.out.println(user);
		
		if (user == null) {
			throw new UsernameNotFoundException("Could not find user");
		}
		
		return new MyUserDetails(user);
	}

}
