/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controllers;

import dao.DiaChiDAO;
import dao.KhachHangDAO;
import daoImpl.DiaChiDAOImpl;
import daoImpl.KhachHangDAOImpl;
import java.io.IOException;
import java.util.ArrayList;
import javax.servlet.http.HttpSession;
import models.DiaChi;
import models.KhachHang;
import org.codehaus.jackson.map.ObjectMapper;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping(value = "/customers", produces = "text/html; charset=UTF-8")
public class KhachHangController {
    private KhachHangDAO khDAO = new KhachHangDAOImpl();
    private DiaChiDAO dcDAO = new DiaChiDAOImpl();
    
    @RequestMapping(value = "/search", method = RequestMethod.GET)
    @ResponseBody
    public ModelAndView searchByName(HttpSession session) {
        ModelAndView mv = new ModelAndView();
        
        ArrayList<KhachHang> list = khDAO.getAll();
        String view = "timkhachhang";

//        if (session.getAttribute("username") == null) {
//            view = "redirect:/login.html";
//        }
        mv.addObject("list", list);
        mv.setViewName(view);
        
        return mv;
    }
    
    @RequestMapping(value = "/create", method = RequestMethod.GET)
    @ResponseBody
    public ModelAndView create(HttpSession session) {
        ModelAndView mv = new ModelAndView();
        String view = "themmoi";

//        if (session.getAttribute("username") == null) {
//            view = "redirect:/login.html";
//        }
        mv.setViewName(view);
        
        return mv;
    }
    
    @RequestMapping(value = "/store", method = RequestMethod.POST)
    @ResponseBody
    public String store(
        @RequestParam("ho") String ho,
        @RequestParam("dem") String dem,
        @RequestParam("ten") String ten,
        @RequestParam("cmt") String cmt,
        @RequestParam("email") String email,
        @RequestParam("sdt") String sdt,
        @RequestParam("sonha") String sonha,
        @RequestParam("pho") String pho,
        @RequestParam("phuong") String phuong,
        @RequestParam("quan") String quan,
        @RequestParam("thanhpho") String thanhpho
    ) throws IOException {
        int lastKey = khDAO.getLatestKey();
        KhachHang kh = new KhachHang();
        kh.setMaKH("KH" + String.valueOf(lastKey + 1));
        kh.setCmt(cmt);
        kh.setEmail(email);
        kh.setSdt(sdt);
        String hoten = ho + " " + dem + " " + ten;
        kh.setHoten(hoten);
        DiaChi dc = new DiaChi();
        dc.setSonha(sonha);
        dc.setDuongpho(pho);
        dc.setPhuong(phuong);
        dc.setQuan(quan);
        dc.setThanhpho(thanhpho);
        kh.setDiaChi(dc);
        KhachHang newKH = khDAO.store(kh);
        
        
        ObjectMapper mapper = new ObjectMapper();
        return mapper.writeValueAsString(newKH);
    }
    
    @RequestMapping(value="/add", method = RequestMethod.POST)
    @ResponseBody
    public String add(@RequestParam String id, HttpSession session) throws IOException {
        ObjectMapper mapper = new ObjectMapper();
        KhachHang kh = (KhachHang) session.getAttribute("KhachHang");
        if (kh != null) {
            session.removeAttribute("KhachHang");
        }
        
        KhachHang khachhang = khDAO.findById(Integer.parseInt(id));
        if (khachhang != null) {
            session.setAttribute("KhachHang", khachhang);
        }
        
        String[] response = new String[3];
        response[0] = "Chọn thành công";
        response[1] = "200";
        return mapper.writeValueAsString(response);
        
    }
}
