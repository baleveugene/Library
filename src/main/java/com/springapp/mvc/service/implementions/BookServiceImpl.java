package com.springapp.mvc.service.implementions;

import com.springapp.mvc.dao.HbmDAO;
import com.springapp.mvc.domain.Book;
import com.springapp.mvc.domain.Author;

import com.springapp.mvc.service.interfaces.BookService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.Set;

@Service
public class BookServiceImpl implements BookService{

    @Autowired
    private HbmDAO hbmDAO;

    @Override @Transactional
    public List<Book> getListBooks() {
        return  hbmDAO.getAll(Book.class);
    }
    
    @Override @Transactional
    public Set<Book> getBooksByAuthor(String autorName) {
        Author author = (Author) hbmDAO.getByName(Author.class, autorName);
        return author.getBooks();
    }
    
    @Override @Transactional
    public Author getBookAuthor(String url) {
        Book book = (Book) hbmDAO.getByUrl(Book.class, url);
        Author author = book.getAuthors().iterator().next();      
        return author;
    }
     
    @Override @Transactional
    public Book getBookById(long id) {
        return  (Book) hbmDAO.getById(Book.class, id);
    }
    
    @Override @Transactional
    public Book getBookByName(String name) {           
        return  (Book) hbmDAO.getByName(Book.class, name);      
    }
    
    @Override @Transactional
    public Book getBookByUrl(String url) {           
        return  (Book) hbmDAO.getByUrl(Book.class, url);      
    }
    
    @Override @Transactional
    public void add(String bookName, String authorName, String lang, 
            String publisher, String volume, String yearOfPublication, 
            String cityOfPublication, String description) {
        Author author = new Author(authorName);
        author.setUrl(authorName);
        author.setPhoto1(authorName);
        Book book = new Book(bookName, lang, yearOfPublication, volume, publisher, cityOfPublication);
        book.addAuthor(author);
        book.setUrl(bookName);
        book.setPhoto1(bookName);
        book.setDescription(description);
        author.addBook(book);
        hbmDAO.add(book);
    }
    
    @Override @Transactional
    public void update(String bookName, String url, String authorName, String lang, 
            String publisher, String volume, String yearOfPublication, 
            String cityOfPublication, String description) {
        Book book = (Book) hbmDAO.getByUrl(Book.class, url);
        if(bookName!=null && !bookName.equals("")){
            book.setName(bookName);
            book.setUrl(bookName);
            book.setPhoto1(bookName);
        }
        if(authorName!=null && !authorName.equals("")){
            Author author = new Author(authorName);
            if(hbmDAO.getByName(Author.class, authorName)== null){               
                hbmDAO.add(author);
            }
            author = (Author) hbmDAO.getByName(Author.class, authorName);
            Set<Author> bookAuthors = book.getAuthors();
            if(!bookAuthors.contains(author)){
                book.addAuthor(author);
                author.addBook(book);
            }
        }
        if(lang!=null && !lang.equals("")){
            book.setLang(lang);           
        }
        if(publisher!=null && !publisher.equals("")){
            book.setPublisher(publisher);           
        }
        if(volume!=null && !volume.equals("")){
            book.setVolume(volume);           
        }
        if(yearOfPublication!=null && !yearOfPublication.equals("")){
            book.setYearOfPublication(yearOfPublication);           
        }
        if(cityOfPublication!=null && !cityOfPublication.equals("")){
            book.setCityOfPublication(cityOfPublication);           
        }
        if(description!=null && !description.equals("")){
            book.setDescription(description);           
        }
        hbmDAO.update(book);
    }
    
    @Override @Transactional
    public void delete(String url) {
        Book book = (Book) hbmDAO.getByUrl(Book.class, url);
        hbmDAO.delete(book);
    }
    
    @Override @Transactional
    public List<Book> getListBookFromSearch(String word) {
      return hbmDAO.getListFromSearch(Book.class, word);
    }    
}
