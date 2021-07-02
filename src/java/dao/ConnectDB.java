/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import java.sql.Connection;
import java.sql.DriverManager;

/**
 *
 * @author CongNguyen
 */
public class ConnectDB {
    static java.sql.Connection conn = null;
    private static String username = "root";
    private static String password = "";
    private static String DBname = "HPTN2";
    private static String url = "jdbc:mysql://127.0.0.1:3306/hptn02";
    private static String driver = "com.mysql.jdbc.Driver";
    public static Connection getDBConnection(){
        try{
            Class.forName(driver);
            try{
               conn = DriverManager.getConnection(url,username, password);
            }catch(Exception e){
                e.printStackTrace();
            }
        }catch(Exception e){
            e.printStackTrace();
        }
        return conn;
    }
    public static void dbClose(){
        try{
            conn.close();
        }catch(Exception e){
            e.printStackTrace();
        }
    }
}
