/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package daoImpl;

import dao.NguoiDungDAO;
import dao.ConnectDB;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import models.BCrypt;
import models.DiaChi;
import models.NguoiDung;

public class NguoiDungDAOImpl extends AbstractDAOImpl implements NguoiDungDAO{

    @Override
    public boolean checkLogin(String email, String password) {
        boolean check = false;
        String sql = "select * from tblNguoiDung where email=?";
        try{
            PreparedStatement ps = this.conn.prepareStatement(sql);
            ps.setString(1, email);
            ResultSet rs = ps.executeQuery();
            while(rs.next()){
                check = BCrypt.checkpw(password, rs.getString("password"));
            }
            
            return check;
        }catch(SQLException e){
            e.printStackTrace();
            ConnectDB.dbClose();
        }finally {
            if (this.conn == null) {
                ConnectDB.dbClose();
            }
        }
        
        return false;
    }

    @Override
    public NguoiDung findByID(int id) {
        String sql = "select nd.*, dc.*, dc.id as dcId from tblNguoiDung as nd join tblDiaChi as dc on "
                + "nd.diachiId = dc.id where nd.id=?";
        try {
            PreparedStatement ps = this.conn.prepareCall(sql);
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            NguoiDung nd = new NguoiDung();
            while (rs.next()) {
                nd.setId(rs.getInt("id"));
                nd.setHoten(rs.getString("hoten"));
                nd.setCmt(rs.getString("cmt"));
                nd.setSdt(rs.getString("sdt"));
                nd.setEmail(rs.getString("email"));
                nd.setMa(rs.getString("ma"));
                DiaChi dc = new DiaChi();
                dc.setId(rs.getInt("dcId"));
                dc.setSonha(rs.getString("sonha"));
                dc.setDuongpho(rs.getString("pho"));
                dc.setPhuong(rs.getString("phuong"));
                dc.setQuan(rs.getString("quan"));
                dc.setThanhpho(rs.getString("thanhpho"));
                nd.setDiaChi(dc);
            }
            return nd;
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
    public NguoiDung findByEmail(String email) {
        String sql = "select nd.*, dc.*, dc.id as dcId from tblNguoiDung as nd join tblDiaChi as dc on "
                + "nd.diachiId = dc.id where nd.email=?";
        try {
            PreparedStatement ps = this.conn.prepareCall(sql);
            ps.setString(1, email);
            ResultSet rs = ps.executeQuery();
            NguoiDung nd = new NguoiDung();
            while (rs.next()) {
                nd.setId(rs.getInt("id"));
                nd.setHoten(rs.getString("hoten"));
                nd.setCmt(rs.getString("cmt"));
                nd.setSdt(rs.getString("sdt"));
                nd.setEmail(rs.getString("email"));
                nd.setMa(rs.getString("ma"));
                DiaChi dc = new DiaChi();
                dc.setId(rs.getInt("dcId"));
                dc.setSonha(rs.getString("sonha"));
                dc.setDuongpho(rs.getString("pho"));
                dc.setPhuong(rs.getString("phuong"));
                dc.setQuan(rs.getString("quan"));
                dc.setThanhpho(rs.getString("thanhpho"));
                nd.setDiaChi(dc);
            }
            return nd;
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
