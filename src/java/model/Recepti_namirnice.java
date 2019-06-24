
package model;

public class Recepti_namirnice {
    private int id_rn, id_recepti, id_namirnice;
    private double kolicina_rn;

    public Recepti_namirnice() {
    }

    public Recepti_namirnice(int id_rn, int id_recepti, int id_namirnice, double kolicina_rn) {
        this.id_rn = id_rn;
        this.id_recepti = id_recepti;
        this.id_namirnice = id_namirnice;
        this.kolicina_rn = kolicina_rn;
    }

    public Recepti_namirnice(int id_recepti, int id_namirnice, double kolicina_rn) {
        this.id_recepti = id_recepti;
        this.id_namirnice = id_namirnice;
        this.kolicina_rn = kolicina_rn;
    }

    public int getId_rn() {
        return id_rn;
    }

    public void setId_rn(int id_rn) {
        this.id_rn = id_rn;
    }

    public int getId_recepti() {
        return id_recepti;
    }

    public void setId_recepti(int id_recepti) {
        this.id_recepti = id_recepti;
    }

    public int getId_namirnice() {
        return id_namirnice;
    }

    public void setId_namirnice(int id_namirnice) {
        this.id_namirnice = id_namirnice;
    }

    public double getKolicina_rn() {
        return kolicina_rn;
    }

    public void setKolicina_rn(double kolicina_rn) {
        this.kolicina_rn = kolicina_rn;
    }

    @Override
    public String toString() {
        return "Recepti_namirnice{" + "id_rn=" + id_rn + ", id_recepti=" + id_recepti + ", id_namirnice=" + id_namirnice + ", kolicina_rn=" + kolicina_rn + '}';
    }
    
    
}
