package com.springapp.mvc.service.interfaces;

import com.springapp.mvc.domain.Author;
import com.springapp.mvc.domain.Book;

import java.util.List;

public interface AuthorService {
 
    public Author getAuthorById(long id);
    public Author getAuthorByName(String name);
    public Author getAuthorByUrl(String url);
  
    public  List<Author> getListAuthorFromSearch(String word);

    public List<Author> getListAuthors();
    public void add(String authorName, String description);
    public void update(String authorName, String description, String url);
    public void delete (String url);
}

