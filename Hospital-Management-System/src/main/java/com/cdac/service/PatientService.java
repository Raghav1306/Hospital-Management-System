package com.cdac.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.cdac.dao.DoctorDao;
import com.cdac.dao.PatientDao;
import com.cdac.entity.Doctors;
import com.cdac.entity.Patients;

@Component
public class PatientService {

	@Autowired
	private PatientDao patientDao;
	
	public void addPatient(Patients patients) {
		patientDao.addPatient(patients);		
	}

	public List<Patients> getAllPatient() {
		return patientDao.fetchAllPatients();
	}
	
	public Patients fetchPatientByID(String id) {
		return patientDao.fetchPatientByID(id);
	}


	public void updatePatient(Patients patients) {
		patientDao.updatePatient(patients);
		
	}

	public void deletePatient(Patients patients) {
		patientDao.deletePatient(patients);
	}

	public List<Patients> viewPatientForDoc(String doctName) {
		return patientDao.viewPatientForDoc(doctName);	
	}
	

}
