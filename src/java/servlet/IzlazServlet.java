/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlet;

import database.DBQueries;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name = "IzlazServlet", urlPatterns = {"/IzlazServlet"})
public class IzlazServlet extends HttpServlet {
    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            double kolicina_izlaz = Double.parseDouble(request.getParameter("kolicina"));
            int id_recepti= Integer.parseInt(request.getParameter("recepti"));
            
            int tip_rashoda;
           
                if(request.getParameter("rashod")!=null)
                    tip_rashoda = 2;
                else
                    tip_rashoda = 1;
                    
            
            //da li ima zaliha
            boolean imaZaliha = DBQueries.checkNamirniceIzlaz(id_recepti, kolicina_izlaz);
            if (imaZaliha) {
                DBQueries.insertIntoIzlaz(kolicina_izlaz, id_recepti, tip_rashoda);
                poruka(out, "PROIZVOD USPESNO RASHODOVAN");

            } else {
                poruka(out, "NEMA DDOVOLJNO PROIZVODA NA STANJU");

            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
    }
           
    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

    private void poruka(PrintWriter out, String s) {
        out.println("<!DOCTYPE html>");
        out.println("<html>");
        out.println("<head>");
        out.println("<title>Servlet NewServlet</title>");
        out.println("</head>");
        out.println("<body>");
        out.println("<h1>" + s + "</h1>");
        out.println("</body>");
        out.println("</html>");
    }
}
