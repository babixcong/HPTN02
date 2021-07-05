/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controllers;

import dao.NguoiDungDAO;
import daoImpl.NguoiDungDAOImpl;
import javax.servlet.http.HttpSession;
import models.NguoiDung;
import org.json.JSONException;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping(value="/user")
public class LoginController {  
    private NguoiDungDAO ndDAO = new NguoiDungDAOImpl();
    @RequestMapping(value = "/login", method = RequestMethod.POST)
    @ResponseBody
    public String login(@RequestParam("email") String email, @RequestParam("password") String pw, HttpSession session) throws JSONException {
        boolean checkLogin = ndDAO.checkLogin(email, pw);
        if (checkLogin == true) {
            NguoiDung nguoidung = ndDAO.findByEmail(email);
            session.setAttribute("nguoidung", nguoidung);
            session.setAttribute("username", nguoidung.getEmail());
            session.setAttribute("name", nguoidung.getHoten());
            session.setAttribute("userid", nguoidung.getId());
            
            return "index.html";
        } 
        
        return "Thông tin đăng nhập sai! Hãy kiểm tra lại";
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
