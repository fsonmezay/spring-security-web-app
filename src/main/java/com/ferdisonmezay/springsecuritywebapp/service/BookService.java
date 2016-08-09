package com.ferdisonmezay.springsecuritywebapp.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ferdisonmezay.springsecuritywebapp.dao.BookDao;
import com.ferdisonmezay.springsecuritywebapp.entity.Book;

@Service
public class BookService
{
	@Autowired
	protected BookDao bookDao;

	public List<Book> getBooks()
	{
		return bookDao.getBooks();
	}

	public void create(Book book)
	{
		bookDao.create(book);
	}

	public void delete(Book book)
	{
		bookDao.delete(book);
	}

	public Book getById(Long id)
	{
		return bookDao.getById(id);
	}

	public void update(Book book)
	{
		bookDao.update(book);
	}

}
