/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package daoImpl;

import dao.ConnectDB;
import dao.SanDAO;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import models.San;

public class SanDAOImpl extends AbstractDAOImpl implements SanDAO{

    @Override
    public ArrayList<San> getAll() {
        String sql = "select * from  tblSan";
        try {
            PreparedStatement ps = this.conn.prepareCall(sql);
            ResultSet rs = ps.executeQuery();
            ArrayList<San> list = new ArrayList<San>();
            while (rs.next()) {
                San san = new San();
                san.setId(rs.getInt("id"));
                san.setLoaisan(rs.getString("loaisan"));
                san.setGiathue(rs.getFloat("giathue"));
                san.setTen(rs.getString("ten"));
                san.setMaSan(rs.getString("ma"));
                san.setSanchaId(rs.getInt("sanchaId"));
                list.add(san);
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
    public ArrayList<San> getById(ArrayList<Integer> id, String type) {
        String sql = "Select * from tblSan ";
        if (!type.equals("all")) {
            sql += "where loaisan = '" + type + "' ";
        }
        
        if (id.size() != 0) {
            if (!type.equals("all")) {
                sql += "and id not in (";
            } else {
                sql += "where id not in (";
            }
            
            
            for (int i = 0;i < id.size(); i++) {
                if (i < id.size() - 1) {
                    sql += "?,";
                } else {
                    sql += "?";
                }
            }
            
            sql += ")";
        }
        
        System.out.println(sql);
        ArrayList<San> list = new ArrayList<San>();
        try {
            PreparedStatement ps = this.conn.prepareCall(sql);
            if (id.size() != 0) {                
                for (int i = 0; i < id.size(); i++) {
                    ps.setInt(i + 1, id.get(i).intValue());
                }
            }
            ResultSet rs = ps.executeQuery();
            
            while(rs.next()) {
                San san = new San();
                san.setId(rs.getInt("id"));
                san.setLoaisan(rs.getString("loaisan"));
                san.setGiathue(rs.getFloat("giathue"));
                san.setTen(rs.getString("ten"));
                san.setMaSan(rs.getString("ma"));
                san.setSanchaId(rs.getInt("sanchaId"));
                list.add(san);   
            }
            return list;
        } catch(SQLException e) {
            e.printStackTrace();
            ConnectDB.dbClose();
            return list;
        } finally {
            if (this.conn == null) {
                ConnectDB.dbClose();
            }
        }
    }

    @Override
    public San findById(int id) {
        String sql = "select * from tblSan where id = ?";
        try {
            PreparedStatement ps = this.conn.prepareCall(sql);
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            San san = new San();
            while (rs.next()) {
                san.setId(rs.getInt("id"));
                san.setLoaisan(rs.getString("loaisan"));
                san.setGiathue(rs.getFloat("giathue"));
                san.setTen(rs.getString("ten"));
                san.setMaSan(rs.getString("ma"));
                san.setSanchaId(rs.getInt("sanchaId"));
            }
            return san;
        } catch(SQLException e) {
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
