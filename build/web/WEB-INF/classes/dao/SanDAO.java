/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import models.San;
import java.util.ArrayList;

public interface SanDAO {
    public ArrayList<San> getAll();
    public ArrayList<San> getById(ArrayList<Integer> id, String type);
    public San findById(int id);
}
