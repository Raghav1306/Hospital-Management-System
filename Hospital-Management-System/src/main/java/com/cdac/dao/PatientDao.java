package com.cdac.dao;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import com.cdac.entity.Doctors;
import com.cdac.entity.Patients;

@Component
public class PatientDao {

	@PersistenceContext
	private EntityManager entityManager;

	@Transactional
	public void addPatient(Patients patients) {
		entityManager.persist(patients);		
	}

	public List<Patients> fetchAllPatients() {
		return entityManager
				.createQuery("select p from Patients p",Patients.class)
			    .getResultList();
	}

	public Patients fetchPatientByID(String id1) {
		int id=Integer.parseInt(id1);
		return entityManager
				.createQuery("select p from Patients p where p.patient_id like : id",Patients.class)
				.setParameter("id", id)
			    .getSingleResult();
	}

	@Transactional
	public void updatePatient(Patients patients) {
		entityManager.merge(patients);		
	}

	@Transactional
	public void deletePatient(Patients patients) {
		//entityManager.remove(patients);
		/*
		EntityManager#remove() works only on entities which are managed in the current 
		transaction/context. In your case, you're retrieving the entity in an earlier transaction,
		storing it in the HTTP session and then attempting to remove it in a different transaction/context. 
		This just won't work.
		
		You need to check if the entity is managed by EntityManager#contains() and if not, 
		then make it managed it EntityManager#merge()
			*/
		
		entityManager.remove(entityManager.contains(patients) ? patients : entityManager.merge(patients));
	}

	public List<Patients> viewPatientForDoc(String doctName) {
		return entityManager
				.createQuery("select p from Patients p inner join p.doctors d where d.name like :nm")
				.setParameter("nm", doctName)
				.getResultList();
	}
	
}
