package model;

import java.sql.Date;

public class Izlaz{
    
    private int id_izlaz, id_tip, id_namirnice;
    private double kolicina_izlaz;
    private Date datum_izlaz;

    public Izlaz() {
    }

    public Izlaz(int id_izlaz, int id_tip, int id_namirnice, double kolicina_izlaz, Date datum_izlaz) {
        this.id_izlaz = id_izlaz;
        this.id_tip = id_tip;
        this.id_namirnice = id_namirnice;
        this.kolicina_izlaz = kolicina_izlaz;
        this.datum_izlaz = datum_izlaz;
    }

    public Izlaz(int id_tip, int id_namirnice, double kolicina_izlaz, Date datum_izlaz) {
        this.id_tip = id_tip;
        this.id_namirnice = id_namirnice;
        this.kolicina_izlaz = kolicina_izlaz;
        this.datum_izlaz = datum_izlaz;
    }

    public int getId_izlaz() {
        return id_izlaz;
    }

    public void setId_izlaz(int id_izlaz) {
        this.id_izlaz = id_izlaz;
    }

    public int getId_tip() {
        return id_tip;
    }

    public void setId_tip(int id_tip) {
        this.id_tip = id_tip;
    }

    public int getId_namirnice() {
        return id_namirnice;
    }

    public void setId_namirnice(int id_namirnice) {
        this.id_namirnice = id_namirnice;
    }

    public double getKolicina_izlaz() {
        return kolicina_izlaz;
    }

    public void setKolicina_izlaz(double kolicina_izlaz) {
        this.kolicina_izlaz = kolicina_izlaz;
    }

    public Date getDatum_izlaz() {
        return datum_izlaz;
    }

    public void setDatum_izlaz(Date datum_izlaz) {
        this.datum_izlaz = datum_izlaz;
    }

    @Override
    public String toString() {
        return "Izlaz{" + "id_izlaz=" + id_izlaz + ", id_tip=" + id_tip + ", id_namirnice=" + id_namirnice + ", kolicina_izlaz=" + kolicina_izlaz + ", datum_izlaz=" + datum_izlaz + '}';
    }
    
    
    
}