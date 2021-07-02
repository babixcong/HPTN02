/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import models.KhachHang;
import java.util.ArrayList;

public interface KhachHangDAO {
    public ArrayList<KhachHang> getAll();
    public ArrayList<KhachHang> findByName(String name);
    public KhachHang store(KhachHang kh);
    public KhachHang findById(int id);
    public int getLatestKey();
}
