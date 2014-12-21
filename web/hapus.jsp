
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="koneksi.jsp" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Hapus Admin</title>
    </head>
    <body>
        
<%
String username=request.getParameter("b");
String user=String.valueOf(username);
try{
Class.forName(xDRIVER).newInstance();
Connection conn = DriverManager.getConnection(xSTRING, xUSERNAME, xPASSWORD);
Statement st = conn.createStatement();
st.executeUpdate("DELETE FROM admin WHERE username = '"+username+"'");
response.sendRedirect("view.jsp");
}catch(Exception e)
{
}
%>


    </body>
</html>
