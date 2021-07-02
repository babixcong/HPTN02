/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package models;

import dao.DiaChiDAO;
import dao.KhachHangDAO;
import dao.LichThueDAO;
import dao.NguoiDungDAO;
import dao.SanDAO;
import daoImpl.DiaChiDAOImpl;
import daoImpl.KhachHangDAOImpl;
import daoImpl.LichThueDAOImpl;
import daoImpl.NguoiDungDAOImpl;
import daoImpl.SanDAOImpl;
import java.sql.Timestamp;
import java.util.ArrayList;
import models.BCrypt;

/**
 *
 * @author CongNguyen
 */
public class TestGetData {
    public static void main(String[] args) {
//        String datetimeLocal = "2021-06-23T21:08:00";
//        System.out.println(Timestamp.valueOf(datetimeLocal.replace("T"," ")));
//        String abc = "2021-06-23T21:08";
//        System.out.println(abc + ":00");
        LichThueDAO ltDAO = new LichThueDAOImpl();
        ArrayList<San> l = ltDAO.filter("2021-06-01 21:08:00.0", "2021-06-22 21:08:00.0", "all");
        System.out.println(l.size());
//        ArrayList<Integer> list = new ArrayList<>();
//        list.add(1);
//        list.add(2);
//        
//        SanDAO sDAO = new SanDAOImpl();
//        ArrayList<San> ls = sDAO.getById(list);
//        for (San s: ls) {
//            System.out.println(s.getId());
//        }
    }
}
