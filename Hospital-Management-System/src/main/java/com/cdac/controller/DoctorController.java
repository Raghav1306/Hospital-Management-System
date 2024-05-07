package com.cdac.controller;

import java.util.Base64;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.cdac.entity.Admin;
import com.cdac.entity.Doctors;
import com.cdac.entity.Patients;
import com.cdac.exception.AdminServiceException;
import com.cdac.exception.DoctorServiceException;
import com.cdac.service.AdminService;
import com.cdac.service.DoctorService;
import com.cdac.service.PatientService;

@Controller
public class DoctorController {
	
	@Autowired
	private AdminService adminService;

	@Autowired
	private DoctorService doctorService;
	
	@Autowired
	private PatientService patientService;
	
	@RequestMapping("/doctorLogin.cdac")
	public String doctorLogin(HttpServletRequest request,HttpSession session,Map model) {
		
		String email=request.getParameter("email");
		
		Base64.Encoder encoder = Base64.getMimeEncoder();
		String password = encoder.encodeToString(request.getParameter("password").getBytes());		 
		
		session = request.getSession();
		session.setAttribute("messageDoc",null);
		try {
			Doctors doctors = doctorService.login(email, password);
			 session.setAttribute("Admin", doctors.getName()); 
			 session.setAttribute("messageDoc", null);
			 Long doctorAvail=adminService.countDoctors();
			Long patientAvail=adminService.countPatients();
			model.put("doctorAvail", doctorAvail);
			model.put("patientAvail", patientAvail);
			model.put("appointmentAvail", patientAvail);
			 return "doctorLoggedIn.jsp";
		}
		catch(DoctorServiceException e) {
			
			session.setAttribute("messageDoc", e.getMessage());
			System.out.println(session.getAttribute("messageDoc"));
			return "doctorLogin.jsp";
		}
	}

	@RequestMapping("/addDoctor.cdac")
	public String addDoctor(HttpServletRequest request,Map model,HttpSession session) {
		
		Doctors doctors=new Doctors();
		
		doctors.setName(request.getParameter("name"));
		doctors.setMobileno(request.getParameter("mobileno"));
		doctors.setEmail(request.getParameter("email"));
		doctors.setSpeciality(request.getParameter("speciality"));
		doctors.setCity(request.getParameter("city"));
		doctors.setCountry(request.getParameter("country"));
		
		Base64.Encoder encoder = Base64.getMimeEncoder();
		String password = encoder.encodeToString(request.getParameter("password").getBytes());		 
		doctors.setPassword(password);
		
		session.setAttribute("addDoc",null);
		try {
			doctorService.addDoctor(doctors);
			model.put("message", "Doctor Details added successfully");
			Long doctorAvail=adminService.countDoctors();
			Long patientAvail=adminService.countPatients();
			session.setAttribute("addDoc",null);
			model.put("doctorAvail", doctorAvail);
			model.put("patientAvail", patientAvail);
			model.put("appointmentAvail", patientAvail);
			return "Admin.jsp";
		}catch(DoctorServiceException e) {
			session.setAttribute("addDoc",e.getMessage());
			Long doctorAvail=adminService.countDoctors();
			Long patientAvail=adminService.countPatients();
			model.put("doctorAvail", doctorAvail);
			model.put("patientAvail", patientAvail);
			model.put("appointmentAvail", patientAvail);
			return "Admin.jsp";
		}	
	}
	
	@RequestMapping("/viewDoctor.cdac")
	public String viewDoctor(Map<String, Object> model) {
			 List<Doctors>doctors=doctorService.getAllDoctor();
			model.put("doctors", doctors);
			return "viewDoctor.jsp";
	}
	
	
	@RequestMapping("/editDoctor.cdac")
	public String editDoctor(HttpServletRequest request,Map<String, Object> model) {
			String id=request.getParameter("id");
			System.out.println(id+"id");
			
			Doctors doctors=doctorService.fetchDoctorByID(id);
			model.put("doctors", doctors);
			return "editDoctor.jsp";
	}
	
	@RequestMapping("/updateDoctor.cdac")
	public String updateDoctor(HttpServletRequest request,Map<String, Object> model) {
		
		Doctors doctors=new Doctors();
		int id=Integer.parseInt(request.getParameter("doctor_id"));
		System.out.println(id);
		doctors.setDoctor_id(id);
		doctors.setName(request.getParameter("name"));
		doctors.setMobileno(request.getParameter("mobileno"));
		doctors.setEmail(request.getParameter("email"));
		doctors.setSpeciality(request.getParameter("speciality"));
		doctors.setCity(request.getParameter("city"));
		doctors.setCountry(request.getParameter("country"));
		
		Base64.Encoder encoder = Base64.getMimeEncoder();
		String password = encoder.encodeToString(request.getParameter("password").getBytes());		 
		
		doctors.setPassword(password);
		
		
			doctorService.updateDoctor(doctors);
			model.put("message", "Doctor Details updated successfully");
			return "Admin.jsp";
	
	}
	
	@RequestMapping("/deleteDoctor.cdac")
	public String deleteDoctor(HttpServletRequest request,Map<String, Object> model) {
			
		String id=request.getParameter("doctor_id");   // from viewDoctor.jsp
		System.out.println(id);
		
		Doctors doctors=doctorService.fetchDoctorByID(id);
		
			doctorService.deleteDoctor(doctors);
			model.put("message", "Doctor Deleted updated successfully");
			return "afterDeleteDoc.cdac";
	
	}
	
	@RequestMapping("/getAllDoctors.cdac")
	public String getAllDoctors(Map<String, Object> model) {
			 List<Doctors>doctors=doctorService.getAllDoctor();
			model.put("doctors", doctors);
			return "addPatient.jsp";
	}
	
	@RequestMapping("/bookAppointment.cdac")
	public String bookAppointment(Map<String, Object> model,HttpServletRequest request,HttpSession session) {
			try {
			List<Doctors>doctors=doctorService.getAllDoctorsDetails();
			model.put("doctors", doctors);
			session.setAttribute("doc",null);
			return "appointment.jsp";
			}catch(DoctorServiceException e){
				session.setAttribute("doc",e.getMessage());
				System.out.println(session.getAttribute("doc"));
				return "appointment.jsp";
			}
			
	}
	
	@RequestMapping("/viewPatForDoc.cdac")
	public String viewPatientForDoc(HttpSession session,Map<String, List<Patients>> model) {
	
		String doctName=(String) session.getAttribute("Admin");
		System.out.println(doctName);
		List<Patients>patients=patientService.viewPatientForDoc(doctName);
		model.put("patients", patients);
		return "viewPatForDoc.jsp";
		
	}
	
}
