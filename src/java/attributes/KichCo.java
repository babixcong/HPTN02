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
public enum KichCo {
    Lon("Lớn"), Vua("Vừa"), Nho("Nhỏ");
    public final String label;
    private KichCo(String label) {
        this.label = label;
    }
}
