<%-- 
    Document   : tambah
    Created on : Dec 17, 2014, 6:21:00 PM
    Author     : erik
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
<%@page import="java.io.*" %>
<%@include file="koneksi.jsp" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <style type="text/css">
 *{margin:auto;padding:0;}
 body{font-family:helvetica;background:#000;}
 #con{background:#fff;width:350px;padding:30px;margin-top:100px;border-radius:20px;border:1 solid #eee;box-shadow:2px 6px 10px #ccc;}
 h2{text-align:center;margin-bottom:15px;}
 p{margin-bottom:10px;}
 label{display:inline-block;width:100px;}
 input[type=submit]{border:none;color:#fff;background:linear-gradient(top, #333 0%, #777 100%);background:-moz-linear-gradient(top, #333 0%, #777 100%);background:-webkit-linear-gradient(top, #333 0%, #777 100%);height:30px;width:100px;border-radius:5px;}
 input[type=submit]:active{background:linear-gradient(top, #888 0%, #bbb 100%);background:-moz-linear-gradient(top, #888 0%, #bbb 100%);background:-webkit-linear-gradient(top, #888 0%, #bbb 100%);}
        </style>
    </head>
    <body bgcolor="azure">
        <div id="con">
 <h2>Register Area</h2>
 <form method="post">
 <p>
  <label>Nama</label>
  <input type="text" name="nama"/>
 </p>
  <label>Username</label>
  <input type="text" name="username"/>
 </p>
 <p>
  <label>Password</label>
  <input type="password" name="password"/>
 </p>
 <p>
 <p>
<label>Status Admi</label>
<select name="status_admin">
<option>Aktif</option>
<option>Tidak Aktif</option>
</select>
</p>
  <label></label>
  <input type="submit" name="submit" Value="Tambah"/>
  <input type="reset" name="cancel" value="Batal"
 </p>
 </form>
    <table>          
                <tr>
          <td height="100%" valign="top"><div class="lihat" align="right"><a href="view.jsp">Lihat Admin</a></div></td>
        </tr>
            </table>
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
String query="Insert into admin values(?,?,?,?)";
ps=conn.prepareStatement(query);
ps.setString(1,a);
ps.setString(2,b);
ps.setString(3,c);
ps.setString(4,d);
updateQuery=ps.executeUpdate();
if(updateQuery!=0){
%>


Inserted Success
<%
}}catch(SQLException ex){
out.println("Koneksi bermasalah");
}finally{
ps.close();
conn.close();
}}
}
%>
        </div>
    </body>
</html>