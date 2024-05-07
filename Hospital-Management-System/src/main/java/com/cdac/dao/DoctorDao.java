package com.cdac.dao;

import java.util.*;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;
import org.apache.*;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import com.cdac.entity.Admin;
import com.cdac.entity.Doctors;

@Component
public class DoctorDao {

	@PersistenceContext
	private EntityManager entityManager;
	
	public boolean isDoctorPresent(String email) {
		Query query = entityManager.createQuery("select count(d) from Doctors d where d.email = :em");
		query.setParameter("em", email);
		Long count = (Long) query.getSingleResult();
		if(count == 1)
			return true;
		return false;
	}
	

	@Transactional
	public void addDoctor(Doctors doctors) {
		entityManager.persist(doctors);		
	}
	

	public List<Doctors> fetchAllDoctors() {
		return entityManager
				.createQuery("select d from Doctors d",Doctors.class)
			    .getResultList();
	}


	public Doctors fetchDoctorByID(String id1) {
		int id=Integer.parseInt(id1);
		return entityManager
				.createQuery("select d from Doctors d where d.doctor_id like : id",Doctors.class)
				.setParameter("id", id)
			    .getSingleResult();
	}


	@Transactional
	public void updateDoctor(Doctors doctors) {
		System.out.println(doctors.getDoctor_id()+" how **");
		entityManager.merge(doctors);
	}

	@Transactional
	public void deleteDoctor(Doctors doctors) {
		
		System.out.println(doctors.getDoctor_id());
		System.out.println(doctors.getName());
		
		//entityManager.remove(doctors);  can't remove like this due to session so we need to write below line
		entityManager.remove(entityManager.contains(doctors) ? doctors : entityManager.merge(doctors));
		
	}

	public Doctors fetchByDoctorName(String name) {
		return entityManager
				.createQuery("select d from Doctors d where d.name like : nm",Doctors.class)
				.setParameter("nm", name)
			    .getSingleResult();
	}


	public boolean isDoctorPresent(String email, String password) {
		Query query = entityManager.createQuery("select count(d) from Doctors d where d.email like :em and d.password like :pass");
		query.setParameter("em", email);
		query.setParameter("pass", password);
		Long count = (Long) query.getSingleResult();
		System.out.println(count);
		if(count == 1)
			return true;
		return false;
	}


	public Doctors fetchDoctor(String email) {
		System.out.println("success2");
		Query query = entityManager.createQuery("select d from Doctors d where d.email = :em");
		query.setParameter("em", email);
		System.out.println("success3");
		Doctors doctors = (Doctors) query.getSingleResult();
		System.out.println(doctors.getName());
		return doctors;
	}


	public boolean isDoctorPresent() {
		Query query = entityManager.createQuery("select count(d) from Doctors d");
		Long count = (Long) query.getSingleResult();
		System.out.println(count);
		if(count >= 1)
			return true;
		return false;
	}	
		
}

