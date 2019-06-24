
package model;


public class Namirnice {
    
    private int id_namirnice, id_mera;
    private String ime_namirnice;
    private double trenutna_kolicina;


    public Namirnice() {
    }

    public Namirnice(int id_namirnice, int id_mera, String ime_namirnice, double trenutna_kolicina) {
        this.id_namirnice = id_namirnice;
        this.id_mera = id_mera;
        this.ime_namirnice = ime_namirnice;
        this.trenutna_kolicina = trenutna_kolicina;
    }

    public Namirnice(int id_mera, String ime_namirnice, double trenutna_kolicina) {
        this.id_mera = id_mera;
        this.ime_namirnice = ime_namirnice;
        this.trenutna_kolicina = trenutna_kolicina;
    }

    public int getId_namirnice() {
        return id_namirnice;
    }

    public void setId_namirnice(int id_namirnice) {
        this.id_namirnice = id_namirnice;
    }

    public int getId_mera() {
        return id_mera;
    }

    public void setId_mera(int id_mera) {
        this.id_mera = id_mera;
    }

    public String getIme_namirnice() {
        return ime_namirnice;
    }

    public void setIme_namirnice(String ime_namirnice) {
        this.ime_namirnice = ime_namirnice;
    }

    public double getTrenutna_kolicina() {
        return trenutna_kolicina;
    }

    public void setTrenutna_kolicina(double trenutna_kolicina) {
        this.trenutna_kolicina = trenutna_kolicina;
    }

    @Override
    public String toString() {
        return "Namirnice{" + "id_namirnice=" + id_namirnice + ", id_mera=" + id_mera + ", ime_namirnice=" + ime_namirnice + ", trenutna_kolicina=" + trenutna_kolicina + '}';
    }

   
    
}