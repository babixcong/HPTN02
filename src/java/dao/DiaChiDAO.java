/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import models.DiaChi;

/**
 *
 * @author CongNguyen
 */
public interface DiaChiDAO {
    public DiaChi getDiaChi(int id);
    public DiaChi store(DiaChi dc);
    public DiaChi findById(int id);
}
