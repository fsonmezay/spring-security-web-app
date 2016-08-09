package com.ferdisonmezay.springsecuritywebapp.dao;

import java.util.List;

import javax.transaction.Transactional;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ferdisonmezay.springsecuritywebapp.entity.User;

@Repository
@Transactional
public class UserDao {
	
	@Autowired
	protected SessionFactory sessionFactory;
	
	public List<User> getList(){
		return (List<User>)sessionFactory.getCurrentSession().createCriteria(User.class).list();
	}
	
	public void save(User user){
		sessionFactory.getCurrentSession().persist(user);
	}
	
	public void delete(Integer userId){
		sessionFactory.getCurrentSession().createQuery("DELETE from User where id= :userId").setParameter("userId", userId).executeUpdate();
	}
}
