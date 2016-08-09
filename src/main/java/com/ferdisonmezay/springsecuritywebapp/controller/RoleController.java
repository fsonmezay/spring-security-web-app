package com.ferdisonmezay.springsecuritywebapp.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.ferdisonmezay.springsecuritywebapp.entity.Role;
import com.ferdisonmezay.springsecuritywebapp.service.RoleService;

@Controller
public class RoleController
{
	@Autowired
	protected RoleService service;

	@RequestMapping(value = "/admin/roles")
	public String getRoles(Model model) {
		model.addAttribute("roles", service.getRoles());
		return "roles/list-roles";
	}
	
	@RequestMapping(value = "/admin/create-role")
	public String createRoleGet(Model model) {
		model.addAttribute("role", new Role());
		return "roles/create-role";
	}

	@RequestMapping(value = "/admin/create-role", method = RequestMethod.POST)
	public String createRolePost(@ModelAttribute("role") Role role) {
		service.create(role);
		return "redirect:roles";
	}
	
	@RequestMapping(value = "/admin/delete-role", method = RequestMethod.GET)
	public String deleteRole(@ModelAttribute("role") Long roleId) {
		Role role = service.getById(roleId);
		service.delete(role);
		return "redirect:roles";
	}
	
	@RequestMapping(value = "/admin/update-role/{id}", method = RequestMethod.GET)
	public String updateRoleForm(Model model, @PathVariable Long id){
		model.addAttribute("role", service.getById(id));
		return "roles/create-role";
	}
	
	@RequestMapping(value = "/admin/update-role/{id}", method = RequestMethod.POST)
	public String updateRole(Model model, @ModelAttribute("role") Role role){
		service.update(role);
		model.addAttribute("role", role);
		return "redirect:/admin/role/{id}";
	}
	
	@RequestMapping(value = "/admin/role/{id}", method = RequestMethod.GET)
	public String displayRole(Model model, @PathVariable Long id){
		model.addAttribute("role", service.getById(id));
		return "roles/display-role";
	}
}
