/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package daoImpl;

import dao.LichThueDAO;
import dao.ConnectDB;
import dao.SanDAO;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import models.KhachHang;
import models.LichThue;
import models.NguoiDung;
import models.PhieuDatSan;
import models.San;

public class LichThueDAOImpl extends AbstractDAOImpl implements LichThueDAO{
    SanDAO sDAO = new SanDAOImpl();

    @Override
    public ArrayList<LichThue> getAll() {
        String sql = "select lt.*, kh.*, kh.id as khID, kh.ma as khMa, "
                + "s.*, s.id as sID, s.ma as sMa, pds.*, pds.id as pdsID, "
                + "pds.ma as pdsMa, nd.*, nd.id as ndID, nd.ma as ndMa "
                + "from tblLichThue as lt join tblKhachHang as kh "
                + "on lt.khachhangId = kh.id join tblSan as s "
                + "on lt.sanId = s.id join tblPhieuDatSan as pds "
                + "on lt.phieudatId = pds.id join tblNguoiDung as nd "
                + "on pds.nguoidungId = nd.id";
        try {
            PreparedStatement ps = this.conn.prepareCall(sql);
            ResultSet rs = ps.executeQuery();
            ArrayList<LichThue> list = new ArrayList<LichThue>();
            while (rs.next()) {
                LichThue lt = new LichThue();
                lt.setId(rs.getInt("id"));
                lt.setCheckinHour(rs.getTime("checkinHour"));
                lt.setCheckoutHour(rs.getTime("checkoutHour"));
                lt.setCheckinDate(rs.getDate("checkinDate"));
                lt.setCheckoutDate(rs.getDate("checkoutDate"));
                KhachHang kh = new KhachHang();
                kh.setId(rs.getInt("khID"));
                kh.setEmail(rs.getString("email"));
                kh.setHoten(rs.getString("hoten"));
                kh.setSdt(rs.getString("sdt"));
                kh.setCmt(rs.getString("cmt"));
                kh.setMaKH(rs.getString("khMa"));
                lt.setKh(kh);
                San san = new San();
                san.setId(rs.getInt("sID"));
                san.setLoaisan(rs.getString("loaisan"));
                san.setGiathue(rs.getFloat("giathue"));
                san.setTen(rs.getString("ten"));
                san.setMaSan(rs.getString("sMa"));
                san.setSanchaId(rs.getInt("sanchaId"));
                san.setTrangthai(rs.getInt("trangthai"));
                lt.setS(san);
                PhieuDatSan pds = new PhieuDatSan();
                pds.setId(rs.getInt("pdsID"));
                pds.setMaPhieu(rs.getString("pdsMa"));
                pds.setTiencoc(rs.getFloat("tiencoc"));
                pds.setTongtien(rs.getFloat("tongtien"));
                pds.setNgaytao(rs.getTimestamp("ngaytao"));
                pds.setKh(kh);
                NguoiDung nd = new NguoiDung();
                nd.setId(rs.getInt("ndID"));
                nd.setMa(rs.getString("ndMa"));
                nd.setHoten(rs.getString("hoten"));
                nd.setCmt(rs.getString("cmt"));
                nd.setSdt(rs.getString("sdt"));
                nd.setEmail(rs.getString("email"));
                pds.setNd(nd);
                lt.setPds(pds);
                
                list.add(lt);
            }
            return list;
        } catch (SQLException e) {
            e.printStackTrace();
            ConnectDB.dbClose();
            
            return null;
        }finally {
            if (this.conn == null) {
                ConnectDB.dbClose();
            }
        }
    }

