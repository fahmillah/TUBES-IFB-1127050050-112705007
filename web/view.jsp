<%-- 
    Document   : view
    Created on : Dec 17, 2014, 12:46:19 PM
    Author     : erik
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.io.*" %>
<%@page import="java.sql.ResultSet" %>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<!DOCTYPE html>
<html>
<head>
<title>View Admin</title>
</head>
<body>
    <div align="center">
         <table width="720" border="0" cellspacing="10" cellpadding="0">
          <tr>
          <td height="100%"><div align="center"><img src="images/header.jpg" width="700" height="118" /></div></td>
        </tr>
         </table>
<%
try {
String Host = "jdbc:mysql://localhost:3306/compshop";
Connection conn = null;
Statement statement = null;
ResultSet rs = null;
Class.forName("com.mysql.jdbc.Driver");
conn = DriverManager.getConnection(Host,"root","");
statement = conn.createStatement();
String Data = "select * from admin";
rs = statement.executeQuery(Data);
%>
Daftar Admin
<table border="1">
<tr width="10" bgcolor="#9979">
<td>Nama</td>
<td>usernamet</td>
<td>password</td>
<td>status admin</td>
</tr>
<%
while (rs.next()) {
%>
<TR>
<TD><%=rs.getString("nama")%></TD>
<TD><%=rs.getString("username")%></TD>
<TD><%=rs.getString("password")%></TD>
<TD><%=rs.getString("status_admin")%></TD>
</TR>
<% } %>
</table>
<table>          
                <tr>
          Ingin Mengubah Data Admin? Klik<td height="100%" valign="top"><div class="lihat" align="right"><a href="update.jsp">disini</a></div></td></tr> 
            </table>
<table>
    <tr>
            atau ingin menghapus data admin?<td height="100%" valign="top"><div class="hapus" align="right"><a href="hapus.jsp">disini</a></div></td> </tr>
</table>
<%
rs.close();
statement.close();
conn.close();
} catch (Exception ex) {
out.println("Can't connect to database.");
}
%>
    </div>
</body>
</html>