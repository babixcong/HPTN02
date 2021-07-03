/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import models.PhieuDatSan;

public interface PhieuDatSanDAO {
    public PhieuDatSan store(PhieuDatSan pds);
    public PhieuDatSan findById(int id);
}
