
package model;

public class Recepti {
    
    private int id_recepti;
    private String ime_recepti;

    public Recepti() {
    }

    public Recepti(String ime_recepti) {
        this.ime_recepti = ime_recepti;
    }

    public Recepti(int id_recepti, String ime_recepti) {
        this.id_recepti = id_recepti;
        this.ime_recepti = ime_recepti;
    }

    public int getId_recepti() {
        return id_recepti;
    }

    public void setId_recepti(int id_recepti) {
        this.id_recepti = id_recepti;
    }

    public String getIme_recepti() {
        return ime_recepti;
    }

    public void setIme_recepti(String ime_recepti) {
        this.ime_recepti = ime_recepti;
    }

    @Override
    public String toString() {
        return "Recepti{" + "id_recepti=" + id_recepti + ", ime_recepti=" + ime_recepti + '}';
    }
    
    
}
