package com.springapp.mvc.service.implementions;

import com.springapp.mvc.dao.HbmDAO;
import com.springapp.mvc.domain.Author;
import com.springapp.mvc.domain.Book;
import com.springapp.mvc.service.interfaces.AuthorService;
import java.util.ArrayList;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.Set;
import org.hibernate.criterion.Criterion;
import org.hibernate.criterion.Restrictions;

@Service
public class AuthorServiceImpl implements AuthorService{

    @Autowired
    private HbmDAO hbmDAO;

    @Override @Transactional
    public void add(String authorName, String description) {
        Author author = new Author(authorName);
        author.setPhoto1(authorName);
        author.setDescription(description);        
        author.setUrl(authorName);       
        hbmDAO.add(author);
    }
    
    @Override @Transactional
    public void update(String authorName, String description, String url) {
        Author author = (Author) hbmDAO.getByUrl(Author.class, url);
        if(authorName!=null && !authorName.equals("")){
            author.setName(authorName);
            author.setUrl(authorName);
            author.setPhoto1(authorName);
        }       
        if(description!=null && !description.equals("")){
            author.setDescription(description);           
        }
        hbmDAO.update(author);
    }
    
    @Override @Transactional
    public List<Author> getListAuthors() {
        return  hbmDAO.getAll(Author.class);
    }
     
    @Override @Transactional
    public Author getAuthorById(long id) {
        return  (Author) hbmDAO.getById(Author.class, id);
    }
    
    @Override @Transactional
    public Author getAuthorByName(String name) {
        List<Criterion> restrictions = new ArrayList();
        if (name != null && !name.equals("")){
            restrictions.add(Restrictions.eq("authorName", name));                  
        }       
        return  (Author) hbmDAO.getAll(Author.class, restrictions).get(0);       
    }
    
    @Override @Transactional
    public Author getAuthorByUrl(String url) {           
        return  (Author) hbmDAO.getByUrl(Author.class, url);      
    }    
    
    @Override @Transactional
    public void delete(String url) {
        Author author = (Author) hbmDAO.getByUrl(Author.class, url);
        hbmDAO.delete(author);
    }
    
    @Override @Transactional
    public List<Author> getListAuthorFromSearch(String word) {
      return hbmDAO.getListFromSearch(Author.class, word);
    }
}
