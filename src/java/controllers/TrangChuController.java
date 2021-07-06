/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controllers;

import javax.servlet.http.HttpSession;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping(value="/")
public class TrangChuController {
    @RequestMapping(value = "/index", method = RequestMethod.GET)
    public String index(HttpSession session) {
        if (session.getAttribute("username") == null) {
            return "redirect:login.html";
        }
 
        return "index";
    }
    
    @RequestMapping(value = "/login", method = RequestMethod.GET)
    public String login(HttpSession session) {
        if (session.getAttribute("username") != null) {
            return "redirect:index.html";
        }
        
        return "login";
    }
    
    @RequestMapping(value = "/logout", method = RequestMethod.GET)
    public String logout(HttpSession session) {
        session.removeAttribute("username");
        session.removeAttribute("name");
        session.removeAttribute("nguoidung");
        session.removeAttribute("listSan");
        session.removeAttribute("KhachHang");
        session.removeAttribute("tongtien");
        session.removeAttribute("tiencoc");
        session.removeAttribute("tempList");
        return "redirect:login.html";
    }
}
