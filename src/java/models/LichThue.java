/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package models;

import java.io.Serializable;
import java.sql.Date;
import java.sql.Time;

/**
 *
 * @author CongNguyen
 */
public class LichThue implements Serializable {
    private static final long serialVersionUID = 1L;
    private int id;
    private Time checkinHour, checkoutHour;
    private Date checkinDate, checkoutDate;

    public Time getCheckinHour() {
        return checkinHour;
    }

    public void setCheckinHour(Time checkinHour) {
        this.checkinHour = checkinHour;
    }

    public Time getCheckoutHour() {
        return checkoutHour;
    }

    public void setCheckoutHour(Time checkoutHour) {
        this.checkoutHour = checkoutHour;
    }

    public Date getCheckinDate() {
        return checkinDate;
    }

    public void setCheckinDate(Date checkinDate) {
        this.checkinDate = checkinDate;
    }

    public Date getCheckoutDate() {
        return checkoutDate;
    }

    public void setCheckoutDate(Date checkoutDate) {
        this.checkoutDate = checkoutDate;
    }
    private int sanId, khachhangId, phieudatId;
    private KhachHang kh;
    private San s;
    private PhieuDatSan pds;

    public LichThue() {
        
    }
    
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getSanId() {
        return sanId;
    }

    public void setSanId(int sanId) {
        this.sanId = sanId;
    }

    public int getKhachhangId() {
        return khachhangId;
    }

    public void setKhachhangId(int khachhangId) {
        this.khachhangId = khachhangId;
    }

    public int getPhieudatId() {
        return phieudatId;
    }

    public void setPhieudatId(int phieudatId) {
        this.phieudatId = phieudatId;
    }

    public KhachHang getKh() {
        return kh;
    }

    public void setKh(KhachHang kh) {
        this.kh = kh;
    }

    public San getSan() {
        return s;
    }

    public void setS(San s) {
        this.s = s;
    }

    public PhieuDatSan getPds() {
        return pds;
    }

    public void setPds(PhieuDatSan pds) {
        this.pds = pds;
    }
}
