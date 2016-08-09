package com.ferdisonmezay.springsecuritywebapp.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.ferdisonmezay.springsecuritywebapp.entity.User;
import com.ferdisonmezay.springsecuritywebapp.service.UserService;


@Controller
public class AdminController {
	
	@Autowired
	private UserService userService;
		
	@RequestMapping(value = "/admin/users")
	public String userManagement(Model model) {
		model.addAttribute("users", userService.getList());
		model.addAttribute("roles", userService.getRoles());
		return "admin/users";
	}
	
	@RequestMapping(value="/admin/add-user", method = RequestMethod.POST)
	public String addUser(@RequestParam(value = "userName") String username, 
						  @RequestParam(value = "password") String password, 
						  @RequestParam(value = "repassword") String repassword, 
						  @RequestParam(value = "role") String roleId,
						  Model model)
	{
		
		User user = new User();
		user.setRole(userService.getRoleById(Long.valueOf(roleId)));
		user.setUserName(username);
		user.setPassword(password);
		userService.create(user);
		
		return "redirect:/admin/users";
	}
	
	@RequestMapping(value="/admin/delete-user", method = RequestMethod.GET)
	public String deleteUser(@RequestParam(value = "userId") Integer userId, Model model)
	{
		userService.deleteUser(userId);
		return "redirect:/admin/users";
	}
	
}
