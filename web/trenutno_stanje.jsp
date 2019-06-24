
<%@page import="database.DBQueries"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html> 
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="css/style.css" type="text/css" rel="stylesheet">
        <title>Trenutno stanje</title>
    </head>
    <body>
        <div id="wrapper">
            <%@include file="header.jsp" %>
            <%@include file="navigacija.jsp"%>
            
            <div class="reg">
                <table class="doc">  
                    <%=DBQueries.getListOfNamirnice()%>
                </table>
            </div>
            <%@include file="footer.jsp"%>
        </div>
    </body>
</html>
