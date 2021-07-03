/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import models.LichThue;
import java.util.ArrayList;
import models.San;

public interface LichThueDAO {
    public ArrayList<LichThue> getAll();
    public ArrayList<San> filter(String checkinHour, String checkoutHour, String checkinDate, String checkoutDate, String type);
    public LichThue store(LichThue lt);
    public LichThue findById(int id);
    public ArrayList<LichThue> getListByPDSId(int id);
}
