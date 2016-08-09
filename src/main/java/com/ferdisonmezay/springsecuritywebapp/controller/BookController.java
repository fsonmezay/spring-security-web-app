package com.ferdisonmezay.springsecuritywebapp.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.ferdisonmezay.springsecuritywebapp.entity.Book;
import com.ferdisonmezay.springsecuritywebapp.service.BookService;

@Controller
public class BookController {
	
	@Autowired
	protected BookService bookService;

	@RequestMapping(value = "/books")
	public String getBooks(Model model) {
		List<Book> books = bookService.getBooks();
		model.addAttribute("books", books);
		return "books/list-books";
	}

	@RequestMapping(value = "create-book")
	public String createBookGet(Model model) {
		model.addAttribute("book", new Book());
		return "books/create-book";
	}

	@RequestMapping(value = "create-book", method = RequestMethod.POST)
	public String createBookPost(@ModelAttribute("book") Book book) {
		bookService.create(book);
		return "redirect:books";
	}

	@RequestMapping(value = "delete-book", method = RequestMethod.GET)
	public String deleteBook(@ModelAttribute("book") Long bookId) {
		Book book = bookService.getById(bookId);
		bookService.delete(book);
		return "redirect:books";
	}

	@RequestMapping(value = "/update-book/{id}", method = RequestMethod.GET)
	public String updateBookForm(Model model, @PathVariable Long id) {
		model.addAttribute("book", bookService.getById(id));
		return "books/create-book";
	}

	@RequestMapping(value = "/update-book/{id}", method = RequestMethod.POST)
	public String updateBook(Model model, @ModelAttribute("book") Book book) {
		bookService.update(book);
		model.addAttribute("book", book);
		return "redirect:/book/{id}";
	}

	@RequestMapping(value = "/book/{id}", method = RequestMethod.GET)
	public String displayBook(Model model, @PathVariable Long id) {
		model.addAttribute("book", bookService.getById(id));
		return "books/display-book";
	}
}
