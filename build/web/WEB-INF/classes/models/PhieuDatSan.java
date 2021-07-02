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
public class PhieuDatSan implements Serializable {
    private static final long serialVersionUID = 1L;
    private int id;
    private String maPhieu;
    private int khachhangId, nguoidungId;
    private float tongtien, tiencoc;
    private Timestamp ngaytao;
    private KhachHang kh;
    private NguoiDung nd;

    public PhieuDatSan() {
        
    }
    
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getMaPhieu() {
        return maPhieu;
    }

    public void setMaPhieu(String maPhieu) {
        this.maPhieu = maPhieu;
    }

    public int getKhachhangId() {
        return khachhangId;
    }

    public void setKhachhangId(int khachhangId) {
        this.khachhangId = khachhangId;
    }

    public int getNguoidungId() {
        return nguoidungId;
    }

    public void setNguoidungId(int nguoidungId) {
        this.nguoidungId = nguoidungId;
    }

    public float getTongtien() {
        return tongtien;
    }

    public void setTongtien(float tongtien) {
        this.tongtien = tongtien;
    }

    public float getTiencoc() {
        return tiencoc;
    }

    public void setTiencoc(float tiencoc) {
        this.tiencoc = tiencoc;
    }

    public Timestamp getNgaytao() {
        return ngaytao;
    }

    public void setNgaytao(Timestamp ngaytao) {
        this.ngaytao = ngaytao;
    }

    public KhachHang getKh() {
        return kh;
    }

    public void setKh(KhachHang kh) {
        this.kh = kh;
    }

    public NguoiDung getNd() {
        return nd;
    }

    public void setNd(NguoiDung nd) {
        this.nd = nd;
    }
    
}
