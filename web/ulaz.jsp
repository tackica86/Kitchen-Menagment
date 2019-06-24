<%@page import="java.util.ArrayList"%>
<%@page import="model.Namirnice"%>
<%@page import="database.DBQueries"%>


<% ArrayList<Namirnice> namirnice = DBQueries.getAllNamirnice(); %>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Ulaz robe</title>
    </head>
    <body>
        <div id="wrapper">
            <%@include file="header.jsp"%>
            <%@include file="navigacija.jsp"%>
            <div class="reg">
                <form action="UlazServlet" method="post">
                    <table>
                        <tr>
                            <td>Namirnice</td>
                            <td>
                                <select name="namirnice">
                                    <% for (int i = 0; i < namirnice.size(); i++) {%>
                                    <option value="<%= namirnice.get(i).getId_namirnice()%>">
                                        <%= namirnice.get(i).getIme_namirnice()%> </option>
                                        <% }%>
                                </select> </td>
                        </tr>
                        <tr>
                            <td>Količina</td>
                            <td><input type="kolicina" placeholder="Unesite kolicinu" name="kolicina" id="ulaz" required></td>
                        </tr>
                        <tr>
                            <td></td>
                            <td><input type="submit" name="submit" value="Ulaz"></td>
                        </tr>

                    </table>
                </form> 
            </div>
            <%@include file="footer.jsp"%>


    </body>
</html>

