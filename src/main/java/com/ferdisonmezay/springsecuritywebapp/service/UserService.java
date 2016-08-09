package com.ferdisonmezay.springsecuritywebapp.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ferdisonmezay.springsecuritywebapp.dao.RoleDao;
import com.ferdisonmezay.springsecuritywebapp.dao.UserDao;
import com.ferdisonmezay.springsecuritywebapp.entity.Role;
import com.ferdisonmezay.springsecuritywebapp.entity.User;

@Service
public class UserService {
	
	@Autowired
	private UserDao userDao;
	
	@Autowired 
	private RoleDao roleDao;
	
	public List<User> getList(){
		return userDao.getList();
	}
	
	public void create(User user){
		userDao.save(user);
	}
	
	public void deleteUser(Integer userId){
		userDao.delete(userId);
	}
	
	public List<Role> getRoles(){
		return roleDao.getRoles();
	}

	public Role getRoleById(Long roleId) {
		return roleDao.getRoleById(roleId);
	}
}
