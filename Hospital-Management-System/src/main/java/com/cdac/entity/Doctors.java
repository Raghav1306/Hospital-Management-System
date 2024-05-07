package com.cdac.entity;

import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity
@Table(name="Doctors")
public class Doctors {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int doctor_id;
	private String name;
	private String mobileno;
	private String email;
	private String speciality;
	private String city;
	private String country;
	private String password;
	
	@OneToMany(mappedBy = "doctors",fetch = FetchType.EAGER,cascade=CascadeType.REMOVE)
	private List<Patients> patients;
	
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public int getDoctor_id() {
		return doctor_id;
	}
	public void setDoctor_id(int doctor_id) {
		this.doctor_id = doctor_id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getMobileno() {
		return mobileno;
	}
	public void setMobileno(String string) {
		this.mobileno = string;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getSpeciality() {
		return speciality;
	}
	public void setSpeciality(String speciality) {
		this.speciality = speciality;
	}
	public String getCity() {
		return city;
	}
	public void setCity(String city) {
		this.city = city;
	}
	public String getCountry() {
		return country;
	}
	public void setCountry(String country) {
		this.country = country;
	}
	public List<Patients> getPatients() {
		return patients;
	}
	public void setPatients(List<Patients> patients) {
		this.patients = patients;
	}
		
	
}
