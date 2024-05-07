package com.cdac.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Controller;

import com.cdac.dao.AdminDao;
import com.cdac.entity.Admin;
import com.cdac.exception.AdminServiceException;

@Component
public class AdminService {
	
	@Autowired
	private AdminDao adminDao;
	
	public Admin login(String email, String password) {
		if(adminDao.isAdminPresent(email, password))
			return adminDao.fetch(email);
		else
			throw new AdminServiceException("Incorrect Email/Password !");
	}

	public Long countDoctors() {
		return adminDao.countDoctors();
	}

	public Long countPatients() {
		return adminDao.countPatients();
	}

	
}
