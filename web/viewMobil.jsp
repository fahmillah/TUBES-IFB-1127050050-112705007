<%-- 
    Document   : viewMobil
    Created on : Dec 21, 2014, 7:41:45 AM
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
<title>View Mobil</title>
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
String Data = "select * from tblproduct";
rs = statement.executeQuery(Data);
%>
<div>
<table>          
          <tr>
          <td height="100%" valign="top"><div class="home" align="right"><a href="index.jsp">Home</a></div></td></tr> 
</table></div>
Daftar Mobil
<table border="1">
<tr width="25" bgcolor="#blue">
<td>Merk</td>
<td>Spesifikasi</td>
<td>Harga</td>
<td>Kategori</td>
</tr>
<%
while (rs.next()) {
%>
<TR>
<TD><%=rs.getString("name")%></TD>
<TD><%=rs.getString("specification")%></TD>
<TD><%=rs.getInt("price")%></TD>
<TD><%=rs.getInt("category")%></TD>
</TR>
<% } %>
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