/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.springapp.mvc.web;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import org.springframework.stereotype.Controller;
/**
 *
 * @author Admin
 */

@Controller
public class ControllerError {
    
    @RequestMapping(value = "/error403" , method = RequestMethod.GET)
    public String m403() {
        return "errors/error403";
    }


    @RequestMapping(value = "/error404", method = RequestMethod.GET)
    public String m404() {
        return "errors/error404";
    }

    @RequestMapping(value = "/error500", method = RequestMethod.GET)
    public String m500() {
        return "errors/error500";
    }

    @RequestMapping(value = "/error400", method = RequestMethod.GET)
    public String m400() {
        return "errors/error400";
    }
  
    
}
