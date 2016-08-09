package com.ferdisonmezay.springsecuritywebapp.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ferdisonmezay.springsecuritywebapp.dao.RoleDao;
import com.ferdisonmezay.springsecuritywebapp.entity.Role;

@Service
public class RoleService {
	
	@Autowired
	private RoleDao roleDao;
	
	public List<Role> getRoles() {
		return roleDao.getRoles();
	}

	public void create(Role role) {
		roleDao.createRole(role);
	}

	public void delete(Role role) {
		roleDao.deleteRolek(role);
	}

	public Role getById(Long id) {
		return roleDao.getRoleById(id);
	}

	public void update(Role role) {
		roleDao.updateRole(role);

	}

}
