/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package daoImpl;

import dao.KhachHangDAO;
import dao.ConnectDB;
import dao.DiaChiDAO;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import models.DiaChi;
import models.KhachHang;

public class KhachHangDAOImpl extends AbstractDAOImpl implements KhachHangDAO {
    private DiaChiDAO dcDAO = new DiaChiDAOImpl();
    
    @Override
    public ArrayList<KhachHang> getAll() {
        String sql = "select kh.*, kh.id as khID, dc.*, dc.id as dcId from tblKhachHang as kh join tblDiaChi as dc on "
                + "kh.diachiId = dc.id";
        try {
            PreparedStatement ps = this.conn.prepareCall(sql);
            ResultSet rs = ps.executeQuery();
            ArrayList<KhachHang> list = new ArrayList<>();
            while (rs.next()) {
                KhachHang kh = new KhachHang();
                kh.setId(rs.getInt("khID"));
                kh.setEmail(rs.getString("email"));
                kh.setHoten(rs.getString("hoten"));
                kh.setSdt(rs.getString("sdt"));
                kh.setCmt(rs.getString("cmt"));
                kh.setMaKH(rs.getString("ma"));
                DiaChi dc = new DiaChi();
                dc.setId(rs.getInt("dcId"));
                dc.setSonha(rs.getString("sonha"));
                dc.setDuongpho(rs.getString("pho"));
                dc.setPhuong(rs.getString("phuong"));
                dc.setQuan(rs.getString("quan"));
                dc.setThanhpho(rs.getString("thanhpho"));
                kh.setDiaChi(dc);
                list.add(kh);
            }
            
            return list;
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
    public ArrayList<KhachHang> findByName(String name) {
        String sql = "select kh.*, dc.*, dc.id as dcId from tblKhachHang as kh join tblDiaChi as dc on "
                + "kh.diachiId = dc.id where kh.hoten like ?";
        try {
            PreparedStatement ps = this.conn.prepareCall(sql);
            ps.setString(1, "%" + name + "%");
            ResultSet rs = ps.executeQuery();
            ArrayList<KhachHang> list = new ArrayList<>();
            while (rs.next()) {
                KhachHang kh = new KhachHang();
                kh.setId(rs.getInt("id"));
                kh.setEmail(rs.getString("email"));
                kh.setHoten(rs.getString("hoten"));
                kh.setSdt(rs.getString("sdt"));
                kh.setCmt(rs.getString("cmt"));
                DiaChi dc = new DiaChi();
                dc.setId(rs.getInt("dcId"));
                dc.setSonha(rs.getString("sonha"));
                dc.setDuongpho(rs.getString("pho"));
                dc.setPhuong(rs.getString("phuong"));
                dc.setQuan(rs.getString("quan"));
                dc.setThanhpho(rs.getString("thanhpho"));
                kh.setDiaChi(dc);
                list.add(kh);
            }
            
            return list;
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
    public KhachHang store(KhachHang kh) {
        String sql = "insert into tblKhachHang(ma, hoten, diachiId, email, cmt, sdt) values(?,?,?,?,?,?)";
        KhachHang newKh = new KhachHang();
        int primkey = 0;
        try {
            this.conn.setAutoCommit(false);
            String columnNames[] = new String[] { "id" };
            PreparedStatement ps = this.conn.prepareStatement(sql, columnNames);
            DiaChi newDC = dcDAO.store(kh.getDiaChi());
            ps.setString(1, kh.getMaKH());
            ps.setString(2, kh.getHoten());
            ps.setInt(3, newDC.getId());
            ps.setString(4, kh.getEmail());
            ps.setString(5, kh.getCmt());
            ps.setString(6, kh.getSdt());
            if (ps.executeUpdate() > 0) {
            // Retrieves any auto-generated keys created as a result of executing this Statement object
                ResultSet generatedKeys = ps.getGeneratedKeys();
                if ( generatedKeys.next() ) {
                    primkey = generatedKeys.getInt(1);
                    newKh = this.findById(primkey);
                }
            }
            
            this.conn.commit();
            return newKh;
        } catch(SQLException e) {
            e.printStackTrace();
            try {
                this.conn.rollback();
                ConnectDB.dbClose();
            } catch (SQLException ex) {
                Logger.getLogger(KhachHangDAOImpl.class.getName()).log(Level.SEVERE, null, ex);
            }
            return null;
        } finally {
            if (this.conn == null) {
                ConnectDB.dbClose();
            }
        }
    }

    @Override
    public KhachHang findById(int id) {
        String sql = "select kh.*, kh.id as khID, dc.*, dc.id as dcId from tblKhachHang as kh join tblDiaChi as dc on "
                + "kh.diachiId = dc.id where kh.id=?";
        try {
            PreparedStatement ps = this.conn.prepareCall(sql);
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            KhachHang kh = new KhachHang();
            while (rs.next()) {
                kh.setId(rs.getInt("khID"));
                kh.setEmail(rs.getString("email"));
                kh.setHoten(rs.getString("hoten"));
                kh.setSdt(rs.getString("sdt"));
                kh.setCmt(rs.getString("cmt"));
                kh.setMaKH(rs.getString("ma"));
                DiaChi dc = new DiaChi();
                dc.setId(rs.getInt("dcId"));
                dc.setSonha(rs.getString("sonha"));
                dc.setDuongpho(rs.getString("pho"));
                dc.setPhuong(rs.getString("phuong"));
                dc.setQuan(rs.getString("quan"));
                dc.setThanhpho(rs.getString("thanhpho"));
                kh.setDiaChi(dc);
            }
            
            return kh;
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
    public int getLatestKey() {
        String sql = "SELECT id FROM tblKhachHang ORDER BY id DESC LIMIT 1";
        int last = 0;
        try {
            PreparedStatement ps = this.conn.prepareCall(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                last = rs.getInt("id");
            }
            return last;
        } catch(SQLException e) {
            e.printStackTrace();
            ConnectDB.dbClose();
            return 0;
        } finally {
            if (this.conn == null) {
                ConnectDB.dbClose();
            }
        }
    }
    
    
    
}
