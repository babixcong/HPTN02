/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package daoImpl;

import dao.AbstractDAO;
import dao.ConnectDB;
import java.sql.Connection;

/**
 *
 * @author CongNguyen
 */
public class AbstractDAOImpl implements AbstractDAO{
    protected Connection conn;
    
    public AbstractDAOImpl() {
        this.conn = ConnectDB.getDBConnection();
    }
}
