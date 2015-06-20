package controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class AppController {
	
	@RequestMapping(value="/index", method = RequestMethod.GET)
	public String printWelcome() {
 		return "index";
 	}

	@RequestMapping(value="/home", method = RequestMethod.GET)
	public String getHome(ModelMap model) {
 		return "home";
 	}

	@RequestMapping(value="/reporting", method = RequestMethod.GET)
	public String getReporting() {
 		return "reporting";
 	}

	@RequestMapping(value="/sysAdmin", method = RequestMethod.GET)
	public String getSysAdmin(HttpServletRequest request, HttpServletResponse response) {
		/*int role = (Integer)request.getSession(false).getAttribute("role");
		if(role < 2)
 			return "error";*/
 		return "sysAdmin";
 	}

	/*
	@RequestMapping(value="/scheduling", method = RequestMethod.GET)
	public String getScheduling(HttpServletRequest request) {
		int role = (Integer)request.getSession(false).getAttribute("role");
 		if(role < 2)
 			return "error";
		return "scheduling";
 	}

	@RequestMapping(value="/userAdmin", method = RequestMethod.GET)
	public String getUserAdmin(HttpServletRequest request) {
		int role = (Integer)request.getSession(false).getAttribute("role");
 		if(role < 3)
 			return "error";
 		return "userAdmin";
 	}*/

	@RequestMapping(value="/login", method = RequestMethod.GET)
	public String login() {
		return "login";
 	}

	@RequestMapping(value="/status", method = RequestMethod.GET)
	public String getStatus() {
 		return "status";
 	}
	@RequestMapping(value="/loginfailed", method = RequestMethod.GET)
	public String loginerror() {
 		return "login";
 	}
}