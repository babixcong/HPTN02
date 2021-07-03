/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package daoImpl;

import dao.ConnectDB;
import dao.DiaChiDAO;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import models.DiaChi;

public class DiaChiDAOImpl extends AbstractDAOImpl implements DiaChiDAO{

    @Override
    public DiaChi getDiaChi(int id) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public DiaChi store(DiaChi dc) {
        String sql = "insert into tblDiaChi(sonha, pho, phuong, quan, thanhpho) values (?,?,?,?,?);";
        int primkey = 0;
        DiaChi newDC = new DiaChi();
        try {
            this.conn.setAutoCommit(false);
            String columnNames[] = new String[] { "id" };

            PreparedStatement ps = this.conn.prepareStatement(sql, columnNames);
            ps.setString(1, dc.getSonha());
            ps.setString(2, dc.getDuongpho());
            ps.setString(3, dc.getPhuong());
            ps.setString(4, dc.getQuan());
            ps.setString(5, dc.getThanhpho());
            if (ps.executeUpdate() > 0) {
                ResultSet generatedKeys = ps.getGeneratedKeys();
                if ( generatedKeys.next() ) {
                    primkey = generatedKeys.getInt(1);
                    newDC = this.findById(primkey);
                }
            }
            this.conn.commit();
            
            return newDC;
        } catch(SQLException e) {
            e.printStackTrace();
            
            try {
                this.conn.rollback();
                ConnectDB.dbClose();
            } catch (SQLException ex) {
                Logger.getLogger(DiaChiDAOImpl.class.getName()).log(Level.SEVERE, null, ex);
            }
            return null;
        } finally {
            if (this.conn == null) {
                ConnectDB.dbClose();
            }
        }
    }

    @Override
    public DiaChi findById(int id) {
        String sql = "select * from tblDiaChi where id=?";
        try {
            PreparedStatement ps = this.conn.prepareCall(sql);
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            DiaChi dc = new DiaChi();
            while(rs.next()) {
                dc.setId(rs.getInt("id"));
                dc.setSonha(rs.getString("sonha"));
                dc.setDuongpho(rs.getString("pho"));
                dc.setPhuong(rs.getString("phuong"));
                dc.setQuan(rs.getString("quan"));
                dc.setThanhpho(rs.getString("thanhpho"));
            }
            return dc;
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
}
