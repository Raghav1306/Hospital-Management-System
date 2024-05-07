package com.cdac.dao;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;

import org.springframework.stereotype.Controller;

import com.cdac.entity.Admin;

@Controller
public class AdminDao {
	
	@PersistenceContext
	private EntityManager entityManager;
	
	public boolean isAdminPresent(String email, String password) {
		Query query = entityManager.createQuery("select count(ad) from Admin ad where ad.email like :em and ad.password like :pass");
		query.setParameter("em", email);
		query.setParameter("pass", password);
		Long count = (Long) query.getSingleResult();
		if(count == 1)
			return true;
		return false;
	}
	
	public Admin fetch(String email) {
		Query query = entityManager.createQuery("select admin from Admin admin where admin.email = :em");
		query.setParameter("em", email);
		Admin admin1 = (Admin) query.getSingleResult();
		return admin1;
	}

	public Long countDoctors() {
		Query query = entityManager.createQuery("select count(d) from Doctors d");
		Long count = (Long) query.getSingleResult();
		return count;
	}

	public Long countPatients() {
		Query query = entityManager.createQuery("select count(p) from Patients p");
		Long count = (Long) query.getSingleResult();
		return count;
	}

}
