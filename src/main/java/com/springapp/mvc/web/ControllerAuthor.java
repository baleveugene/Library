package com.springapp.mvc.web;

import com.springapp.mvc.domain.Book;
import com.springapp.mvc.domain.Author;
import com.springapp.mvc.service.interfaces.BookService;
import com.springapp.mvc.service.interfaces.AuthorService;
import java.util.Set;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;


@Controller
public class ControllerAuthor {

    @Autowired  BookService bookService;
    @Autowired  AuthorService authorService;
   
    @RequestMapping(value="/author", method = RequestMethod.GET)
    public ModelAndView author_all( HttpSession session ) {             
        ModelAndView mv = new ModelAndView("author_all");                                    
        mv.addObject("listAuthors", authorService.getListAuthors());              
        session.setAttribute("search", "author"); // for search                  
        session.setAttribute("currentpagewithpage", "/");
        return mv;
    }
        
    @RequestMapping(value = "/author-{url}", method = RequestMethod.GET)
    public ModelAndView author_one(@PathVariable ("url") String url, HttpSession session) {                 
        ModelAndView mv = new ModelAndView("author_one");               
        Author author = authorService.getAuthorByUrl(url);
        Set<Book> books = author.getBooks();
        mv.addObject("listBooks", books);
        mv.addObject("author", author);
        session.setAttribute("search", "author"); // for search       
        session.setAttribute("currentpagewithpage", "/author-" + url);       
        return mv;
    }
    
    @RequestMapping(value = "/author/add", method = RequestMethod.GET)
    public ModelAndView author_add(HttpSession session) {       
        ModelAndView mv = new ModelAndView("author_add");               
        session.setAttribute("search", "author"); // for search       
        return mv;       
    }
    
    @RequestMapping(value="/author/add", method = RequestMethod.POST)
    public ModelAndView author_add( @RequestParam(value = "authorName") String authorName,                                  
                                  @RequestParam(value = "description") String description,
                                  HttpSession session ) {                            
            authorService.add(authorName, description);
            Author author = authorService.getAuthorByName(authorName);           
            return author_one(author.getUrl(), session);                                                    
    } 
    
    @RequestMapping(value = "/author-{url}/update", method = RequestMethod.GET)
    public ModelAndView author_update(@PathVariable ("url") String url, HttpSession session) {        
        ModelAndView mv = new ModelAndView("author_update");       
        Author author = authorService.getAuthorByUrl(url);       
        mv.addObject("author", author);
        return mv;       
    }
    
    @RequestMapping(value="/author-{url}/update", method = RequestMethod.POST)
    public ModelAndView author_update( @PathVariable ("url") String url,
                                  @RequestParam(value = "authorName") String authorName,                                  
                                  @RequestParam(value = "description") String description,
                                  HttpSession session ) {
        if(authorName=="" && description==""){                     
            return author_one(url, session);
        } else {
            Author author = authorService.getAuthorByUrl(url);
            authorService.update(authorName, description, url);
            author = authorService.getAuthorById(author.getId());           
            return author_one(author.getUrl(), session);
        }                                                               
    } 
    
    @RequestMapping(value = "/author-{url}/delete", method = RequestMethod.GET)
    public ModelAndView author_delete(@PathVariable ("url") String url, HttpSession session) {       
        ModelAndView mv = new ModelAndView("author_delete");
        Author author = authorService.getAuthorByUrl(url);       
        mv.addObject("author", author);
        return mv;       
    }
    
    @RequestMapping(value="/author-{url}/delete", method = RequestMethod.POST)
    public String author_delete_yes( @PathVariable ("url") String url, 
                                   @RequestParam(value = "submit", required = false) String submit,
                                   HttpSession session ) {                
        if(submit!=null && submit!=""){
            Author author = authorService.getAuthorByUrl(url);
            if(author.getBooks().isEmpty()){
                authorService.delete(url);
            }           
        }                          
        return "redirect:/author";                                                                      
    }    
}
