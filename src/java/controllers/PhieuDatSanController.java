/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controllers;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;


@Controller
@RequestMapping(value="/bill", produces = "text/html; charset=UTF-8")
public class PhieuDatSanController {
    @RequestMapping(value="/store", method = RequestMethod.POST)
    public ModelAndView index(HttpSession session, HttpServletRequest req) {
        
        ModelAndView mv = new ModelAndView();
        String view = "timsan";
       
//        if (session.getAttribute("username") == null) {
//            view = "redirect:/login.html";
//        }
        mv.setViewName(view);
        
        return mv;
    }
}
