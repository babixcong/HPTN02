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
import java.sql.Date;
import java.sql.Time;
import java.sql.Timestamp;
import java.util.ArrayList;
import models.BCrypt;

/**
 *
 * @author CongNguyen
 */
public class TestGetData {
    public static void main(String[] args) {
        System.out.println(Date.valueOf("2021-06-20"));
    }
}
