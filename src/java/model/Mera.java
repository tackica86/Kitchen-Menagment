
package model;

public class Mera {
    
    private int id_mera;
    private String ime_mera;

    public Mera() {
    }

    public Mera(String ime_mera) {
        this.ime_mera = ime_mera;
    }

    public Mera(int id_mera, String ime_mera) {
        this.id_mera = id_mera;
        this.ime_mera = ime_mera;
    }

    public int getId_mera() {
        return id_mera;
    }

    public void setId_mera(int id_mera) {
        this.id_mera = id_mera;
    }

    public String getIme_mera() {
        return ime_mera;
    }

    public void setIme_mera(String ime_mera) {
        this.ime_mera = ime_mera;
    }

    @Override
    public String toString() {
        return "Mera{" + "id_mera=" + id_mera + ", ime_mera=" + ime_mera + '}';
    }
    
    
}
