package com.ferdisonmezay.springsecuritywebapp.dao;

import java.util.List;

import javax.transaction.Transactional;

import org.hibernate.SessionFactory;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ferdisonmezay.springsecuritywebapp.entity.Book;

@Repository
@Transactional
public class BookDao
{
	@Autowired
	protected SessionFactory sessionFactory;

	@SuppressWarnings("unchecked")
	public List<Book> getBooks() {
		List<Book> bookList =  sessionFactory.getCurrentSession()
				.createCriteria(Book.class)
				.list();
		return bookList;
	}

	public void create(Book book) {
		sessionFactory.getCurrentSession().save(book);
	}
	
	public void delete(Book book) {
		sessionFactory.getCurrentSession().delete(book);
	}
	
	public Book getById(Long id){
		Book book =  (Book) sessionFactory.getCurrentSession()
				.createCriteria(Book.class)
				.add(Restrictions.eq("id", id))
				.uniqueResult();
		return book;
	}
	
	public void update(Book book){
		sessionFactory.getCurrentSession().merge(book);
	}
}
