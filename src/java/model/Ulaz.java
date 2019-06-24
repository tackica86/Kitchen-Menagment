
package model;

import java.sql.Date;

public class Ulaz {

    private int id, id_namirnice;
    private Date datum_ulaz;
    private double kolicina_ulaz;

    public Ulaz() {
    }

    public Ulaz(int id, int id_namirnice, Date datum_ulaz, double kolicina_ulaz) {
        this.id = id;
        this.id_namirnice = id_namirnice;
        this.datum_ulaz = datum_ulaz;
        this.kolicina_ulaz = kolicina_ulaz;
    }

    public Ulaz(int id_namirnice, Date datum_ulaz, double kolicina_ulaz) {
        this.id_namirnice = id_namirnice;
        this.datum_ulaz = datum_ulaz;
        this.kolicina_ulaz = kolicina_ulaz;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getId_namirnice() {
        return id_namirnice;
    }

    public void setId_namirnice(int id_namirnice) {
        this.id_namirnice = id_namirnice;
    }

    public Date getDatum_ulaz() {
        return datum_ulaz;
    }

    public void setDatum_ulaz(Date datum_ulaz) {
        this.datum_ulaz = datum_ulaz;
    }

    public double getKolicina_ulaz() {
        return kolicina_ulaz;
    }

    public void setKolicina_ulaz(double kolicina_ulaz) {
        this.kolicina_ulaz = kolicina_ulaz;
    }

    @Override
    public String toString() {
        return "Ulaz{" + "id=" + id + ", id_namirnice=" + id_namirnice + ", datum_ulaz=" + datum_ulaz + ", kolicina_ulaz=" + kolicina_ulaz + '}';
    }
    
}
