package com.springapp.mvc.web;

import com.springapp.mvc.domain.Author;
import com.springapp.mvc.domain.Book;
import com.springapp.mvc.service.interfaces.BookService;
import com.springapp.mvc.service.interfaces.AuthorService;

import java.util.List;

import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class ControllerSearch {
  
    @Autowired  BookService bookService;
    @Autowired  AuthorService authorService;

    private void putBookFilters (ModelAndView mv){
        mv.addObject("listAuthors", authorService.getListAuthors()); //  for   filter
    }
   
    @RequestMapping(value = "/search", method = RequestMethod.GET)
    public ModelAndView vmc_select( @RequestParam(value = "search", defaultValue = "dmg") String key,
                                    HttpSession session  ) {    
        ModelAndView mv = new ModelAndView(); 
        String search_page = (String) session.getAttribute("search");
        if (search_page==null) {
            search_page = "book";
        }         
        switch(search_page) {         
            case "book":
                  mv = new ModelAndView ("book_all");
                  mv.addObject("listBooks", bookService.getListBookFromSearch(key)); 
                  putBookFilters(mv);
               break;           
            case "author":
                  mv = new ModelAndView ("author_all");
                  mv.addObject("listAuthors", authorService.getListAuthorFromSearch(key));                  
               break;
        }   
        session.setAttribute("currentpagewithpage", "/search?search="+key);    
        return mv ;
    }  
}
