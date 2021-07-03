/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import models.NguoiDung;

public interface NguoiDungDAO {
    public boolean checkLogin(String email, String password);
    public NguoiDung findByID(int id);
    public NguoiDung findByEmail(String email);
}
