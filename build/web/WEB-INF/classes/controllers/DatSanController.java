/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controllers;

import dao.LichThueDAO;
import dao.SanDAO;
import daoImpl.LichThueDAOImpl;
import daoImpl.SanDAOImpl;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;
import javax.servlet.http.HttpSession;
import models.KhachHang;
import models.LichThue;
import models.San;
import models1.ChiTietDon;
import org.codehaus.jackson.map.ObjectMapper;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping(value="/booking", produces = "text/html; charset=UTF-8")
public class DatSanController {
    private LichThueDAO ltDAO = new LichThueDAOImpl();
    private SanDAO sanDAO = new SanDAOImpl();
    
    @RequestMapping(value="/list", method = RequestMethod.GET)
    public ModelAndView index(HttpSession session) {
        ModelAndView mv = new ModelAndView();
        String view = "timsan";
       
//        if (session.getAttribute("username") == null) {
//            view = "redirect:/login.html";
//        }
        mv.setViewName(view);
        
        return mv;
    }
    
    @RequestMapping(value="/search", method = RequestMethod.GET)
    @ResponseBody
    public ModelAndView search(
        HttpSession session,
        @RequestParam("checkin") String checkin,
        @RequestParam("checkout") String checkout,
        @RequestParam("type") String type
    ) throws IOException {
        if (session.getAttribute("sCheckin") != null) {
            session.removeAttribute("sCheckin");
        }
        session.setAttribute("sCheckin", checkin);
        
        if (session.getAttribute("sCheckout") != null) {
            session.removeAttribute("sCheckout");
            
        }
        session.setAttribute("sCheckout", checkout);
        checkin += ":00";
        checkout += ":00";
        
        
        ModelAndView mv = new ModelAndView();
        ArrayList<San> list = ltDAO.filter(checkin, checkout, type);
        String view = "ketquatimsan";
        
        
//        if (session.getAttribute("username") == null) {
//            view = "redirect:/login.html";
//        }
        mv.setViewName(view);
        mv.addObject("list", list);
        return mv;
    }
    
    @RequestMapping(value = "/select", method = RequestMethod.POST)
    @ResponseBody
    public String add(@RequestParam String id, HttpSession session) throws IOException {
        ObjectMapper mapper = new ObjectMapper();
        
        HashMap<String, San> listSan = (HashMap<String, San>) session.getAttribute("listSan");
        if (listSan == null) {
            listSan = new HashMap<>();
        }
        
        HashMap<String, String[]> temp = (HashMap<String, String[]>) session.getAttribute("tempList");
        if (temp == null) {
            temp = new HashMap<>();
        }
        
        Float tongtien = (Float) session.getAttribute("tongtien");
        if (tongtien == null) {
            tongtien = (float) 0;
        }
        
        Float tiencoc = (Float) session.getAttribute("tiencoc");
        if (tiencoc == null) {
            tiencoc = (float) 0;
        }
        
        San san = sanDAO.findById(Integer.parseInt(id));
        String[] response = new String[4];
        if (san != null) {
            if (listSan.containsKey(san.getMaSan())) {
                response[0] = "Sân đã tồn tại";    
            } else {
                listSan.put(san.getMaSan(), san);
                response[0] = "Thêm thành công";
                response[2] = "200";
                String[] detail = new String[5];
                detail[0] = "";
                detail[1] = "";
                detail[2] = "";
                detail[3] = "";
                detail[4] = "0";
                temp.put(san.getMaSan(), detail);
            }
        }
        KhachHang kh = (KhachHang) session.getAttribute("KhachHang");
        if (kh != null) {
            response[3] = "KH";
        }
        session.setAttribute(id, san);
        session.setAttribute("tongtien", tongtien);
        session.setAttribute("tiencoc", tiencoc);
        session.setAttribute("tempList", temp);
        session.setAttribute("listSan", listSan);
        session.setAttribute("listSize", listSan.size());
        response[1] = String.valueOf(listSan.size());
        
        return mapper.writeValueAsString(response);
    }
    
    @RequestMapping(value="/create", method = RequestMethod.GET)
    @ResponseBody
    public ModelAndView chitiet(HttpSession session) {
        ModelAndView mv = new ModelAndView();
        String view = "giaodienchitiet";
        mv.setViewName(view);
        return mv;
    }
    
    @RequestMapping(value="/remove", method = RequestMethod.POST)
    @ResponseBody
    public String remove(HttpSession session, @RequestParam String ma) throws IOException {
        HashMap<String, San> listSan = (HashMap<String, San>) session.getAttribute("listSan");
        HashMap<String, String[]> temp = (HashMap<String, String[]>) session.getAttribute("tempList");
        if (listSan == null) {
            listSan = new HashMap<>();
        }
        if (listSan.containsKey(ma)) {
            listSan.remove(ma);
        }
        if (temp == null) {
            temp = new HashMap<>();
        }
        if (temp.containsKey(ma)) {
            temp.remove(ma);
        }
        session.setAttribute("listSan", listSan);
        String[] response = new String[3];
        response[0] = "200";
        response[1] = String.valueOf(listSan.size());
        ObjectMapper mapper = new ObjectMapper();

        return mapper.writeValueAsString(response);
    }
    
    @RequestMapping(value="/temp-save", method = RequestMethod.POST)
    @ResponseBody
    public String tempSave(
        HttpSession session,
        @RequestParam("checkinTime") String checkinTime,
        @RequestParam("checkoutTime") String checkoutTime,
        @RequestParam("checkinDate") String checkinDate,
        @RequestParam("checkoutDate") String checkoutDate,
        @RequestParam("tamtinh") String tamtinh,
        @RequestParam("code") String code
    ) {
        ObjectMapper mapper = new ObjectMapper();
        HashMap<String, String[]> temp = (HashMap<String, String[]>) session.getAttribute("tempList");
        Float tongtien = (Float) session.getAttribute("tongtien");
        Float tiencoc = (Float) session.getAttribute("tiencoc");
        
        if (tongtien == null) {
            tongtien = (float)0;
        }
        
        if (tiencoc == null) {
            tiencoc = (float)0;
        }
        Double percent = 0.1;
                
        if (temp != null) {
            if (temp.containsKey(code)) {
                String[] oldDetail = temp.get(code);
                oldDetail[0] = checkinTime;
                oldDetail[1] = checkoutTime;
                oldDetail[2] = checkinDate;
                oldDetail[3] = checkoutDate;
                oldDetail[4] = tamtinh;
                temp.put(code, oldDetail);
            } else {
                String[] newDetail = new String[5];
                newDetail[0] = checkinTime;
                newDetail[1] = checkoutTime;
                newDetail[2] = checkinDate;
                newDetail[3] = checkoutDate;
                newDetail[4] = tamtinh;
                temp.put(code, newDetail);
            }
        } else {
            temp = new HashMap<String, String[]>();
            String[] newDetail = new String[5];
            newDetail[0] = checkinTime;
            newDetail[1] = checkoutTime;
            newDetail[2] = checkinDate;
            newDetail[3] = checkoutDate;
            newDetail[4] = tamtinh;
            temp.put(code, newDetail);
        }
        tiencoc = totalPrice(temp) * percent.floatValue();
        session.setAttribute("tiencoc", tiencoc);
        session.setAttribute("tempList", temp);
        session.setAttribute("tongtien", totalPrice(temp));
        return "123";
        
    }
    
    private float totalPrice(HashMap<String, String[]> cartItems) {
        int count = 0;
        for (Map.Entry<String, String[]> list : cartItems.entrySet()) {
            count += Float.parseFloat(list.getValue()[4]);
        }
        return count;
    }
}
