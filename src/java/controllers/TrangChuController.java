/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controllers;

import dao1.KhachHangDAO;
import dao1.QuaDAO;
import dao1.VatPhamDAO;
import dao1.VeDAO;
import daoImpl1.KhachHangDAOImpl;
import daoImpl1.QuaDAOImpl;
import daoImpl1.VatPhamDAOImpl;
import daoImpl1.VeDAOImpl;
import java.util.ArrayList;
import javax.servlet.http.HttpSession;
import models1.KhachHang;
import models1.Qua;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

/**
 *
 * @author CongNguyen
 */
@Controller
@RequestMapping(value="/")
public class TrangChuController {
    private KhachHangDAO khDAO = new KhachHangDAOImpl();
    private QuaDAO qDAO = new QuaDAOImpl();
    @RequestMapping(value = "/index", method = RequestMethod.GET)
    public String index(HttpSession session) {
//        if (session.getAttribute("username") == null) {
//            return "redirect:login.html";
//        }
// 
        return "index";
    }
    
    @RequestMapping(value = "gifts/exchange", method = RequestMethod.GET)
    public ModelAndView indexHome(HttpSession session) {
        String view = "doiqua";
        if (session.getAttribute("username") == null) {
            view = "redirect:/login.html";
        }
        
        ModelAndView mv = new ModelAndView();
        mv.setViewName(view);
        ArrayList<KhachHang> list = khDAO.getAll();
        System.out.println(list.size());
        mv.addObject("list", list);
        
        return mv;
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
        session.removeAttribute("userid");
        session.removeAttribute("myCartItems");
        session.removeAttribute("myCartNum");
        session.removeAttribute("myCartTotal");
        session.removeAttribute("the");
        session.removeAttribute("kh");
        session.removeAttribute("checkcust");
        return "redirect:login.html";
    }
    
    @RequestMapping(value = "/refresh", method = RequestMethod.GET)
    public String refresh(HttpSession session) {
        session.removeAttribute("myCartItems");
        session.removeAttribute("myCartNum");
        session.removeAttribute("myCartTotal");
        session.removeAttribute("the");
        session.removeAttribute("kh");
        session.removeAttribute("checkcust");
        return "redirect:index.html";
    }
}
