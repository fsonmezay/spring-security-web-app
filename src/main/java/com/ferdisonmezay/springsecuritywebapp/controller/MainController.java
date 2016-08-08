package com.ferdisonmezay.springsecuritywebapp.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MainController {

	@RequestMapping(value = "/*")
	public String mainController(Model model) {
		return "index";
	}

}
