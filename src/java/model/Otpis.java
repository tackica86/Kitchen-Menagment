package model;

import java.sql.Date;

public class Otpis {

    private int id, id_namirnice;
    private Date datum_otpis;
    private double kolicina_otpis;

    public Otpis() {
    }

    public Otpis(int id_namirnice, Date datum_otpis, double kolicina_otpis) {
       
        this.id_namirnice = id_namirnice;
        this.datum_otpis = datum_otpis;
        this.kolicina_otpis = kolicina_otpis;
    }

    public Otpis(int id, int id_tip, int id_namirnice, Date datum_otpis, double kolicina_otpis) {
        this.id = id;
        this.id_namirnice = id_namirnice;
        this.datum_otpis = datum_otpis;
        this.kolicina_otpis = kolicina_otpis;
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

    public Date getDatum_otpis() {
        return datum_otpis;
    }

    public void setDatum_otpis(Date datum_otpis) {
        this.datum_otpis = datum_otpis;
    }

    public double getKolicina_otpis() {
        return kolicina_otpis;
    }

    public void setKolicina_otpis(double kolicina_otpis) {
        this.kolicina_otpis = kolicina_otpis;
    }

    @Override
    public String toString() {
        return "Otpis{" + "id=" + id + ", id_namirnice=" + id_namirnice + ", datum_otpis=" + datum_otpis + ", kolicina_otpis=" + kolicina_otpis + '}';
    }

    
}
