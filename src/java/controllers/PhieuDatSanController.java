/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controllers;

import dao.LichThueDAO;
import dao.PhieuDatSanDAO;
import daoImpl.LichThueDAOImpl;
import daoImpl.PhieuDatSanDAOImpl;
import java.io.IOException;
import java.sql.Date;
import java.sql.Time;
import java.util.HashMap;
import java.util.Random;
import javax.servlet.http.HttpSession;
import models.KhachHang;
import models.LichThue;
import models.NguoiDung;
import models.PhieuDatSan;
import models.San;
import java.util.ArrayList;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;


@Controller
@RequestMapping(value="/bill", produces = "text/html; charset=UTF-8")
public class PhieuDatSanController {
    private PhieuDatSanDAO pdsDAO = new PhieuDatSanDAOImpl();
    private LichThueDAO ltDAO = new LichThueDAOImpl();
    
    @RequestMapping(value="/store", method = RequestMethod.POST)
    @ResponseBody
    public String index(
        HttpSession session,
        @RequestParam("checkinHour[]") String[] checkinHour,
        @RequestParam("checkoutHour[]") String[] checkoutHour,
        @RequestParam("checkinDate[]") String[] checkinDate,
        @RequestParam("checkoutDate[]") String[] checkoutDate,
        @RequestParam("code[]") String[] code
    ) throws IOException {
        Float tongtien = (Float) session.getAttribute("tongtien");
        Float tiencoc = (Float) session.getAttribute("tiencoc");
        KhachHang kh = (KhachHang) session.getAttribute("KhachHang");
        NguoiDung nd = (NguoiDung) session.getAttribute("nguoidung");
        HashMap<String, San> listSan = (HashMap<String, San>) session.getAttribute("listSan");
        Random rand = new Random();
        ArrayList<LichThue> newList = new ArrayList<LichThue>();
        
        PhieuDatSan pds = new PhieuDatSan();
        pds.setKh(kh);
        pds.setTiencoc(tiencoc);
        pds.setTongtien(tongtien);
        pds.setMaPhieu(String.valueOf(rand.nextLong()));
        pds.setNd(nd);
        
        PhieuDatSan newPDS = pdsDAO.store(pds);
        
        for (int i = 0; i < listSan.size(); i++) {
            LichThue lt = new LichThue();
            lt.setKh(kh);
            lt.setPds(newPDS);
            lt.setCheckinHour(Time.valueOf(checkinHour[i] + ":00"));
            lt.setCheckoutHour(Time.valueOf(checkoutHour[i] + ":00"));
            lt.setCheckinDate(Date.valueOf(checkinDate[i]));
            lt.setCheckoutDate(Date.valueOf(checkoutDate[i]));
            lt.setS(listSan.get(code[i]));
            LichThue newLt = ltDAO.store(lt);
        }
        
        session.removeAttribute("khachhang");
        session.removeAttribute("listSan");
        session.removeAttribute("tempList");
        session.removeAttribute("tongtien");
        session.removeAttribute("tiencoc");
        
        return "200";
    }
    
    @RequestMapping(value="/detail", method = RequestMethod.GET)
    @ResponseBody
    public ModelAndView show(@RequestParam("id") String id) {
        ModelAndView mv = new ModelAndView();
        String view = "xacnhan";
        PhieuDatSan pds = pdsDAO.findById(Integer.parseInt(id));
        System.out.println(pds.getKh().getHoten());
        
        mv.addObject("pds", pds);
        mv.setViewName(view);
        return mv;
    }
}
