package com.ferdisonmezay.springsecuritywebapp.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class ErrorHandleController {

	@RequestMapping(value = "/accessdenied")
	public String accessDenied(Model model) {
		return "errors/403";
	}
}
