/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package daoImpl;

import dao.ConnectDB;
import dao.LichThueDAO;
import dao.PhieuDatSanDAO;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import models.KhachHang;
import models.LichThue;
import models.NguoiDung;
import models.PhieuDatSan;
import java.util.ArrayList;

public class PhieuDatSanDAOImpl extends AbstractDAOImpl implements PhieuDatSanDAO {
    private LichThueDAO ltDAO = new LichThueDAOImpl();
    
    @Override
    public PhieuDatSan store(PhieuDatSan pds) {
        String sql = "insert into tblPhieuDatSan(ma, khachhangId, nguoidungId, tongtien, tiencoc, ngaytao)"
                + " values (?,?,?,?,?,NOW());";
        int primkey = 0;
        PhieuDatSan newPds = new PhieuDatSan();
        try {
            this.conn.setAutoCommit(false);
            String columnNames[] = new String[] { "id" };
            PreparedStatement ps = this.conn.prepareStatement(sql, columnNames);
            ps.setString(1, pds.getMaPhieu());
            ps.setInt(2, pds.getKh().getId());
            ps.setInt(3, pds.getNd().getId());
            ps.setFloat(4, pds.getTongtien());
            ps.setFloat(5, pds.getTiencoc());
            
            if (ps.executeUpdate() > 0) {
                ResultSet generatedKeys = ps.getGeneratedKeys();
                if ( generatedKeys.next() ) {
                    primkey = generatedKeys.getInt(1);
                    newPds = this.findById(primkey);
                }
            }
            this.conn.commit();
            return newPds;
        } catch (SQLException e) {
            e.printStackTrace();
            
            try {
                this.conn.rollback();
                ConnectDB.dbClose();
            } catch (SQLException ex) {
                Logger.getLogger(PhieuDatSanDAOImpl.class.getName()).log(Level.SEVERE, null, ex);
            }
            
            return null;
        } finally {
            if (this.conn == null) {
                ConnectDB.dbClose();
            }
        }
    }

    @Override
    public PhieuDatSan findById(int id) {
        String sql = "select pds.*, pds.id as pdsID, pds.ma as pdsMa, nd.*, "
                + "nd.id as ndId, nd.ma as ndMa, "
                + "kh.*, kh.id as khId, kh.ma as khMa "
                + "from tblPhieuDatSan as pds join tblNguoiDung as nd "
                + "on pds.nguoidungId = nd.id "
                + "join tblKhachHang as kh "
                + "on pds.khachhangId = kh.id "
                + "where pds.id = ?";
        try {
            PreparedStatement ps = this.conn.prepareCall(sql);
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            PhieuDatSan pds = new PhieuDatSan();
            while (rs.next()) {
                pds.setId(rs.getInt("id"));
                pds.setNgaytao(rs.getTimestamp("ngaytao"));
                pds.setMaPhieu(rs.getString("pdsMa"));
                pds.setTiencoc(rs.getFloat("tiencoc"));
                pds.setTongtien(rs.getFloat("tongtien"));
                NguoiDung nd = new NguoiDung();
                nd.setId(rs.getInt("ndId"));
                nd.setCmt(rs.getString("cmt"));
                nd.setHoten(rs.getString("hoten"));
                nd.setEmail(rs.getString("email"));
                nd.setSdt(rs.getString("sdt"));
                nd.setMa(rs.getString("ndMa"));
                pds.setNd(nd);
                ArrayList<LichThue> listLT = ltDAO.getListByPDSId(rs.getInt("id"));
                KhachHang kh = new KhachHang();
                kh.setId(rs.getInt("khId"));
                kh.setEmail(rs.getString("email"));
                kh.setMaKH(rs.getString("khMa"));
                kh.setSdt(rs.getString("sdt"));
                kh.setHoten(rs.getString("hoten"));
                pds.setListLichthue(listLT);
                
                pds.setKh(kh);
            }
            
            return pds;
        } catch (SQLException e) {
            e.printStackTrace();
            
            try {
                this.conn.rollback();
                ConnectDB.dbClose();
            } catch (SQLException ex) {
                Logger.getLogger(PhieuDatSanDAOImpl.class.getName()).log(Level.SEVERE, null, ex);
            }
            
            return null;
        } finally {
            if (this.conn == null) {
                ConnectDB.dbClose();
            }
        }
    }
}
