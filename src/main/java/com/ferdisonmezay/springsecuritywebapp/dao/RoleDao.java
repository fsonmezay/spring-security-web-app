package com.ferdisonmezay.springsecuritywebapp.dao;

import java.util.List;

import javax.transaction.Transactional;

import org.hibernate.SessionFactory;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ferdisonmezay.springsecuritywebapp.entity.Role;

@Repository
@Transactional
public class RoleDao {
	@Autowired
	private SessionFactory sessionFactory;
	
	@SuppressWarnings("unchecked")
	public List<Role> getRoles(){
		return (List<Role>) sessionFactory.getCurrentSession()
					.createCriteria(Role.class).list();
	}
	
	public Role getRoleById(Long roleId){
		return (Role) sessionFactory.getCurrentSession()
					.createCriteria(Role.class)
					.add(Restrictions.eq("id", roleId)).uniqueResult();
				
	}
	
	public void createRole(Role role) {
		sessionFactory.getCurrentSession().save(role);
	}
	
	public void deleteRolek(Role role) {
		sessionFactory.getCurrentSession().delete(role);
	}
	
	public void updateRole(Role role){
		sessionFactory.getCurrentSession().merge(role);
	}
}
