package com.springapp.mvc.service.interfaces;

import com.springapp.mvc.domain.Author;
import com.springapp.mvc.domain.Book;

import java.util.List;
import java.util.Set;

public interface BookService {
    
    public Book getBookByName(String name);
    public Book getBookByUrl(String url);
    public Book getBookById(long id);
  
    public  List<Book> getListBookFromSearch(String word);

    public List<Book> getListBooks();
    public Set<Book> getBooksByAuthor(String authorName);
    public Author getBookAuthor(String url);
    public void add(String bookName, String authorName, String lang, 
            String publisher, String volume, String yearOfPublication, 
            String cityOfPublication, String description);
    public void update(String bookName, String url, String authorName, String lang, 
            String publisher, String volume, String yearOfPublication, 
            String cityOfPublication, String description);
    public void delete (String url);
}

