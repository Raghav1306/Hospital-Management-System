package com.cdac.controller;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.cdac.entity.Admin;
import com.cdac.exception.AdminServiceException;
import com.cdac.service.AdminService;

@Controller
public class AdminController {
	
	@Autowired
	private AdminService adminService;

	@RequestMapping("/adminLogin.cdac")
	public String adminLogin(HttpServletRequest request,HttpSession session, Map model) {
		String email=request.getParameter("email");
		String password=request.getParameter("password");
		session = request.getSession();
		session.setAttribute("message",null);
		try {
			Admin admin = adminService.login(email, password);
			Long doctorAvail=adminService.countDoctors();
			Long patientAvail=adminService.countPatients();
			session.setAttribute("Admin", admin.getFullname()); 
			session.setAttribute("message", null);
			model.put("doctorAvail", doctorAvail);
			model.put("patientAvail", patientAvail);
			model.put("appointmentAvail", patientAvail);
			 return "Admin.jsp";
		}
		catch(AdminServiceException e) {
			
			session.setAttribute("message", e.getMessage());
			System.out.println(session.getAttribute("message"));
			return "AdminLogin.jsp";
		}
	}
	
	@RequestMapping("/afterDeleteDoc.cdac")
	public String afterDeleteDoc( Map model) {
		Long doctorAvail=adminService.countDoctors();
		Long patientAvail=adminService.countPatients();
		model.put("doctorAvail", doctorAvail);
		model.put("patientAvail", patientAvail);
		 return "Admin.jsp";
		
	}
	
}
