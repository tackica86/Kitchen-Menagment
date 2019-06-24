<%@page import="java.util.ArrayList"%>
<%@page import="model.Recepti"%>
<%@page import="database.DBQueries"%>


<% ArrayList<Recepti> recepti = DBQueries.getAllRecepti(); %>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Izlaz robe</title>
    </head>
    <body>
        <div id="wrapper">
            <%@include file="header.jsp"%>
            <%@include file="navigacija.jsp"%>
            <div class="reg">
                <form action="IzlazServlet" method="post">
                    <table>
                        <tr>
                            <td>Recepti</td>
                            <td>
                                <select name="recepti">
                                    <% for (int i = 0; i < recepti.size(); i++) {%>
                                    <option value="<%= recepti.get(i).getId_recepti()%>">
                                        <%= recepti.get(i).getIme_recepti()%> </option>
                                        <% }%>
                                </select> </td>
                        </tr>
                        <tr>
                            <td>Kolicina</td>
                            <td><input type="kolicina" placeholder="Unesite kolicinu" name="kolicina" id="izlaz" required></td>
                        </tr>
                        <tr>
                            <td>Rashod</td>
                            <td><input type="checkbox" name="rashod" value="null"></td>
                        </tr>
                        <tr>
                            <td></td>
                            <td><input type="submit" name="submit" value="Izlaz/Rashod"></td>
                        </tr>

                    </table>
                </form> 
            </div>
            <%@include file="footer.jsp"%>


    </body>
</html>
