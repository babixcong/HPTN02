/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package models;

import java.io.Serializable;
import java.sql.Timestamp;

/**
 *
 * @author CongNguyen
 */
public class LichThue implements Serializable {
    private static final long serialVersionUID = 1L;
    private int id;
    private Timestamp checkin, checkout;
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

    public Timestamp getCheckin() {
        return checkin;
    }

    public void setCheckin(Timestamp checkin) {
        this.checkin = checkin;
    }

    public Timestamp getCheckout() {
        return checkout;
    }

    public void setCheckout(Timestamp checkout) {
        this.checkout = checkout;
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