    @Override
    public ArrayList<San> filter(String checkinHour, String checkoutHour, String checkinDate, String checkoutDate, String type) {
        String sql = "select lt.sanId from tblLichThue as lt "
                + "join tblSan as s on lt.sanId = s.id "
                + "where ((lt.checkinDate between '" + checkinDate +"' and '" + checkoutDate + "') "
                + "or (lt.checkoutDate between '" + checkinDate +"' and '" + checkoutDate + "') "
                + "or (lt.checkinDate <= '" + checkinDate +"' and lt.checkoutDate >= '" + checkoutDate + "') "
                + "or (lt.checkinDate >= '" + checkinDate +"' and lt.checkoutDate <= '" + checkoutDate + "')) "
                + "and ((lt.checkinHour between '" + checkinHour +"' and '" + checkoutHour + "') "
                + "or (lt.checkoutHour between '" + checkinHour +"' and '" + checkoutHour + "') "
                + "or (lt.checkinHour <= '" + checkinHour +"' and lt.checkoutHour >= '" + checkoutHour + "') "
                + "or (lt.checkinHour >= '" + checkinHour +"' and lt.checkoutHour <= '" + checkoutHour + "')) "
                + "and s.trangthai = 1";

        if (!type.equals("all")) {
            sql += " and s.loaisan='" +type +"';";
        }
        try {
            PreparedStatement ps = this.conn.prepareCall(sql);
            ResultSet rs = ps.executeQuery();
            System.out.println(ps);
            ArrayList<Integer> list = new ArrayList<Integer>();
            while (rs.next()) {
                int id = rs.getInt("sanId");
                list.add(id);
            }
            ArrayList<San> listSan = sDAO.getById(list, type);
            
            return listSan;
        } catch (SQLException e) {
            e.printStackTrace();
            ConnectDB.dbClose();
            
            return null;
        } finally {
            if (this.conn == null) {
                ConnectDB.dbClose();
            }
        }
    }

    @Override
    public LichThue store(LichThue lt) {
        String sql = "insert into tblLichThue(khachhangId, sanId, phieudatId, "
                + "checkinHour, checkoutHour, checkinDate, checkoutDate) "
                + "values(?,?,?,?,?,?,?)";
        int primkey = 0;
        LichThue newLt = new LichThue();
        try {
            this.conn.setAutoCommit(false);
            String columnNames[] = new String[] { "id" };
            PreparedStatement ps = this.conn.prepareStatement(sql, columnNames);
            ps.setInt(1, lt.getKh().getId());
            ps.setInt(2, lt.getSan().getId());
            ps.setInt(3, lt.getPds().getId());
            ps.setTime(4, lt.getCheckinHour());
            ps.setTime(5, lt.getCheckoutHour());
            ps.setDate(6, lt.getCheckinDate());
            ps.setDate(7, lt.getCheckoutDate());
            if (ps.executeUpdate() > 0) {
                ResultSet generatedKeys = ps.getGeneratedKeys();
                if ( generatedKeys.next() ) {
                    primkey = generatedKeys.getInt(1);
                    newLt = this.findById(primkey);
                }
            }
            this.conn.commit();
            return newLt;
        } catch (SQLException e) {
            e.printStackTrace();
            
            try {
                this.conn.rollback();
                ConnectDB.dbClose();
            } catch (SQLException ex) {
                Logger.getLogger(LichThueDAOImpl.class.getName()).log(Level.SEVERE, null, ex);
            }
            
            return null;
        } finally {
            if (this.conn == null) {
                ConnectDB.dbClose();
            }
        }
    }

    @Override
    public LichThue findById(int id) {
        String sql = "select lt.*, kh.*, kh.id as khID, kh.ma as khMa, "
                + "s.*, s.id as sID, s.ma as sMa, pds.*, pds.id as pdsID, "
                + "pds.ma as pdsMa, nd.*, nd.id as ndID, nd.ma as ndMa "
                + "from tblLichThue as lt join tblKhachHang as kh "
                + "on lt.khachhangId = kh.id join tblSan as s "
                + "on lt.sanId = s.id join tblPhieuDatSan as pds "
                + "on lt.phieudatId = pds.id join tblNguoiDung as nd "
                + "on pds.nguoidungId = nd.id "
                + "where lt.id = ?";
        
        try {
            PreparedStatement ps = this.conn.prepareCall(sql);
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            LichThue lt = new LichThue();
            while (rs.next()) {
                lt.setId(rs.getInt("id"));
                lt.setCheckinHour(rs.getTime("checkinHour"));
                lt.setCheckoutHour(rs.getTime("checkoutHour"));
                lt.setCheckinDate(rs.getDate("checkinDate"));
                lt.setCheckoutDate(rs.getDate("checkoutDate"));
                KhachHang kh = new KhachHang();
                kh.setId(rs.getInt("khID"));
                kh.setEmail(rs.getString("email"));
                kh.setHoten(rs.getString("hoten"));
                kh.setSdt(rs.getString("sdt"));
                kh.setCmt(rs.getString("cmt"));
                kh.setMaKH(rs.getString("khMa"));
                lt.setKh(kh);
                San san = new San();
                san.setId(rs.getInt("sID"));
                san.setLoaisan(rs.getString("loaisan"));
                san.setGiathue(rs.getFloat("giathue"));
                san.setTen(rs.getString("ten"));
                san.setMaSan(rs.getString("sMa"));
                san.setSanchaId(rs.getInt("sanchaId"));
                san.setTrangthai(rs.getInt("trangthai"));
                lt.setS(san);
                PhieuDatSan pds = new PhieuDatSan();
                pds.setId(rs.getInt("pdsID"));
                pds.setMaPhieu(rs.getString("pdsMa"));
                pds.setTiencoc(rs.getFloat("tiencoc"));
                pds.setTongtien(rs.getFloat("tongtien"));
                pds.setNgaytao(rs.getTimestamp("ngaytao"));
                pds.setKh(kh);
                NguoiDung nd = new NguoiDung();
                nd.setId(rs.getInt("ndID"));
                nd.setMa(rs.getString("ndMa"));
                nd.setHoten(rs.getString("hoten"));
                nd.setCmt(rs.getString("cmt"));
                nd.setSdt(rs.getString("sdt"));
                nd.setEmail(rs.getString("email"));
                pds.setNd(nd);
                lt.setPds(pds);
            }
            return lt;
        } catch (SQLException e) {
            e.printStackTrace();
            ConnectDB.dbClose();
            
            return null;
        }finally {
            if (this.conn == null) {
                ConnectDB.dbClose();
            }
        }
    }

