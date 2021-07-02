/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package models;

import java.io.Serializable;

/**
 *
 * @author CongNguyen
 */
public class San implements Serializable{
    private static final long serialVersionUID = 1L;
    private int id;
    private String maSan, ten, loaisan;
    private float giathue;
    private int sanchaId;
    private int trangthai;

    public int getTrangthai() {
        return trangthai;
    }

    public void setTrangthai(int trangthai) {
        this.trangthai = trangthai;
    }

    public San(){
        
    }
    
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getMaSan() {
        return maSan;
    }

    public void setMaSan(String maSan) {
        this.maSan = maSan;
    }

    public String getTen() {
        return ten;
    }

    public void setTen(String ten) {
        this.ten = ten;
    }

    public String getLoaisan() {
        return loaisan;
    }

    public void setLoaisan(String loaisan) {
        this.loaisan = loaisan;
    }

    public float getGiathue() {
        return giathue;
    }

    public void setGiathue(float giathue) {
        this.giathue = giathue;
    }

    public int getSanchaId() {
        return sanchaId;
    }

    public void setSanchaId(int sanchaId) {
        this.sanchaId = sanchaId;
    }
    
    
}
