
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.io.*" %>
<%@include file="koneksi.jsp" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body bgcolor="azure">
<%
try {
Connection connection = null;
Statement statement = null;
ResultSet rs = null;
Class.forName(xDRIVER);
connection = DriverManager.getConnection(xSTRING, xUSERNAME, xPASSWORD);
statement = connection.createStatement();
String u=request.getParameter("u");
String num=String.valueOf(u);
String Data = "select * from admin where usrname=?'"+num+"'";
rs = statement.executeQuery(Data);
while (rs.next()) {
%>
<form method="post">
<p>
<input type="hidden" id="username" name="username" value='<%=rs.getString("username")%>'/>
</p>
<p>
<label for="nama_admin">Nama Admin</label>
<input type="text" id="nama_admin" name="nama_admin" value='<%=rs.getString("nama")%>'/>
</p>
<p>
<label for="password">Password</label>
<input type="password" id="password" name="password" value='<%=rs.getString("password")%>'/>
</p>
<p>
<label>Status Admin</label>
<select name="status_admin">
<option>Aktif</option>
<option>Tidak Aktif</option>
</select>
</p>
<%  }
rs.close();
statement.close();
connection.close();
} catch (Exception ex) {
out.println("Can’t connect to database");
}
%>
<br/>
<p>
<label></label>
<input type="submit" value="Update"/>
<a href="view.jsp">Kembali</a>
</p>
</form>
<%
String a=request.getParameter("nama");
String b=request.getParameter("username");
String c=request.getParameter("password");
String d=request.getParameter("status_admin");
Connection conn=null;
PreparedStatement ps=null;
Class.forName(xDRIVER).newInstance();
int updateQuery=0;
if(a!=null && b!=null && c!=null && d!=null){
if(a!="" && b!="" && c!="" && d!=""){
try{
conn=DriverManager.getConnection(xSTRING,xUSERNAME,xPASSWORD);
String query="update admin set nama=?,password=?,status_admin=? where username='"+b+"'";
ps=conn.prepareStatement(query);
ps.setString(1,a);
ps.setString(2,c);
ps.setString(3,d);
updateQuery=ps.executeUpdate();
if(updateQuery!=0){
out.println("Berhasil Update Data");
%>


Updated Success
<%
}}catch(SQLException ex){
out.println("Koneksi bermasalah");
out.println("Gagal Tambah Data ");
}finally{
ps.close();
conn.close();
}}
}
%>


    </body>
</html>