    @Override
    public ArrayList<LichThue> getListByPDSId(int id) {
        String sql = "select lt.*, kh.*, kh.id as khID, kh.ma as khMa, "
                + "s.*, s.id as sID, s.ma as sMa, pds.*, pds.id as pdsID, "
                + "pds.ma as pdsMa, nd.*, nd.id as ndID, nd.ma as ndMa "
                + "from tblLichThue as lt join tblKhachHang as kh "
                + "on lt.khachhangId = kh.id join tblSan as s "
                + "on lt.sanId = s.id join tblPhieuDatSan as pds "
                + "on lt.phieudatId = pds.id join tblNguoiDung as nd "
                + "on pds.nguoidungId = nd.id where lt.phieudatId = ?";
        try {
            PreparedStatement ps = this.conn.prepareCall(sql);
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            ArrayList<LichThue> list = new ArrayList<LichThue>();
            while (rs.next()) {
                LichThue lt = new LichThue();
                lt.setId(rs.getInt("id"));
                lt.setCheckinHour(rs.getTime("checkinHour"));
                lt.setCheckoutHour(rs.getTime("checkoutHour"));
                lt.setCheckinDate(rs.getDate("checkinDate"));
                lt.setCheckoutDate(rs.getDate("checkoutDate"));
                KhachHang kh = new KhachHang();
                kh.setId(rs.getInt("khID"));
                kh.setEmail(rs.getString("email"));
                kh.setHoten(rs.getString("hoten"));
                kh.setSdt(rs.getString("sdt"));
                kh.setCmt(rs.getString("cmt"));
                kh.setMaKH(rs.getString("khMa"));
                lt.setKh(kh);
                San san = new San();
                san.setId(rs.getInt("sID"));
                san.setLoaisan(rs.getString("loaisan"));
                san.setGiathue(rs.getFloat("giathue"));
                san.setTen(rs.getString("ten"));
                san.setMaSan(rs.getString("sMa"));
                san.setSanchaId(rs.getInt("sanchaId"));
                san.setTrangthai(rs.getInt("trangthai"));
                lt.setS(san);
                PhieuDatSan pds = new PhieuDatSan();
                pds.setId(rs.getInt("pdsID"));
                pds.setMaPhieu(rs.getString("pdsMa"));
                pds.setTiencoc(rs.getFloat("tiencoc"));
                pds.setTongtien(rs.getFloat("tongtien"));
                pds.setNgaytao(rs.getTimestamp("ngaytao"));
                pds.setKh(kh);
                NguoiDung nd = new NguoiDung();
                nd.setId(rs.getInt("ndID"));
                nd.setMa(rs.getString("ndMa"));
                nd.setHoten(rs.getString("hoten"));
                nd.setCmt(rs.getString("cmt"));
                nd.setSdt(rs.getString("sdt"));
                nd.setEmail(rs.getString("email"));
                pds.setNd(nd);
                lt.setPds(pds);
                
                list.add(lt);
            }
            return list;
        } catch (SQLException e) {
            e.printStackTrace();
            ConnectDB.dbClose();
            
            return null;
        }finally {
            if (this.conn == null) {
                ConnectDB.dbClose();
            }
        }
    }
}
