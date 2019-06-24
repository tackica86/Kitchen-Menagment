
package model;

public class Tip {
    private int id_tip;
    private String ime_tip;

    public Tip() {
    }

    public Tip(int id_tip, String ime_tip) {
        this.id_tip = id_tip;
        this.ime_tip = ime_tip;
    }

    public int getId_tip() {
        return id_tip;
    }

    public void setId_tip(int id_tip) {
        this.id_tip = id_tip;
    }

    public String getIme_tip() {
        return ime_tip;
    }

    public void setIme_tip(String ime_tip) {
        this.ime_tip = ime_tip;
    }

    @Override
    public String toString() {
        return "Tip{" + "id_tip=" + id_tip + ", ime_tip=" + ime_tip + '}';
    }
    
    
}
