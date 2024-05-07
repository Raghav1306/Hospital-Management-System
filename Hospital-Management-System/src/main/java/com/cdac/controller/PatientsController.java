package com.cdac.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.cdac.entity.Admin;
import com.cdac.entity.Doctors;
import com.cdac.entity.Patients;
import com.cdac.exception.DoctorServiceException;
import com.cdac.service.AdminService;
import com.cdac.service.DoctorService;
import com.cdac.service.PatientService;

@Controller
public class PatientsController {
	
	@Autowired
	private AdminService adminService;

	@Autowired
	private DoctorService doctorService;
	
	@Autowired
	private PatientService patientService;
	
	@RequestMapping("/addPatient.cdac")
	public String addPatients(HttpServletRequest request,HttpSession session,Map model) {
		System.out.println(request.getParameter("doct"));
		Patients patients=new Patients();
		
		patients.setName(request.getParameter("name"));
		patients.setMobileno(Long.parseLong(request.getParameter("mobileno")));
		patients.setEmail(request.getParameter("email"));
		patients.setCity(request.getParameter("city"));
		patients.setCountry(request.getParameter("country"));
		
		System.out.println(request.getParameter("doct"));
		Doctors doctors=doctorService.fetchDoctorByID(request.getParameter("doct"));
		
		
		patients.setDoctors(doctors);
		System.out.println(doctors.getName()+" "+doctors.getDoctor_id());
		
		patientService.addPatient(patients);
		Long doctorAvail=adminService.countDoctors();
		Long patientAvail=adminService.countPatients();
		model.put("doctorAvail", doctorAvail);
		model.put("patientAvail", patientAvail);
		model.put("appointmentAvail", patientAvail);
		model.put("message", "Patient Details added successfully");
		return "Admin.jsp";
	}
	
	@RequestMapping("/viewPatient.cdac")
	public String viewPatient(Map<String, Object> model) {
			 List<Patients>patients=patientService.getAllPatient();
			model.put("patients", patients);
			return "viewPatients.jsp";
	}
	
	@RequestMapping("/editPatient.cdac")
	public String editPatient(HttpServletRequest request,Map<String, Object> model) {
			String id=request.getParameter("patient_id");
			System.out.println(id+"id");
			
			Patients patients=patientService.fetchPatientByID(id);
			model.put("patients", patients);
			return "editPatient.jsp";
	}
	
		@RequestMapping("editPatByDoc.cdac")
		public String editPatByDoc(HttpServletRequest request,Map<String, Object> model) {
			String id=request.getParameter("patient_id");
			System.out.println(id+"id");
			
			Patients patients=patientService.fetchPatientByID(id);
			model.put("patients", patients);
			return "editPatientByDoc.jsp";
		}
		
	
	@RequestMapping("/updatePatient.cdac")
	public String updatePatient(HttpServletRequest request,Map<String, Object> model) {
		
		Patients patients1=patientService.fetchPatientByID(request.getParameter("patient_id"));
		
		
		Patients patients=new Patients();
		int id=Integer.parseInt(request.getParameter("patient_id"));
		System.out.println(id);
		patients.setPatient_id(id);
		patients.setName(request.getParameter("name"));
		patients.setMobileno(Long.parseLong(request.getParameter("mobileno")));
		patients.setEmail(request.getParameter("email"));
		patients.setCity(request.getParameter("city"));
		patients.setCountry(request.getParameter("country"));
		
		patients.setDoctors(patients1.getDoctors());
		
		
		patientService.updatePatient(patients);
		model.put("message", "Patient Details updated successfully");
		Long doctorAvail=adminService.countDoctors();
		Long patientAvail=adminService.countPatients();
		model.put("doctorAvail", doctorAvail);
		model.put("patientAvail", patientAvail);
		model.put("appointmentAvail", patientAvail);
		return "Admin.jsp";		
	}
	
		@RequestMapping("updatePatientByDoc.cdac")
		public String updatePatientByDoc(HttpServletRequest request,Map<String, Object> model) {
			
			Patients patients1=patientService.fetchPatientByID(request.getParameter("patient_id"));
			
			
			Patients patients=new Patients();
			int id=Integer.parseInt(request.getParameter("patient_id"));
			System.out.println(id);
			patients.setPatient_id(id);
			patients.setName(request.getParameter("name"));
			patients.setMobileno(Long.parseLong(request.getParameter("mobileno")));
			patients.setEmail(request.getParameter("email"));
			patients.setCity(request.getParameter("city"));
			patients.setCountry(request.getParameter("country"));
			
			patients.setDoctors(patients1.getDoctors());
			
			
			patientService.updatePatient(patients);
			model.put("message", "Patient Details updated successfully");
			Long doctorAvail=adminService.countDoctors();
			Long patientAvail=adminService.countPatients();
			model.put("doctorAvail", doctorAvail);
			model.put("patientAvail", patientAvail);
			model.put("appointmentAvail", patientAvail);
			return "doctorLoggedIn.jsp";		
		}
	
	
	@RequestMapping("/deletePatient.cdac")
	public String deletePatient(HttpServletRequest request,Map<String, Object> model) {
			
			String id=request.getParameter("patient_id");   // from viewPatients.jsp
			System.out.println(id);
			
			Patients patients=patientService.fetchPatientByID(id);
		
			patientService.deletePatient(patients);
			model.put("message", "Patient Details Deleted successfully");
			Long doctorAvail=adminService.countDoctors();
			Long patientAvail=adminService.countPatients();
			model.put("doctorAvail", doctorAvail);
			model.put("patientAvail", patientAvail);
			model.put("appointmentAvail", patientAvail);
			return "Admin.jsp";
	
	}
	
	@RequestMapping("/deletePatByDoc.cdac")
	public String deletePatByDoc(HttpServletRequest request,Map<String, Object> model) {
			
			String id=request.getParameter("patient_id");   // from viewPatients.jsp
			System.out.println(id);
			
			Patients patients=patientService.fetchPatientByID(id);
		
			patientService.deletePatient(patients);
			model.put("message", "Patient Details Deleted successfully");
			Long doctorAvail=adminService.countDoctors();
			Long patientAvail=adminService.countPatients();
			model.put("doctorAvail", doctorAvail);
			model.put("patientAvail", patientAvail);
			model.put("appointmentAvail", patientAvail);
			return "doctorLoggedIn.jsp";
	
	}
	
		@RequestMapping("/showAppointment.cdac")
		public String showAppointment(HttpServletRequest request, Map model) {		
			
				List<Patients> patients = patientService.getAllPatient();
				model.put("patients",patients);
				 return "displayAppointment.jsp";
		}
		
		@RequestMapping("/bookAppointPat.cdac")
		public String bookAppointPat(HttpServletRequest request,Map<String, String> model) {
			System.out.println(request.getParameter("doct"));
			Patients patients=new Patients();
			
			patients.setName(request.getParameter("name"));
			patients.setMobileno(Long.parseLong(request.getParameter("mobileno")));
			patients.setEmail(request.getParameter("email"));
			patients.setCity(request.getParameter("city"));
			patients.setCountry(request.getParameter("country"));
			
			System.out.println(request.getParameter("doct"));
			Doctors doctors=doctorService.fetchDoctorByID(request.getParameter("doct"));
			
			
			patients.setDoctors(doctors);
			System.out.println(doctors.getName()+" "+doctors.getDoctor_id());
			
			patientService.addPatient(patients);
			model.put("message", "Appointment booked");
			return "index.jsp";
		}
}
	
