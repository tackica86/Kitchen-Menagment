package database;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import model.Namirnice;
import model.Recepti;

public class DBQueries {

    public static ArrayList<Namirnice> getAllNamirnice() throws SQLException {
        ArrayList<Namirnice> namirnice = new ArrayList<Namirnice>();

        Connection baza = DBConnection.getConn();
        Statement st = baza.createStatement();
        String upit = "select * from namirnice;";
        ResultSet rs = st.executeQuery(upit);
        while (rs.next()) {
            Namirnice n = new Namirnice();
            n.setId_namirnice(rs.getInt(1));
            n.setIme_namirnice(rs.getString(2));
            n.setTrenutna_kolicina(rs.getDouble(3));
            n.setId_mera(rs.getInt(4));
            namirnice.add(n);
        }
        return namirnice;
    }

    public static String getListOfNamirnice() throws SQLException {
        ArrayList<Namirnice> list = getAllNamirnice();
        String rez = "<tr>"
                + "<th>Ime namirnice</th>"
                + "<th>Trenutno stanje</th>"
                + "</tr>";
        for (int i = 0; i < list.size(); i++) {
            rez += "<tr><td>" + list.get(i).getIme_namirnice() + "</td>"
                    + "<td>" + list.get(i).getTrenutna_kolicina() + "</td>";

        }
        return rez;
    }

    public static ArrayList<Recepti> getAllRecepti() throws SQLException {
        ArrayList<Recepti> recepti = new ArrayList<Recepti>();

        Connection baza = DBConnection.getConn();
        Statement st = baza.createStatement();
        String upit = "select * from recepti;";
        ResultSet rs = st.executeQuery(upit);
        while (rs.next()) {
            Recepti r = new Recepti();
            r.setId_recepti(rs.getInt(1));
            r.setIme_recepti(rs.getString(2));
            recepti.add(r);
        }
        return recepti;
    }

    public static void insertIntoIzlaz(double kolicina_izlaz, int id_recepti, int tip)
            throws SQLException {

        Connection baza = DBConnection.getConn();
        String sql = "insert into izlaz "
                + "(kolicina_izlaz, id_recepti, datum_izlaz, id_tip) values (?, ?, now(), ?);";
   
        
        System.out.println("SQL " + sql);
        PreparedStatement pst = baza.prepareStatement(sql);
        pst.setDouble(1, kolicina_izlaz);
        pst.setInt(2, id_recepti);
        pst.setInt(3, tip);

        pst.execute();
    }

    public static boolean checkNamirniceIzlaz(int id_namirnice, double trenutna_kolicina)
            throws SQLException {
        Connection baza = DBConnection.getConn();
        String sql = "select trenutna_kolicina from namirnice where id_namirnice = ?;";
        PreparedStatement pst = baza.prepareStatement(sql);
        pst.setInt(1, id_namirnice);
        ResultSet rs = pst.executeQuery();
        rs.next();
        double staraKolicina = rs.getDouble(1);
        System.out.println("STARA KOLICINAAAA " + staraKolicina);
        return staraKolicina > trenutna_kolicina;
    }
     public static void insertIntoOtpis(double kolicina_otpis, int id_namirnice)
            throws SQLException {

        Connection baza = DBConnection.getConn();
        String sql = "insert into otpis "
                + "(kolicina_otpis, id_namirnice, datum_otpis) values (?, ?, now());";
        System.out.println("SQL " + sql);
        PreparedStatement pst = baza.prepareStatement(sql);
        pst.setDouble(1, kolicina_otpis);
        pst.setInt(2, id_namirnice);

        pst.execute();
    }

    public static boolean checkNamirniceOtpis(int id_namirnice, double trenutna_kolicina)
            throws SQLException {
        Connection baza = DBConnection.getConn();
        String sql = "select trenutna_kolicina from namirnice where id_namirnice = ?;";
        PreparedStatement pst = baza.prepareStatement(sql);
        pst.setInt(1, id_namirnice);
        ResultSet rs = pst.executeQuery();
        rs.next();
        double staraKolicina = rs.getDouble(1);
        return staraKolicina > trenutna_kolicina;
        
    }
    
 public static void insertIntoUlaz(double kolicina_ulaz, int id_namirnice)
            throws SQLException {

        Connection baza = DBConnection.getConn();
        String sql = "insert into ulaz "
                + "(kolicina_ulaz, id_namirnice, datum_ulaz) values (?, ?, now());";
        System.out.println("SQL " + sql);
        PreparedStatement pst = baza.prepareStatement(sql);
        pst.setDouble(1, kolicina_ulaz);
        pst.setInt(2, id_namirnice);

        pst.execute();
    }
}
