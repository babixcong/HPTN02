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
public class DiaChi implements Serializable {
    private static final long serialVersionUID = 1L;
    private Integer id;
    private String sonha;
    private String duongpho;
    private String phuong;
    private String quan;
    private String thanhpho;
    
    public DiaChi() {
    }

    public DiaChi(Integer id) {
        this.id = id;
    }

    public DiaChi(Integer id, String sonha, String duongpho, String quan, String thanhpho) {
        this.id = id;
        this.sonha = sonha;
        this.duongpho = duongpho;
        this.quan = quan;
        this.thanhpho = thanhpho;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getSonha() {
        return sonha;
    }

    public void setSonha(String sonha) {
        this.sonha = sonha;
    }

    public String getDuongpho() {
        return duongpho;
    }

    public void setDuongpho(String duongpho) {
        this.duongpho = duongpho;
    }

    public String getPhuong() {
        return phuong;
    }

    public void setPhuong(String phuong) {
        this.phuong = phuong;
    }

    public String getQuan() {
        return quan;
    }

    public void setQuan(String quan) {
        this.quan = quan;
    }

    public String getThanhpho() {
        return thanhpho;
    }

    public void setThanhpho(String thanhpho) {
        this.thanhpho = thanhpho;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (id != null ? id.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof DiaChi)) {
            return false;
        }
        DiaChi other = (DiaChi) object;
        if ((this.id == null && other.id != null) || (this.id != null && !this.id.equals(other.id))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return sonha + ", " + duongpho + ", " + quan + ", " + thanhpho +".";
    }
}
