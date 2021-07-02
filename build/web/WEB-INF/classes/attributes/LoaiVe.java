/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package attributes;

/**
 *
 * @author CongNguyen
 */
public enum LoaiVe {
    Ve_1("Vé xem phim"), Ve_2("Vé ăn uống");

    public final String label;
    private LoaiVe(String label) {
        this.label = label;
    }
}
