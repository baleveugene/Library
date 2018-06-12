
package com.springapp.mvc.web;

import javax.servlet.http.HttpSession;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class ControllerIndex  {
   
    @RequestMapping(value = "/index", method = RequestMethod.GET)
    public String index() {       
        return "redirect:/";
    }
 
    @RequestMapping(value = "/", method = RequestMethod.GET)
    public ModelAndView home(HttpSession session) {
        
        ModelAndView mv = new ModelAndView("index");
        session.setAttribute("currentpagewithpage", "/index");     
        return mv;
    }
  
}
