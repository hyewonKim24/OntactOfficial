package com.kh.ontact.users.model.service;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.InternalAuthenticationServiceException;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;

import com.kh.ontact.users.model.dao.UsersAuthDao;
import com.kh.ontact.users.model.dto.CustomUserDetails;

public class CustomUserDetailsService implements UserDetailsService {
	
	private static final Logger logger = LoggerFactory.getLogger(CustomUserDetailsService.class);
	
	@Autowired
	private UsersAuthDao usersAuthDao;

	@Override
	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
		CustomUserDetails user = usersAuthDao.getUserById(username);
		if (user == null) {
			logger.debug("no user :::::::: AuthenticationProvider");
			throw new InternalAuthenticationServiceException(username);
		}
		return user;
	}

}
