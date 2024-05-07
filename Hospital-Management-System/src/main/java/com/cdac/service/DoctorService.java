package com.cdac.service;

import java.util.List;



import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;


import com.cdac.dao.DoctorDao;
import com.cdac.entity.Doctors;
import com.cdac.exception.AdminServiceException;
import com.cdac.exception.DoctorServiceException;

@Component
public class DoctorService {

	@Autowired
	private DoctorDao doctorDao;
	
	public void addDoctor(Doctors doctors) {
		
		if(doctorDao.isDoctorPresent(doctors.getEmail()))
			throw new DoctorServiceException("Doctor already registered!");
		else
			doctorDao.addDoctor(doctors);
	}
	
	public List<Doctors> getAllDoctor(){
		return doctorDao.fetchAllDoctors();
	}

	public Doctors fetchDoctorByID(String id) {
		return doctorDao.fetchDoctorByID(id);
	}

	public void updateDoctor(Doctors doctors) {
		 doctorDao.updateDoctor(doctors);
	}

	public void deleteDoctor(Doctors doctors) {
		 doctorDao.deleteDoctor(doctors);	
	}

	public Doctors fetchByDoctorName(String name) {
		return doctorDao.fetchByDoctorName(name);
	}

	public List<Doctors> fetchDataDoctors() {
		return doctorDao.fetchAllDoctors();
	}

	public Doctors login(String email, String password) {
		if(doctorDao.isDoctorPresent(email, password)) {
			System.out.println("success1");
			return doctorDao.fetchDoctor(email);
		}
		else
			throw new DoctorServiceException("Incorrect Email/Password !");
	}

	public List<Doctors> getAllDoctorsDetails() {
		if(doctorDao.isDoctorPresent()) {
			System.out.println("success1");
			return doctorDao.fetchAllDoctors();
		}
		else
			throw new DoctorServiceException("Doctors Not Available! Sorry for Inconvenience !");
	}
}
