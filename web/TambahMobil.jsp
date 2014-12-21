<%-- 
    Document   : TambahMobil
    Created on : Dec 21, 2014, 6:00:48 AM
    Author     : erik
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
<%@page import="java.io.*" %>
<%@include file="koneksi.jsp" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="css/style.css" />
        <title>Tambah Mobil</title>
    </head>
    <body>
    <div align="center">
      <table width="720" border="0" cellspacing="10" cellpadding="0">
          <tr>
          <td height="100%"><div align="center"><img src="images/header.jpg" width="700" height="118" /></div></td>
        </tr>
        <tr>
          <td height="100%"><table width="100%" border="0" cellspacing="0" cellpadding="0">
            <tr>
              <td width="150" height="20">&nbsp;</td>
              <td width="19" height="20">&nbsp;</td>
              <td width="530" height="20">&nbsp;</td>
            </tr>
            <tr>
              <td width="150" valign="top"><table width="100%" border="0" cellpadding="0" cellspacing="0">
                <tr>
                  <td width="5%" height="30" background="images/header.png">&nbsp;</td>
                <tr>
                  <td width="5%" height="30" bgcolor="#EFEFEF">&nbsp;</td>
              </table></td>
              <td width="19">&nbsp;</td>
              <td valign="top">
                  <form id="form1" name="form1" method="post">
                    <table width="100%" border="0" cellspacing="0" cellpadding="2">
                        <tr>
                      <td width="12%" height="30" class="menucategory">Merk</td>
                      <td width="88%" height="30"><label>
                        <input name="merk" type="text" id="merk" size="40" />
                      </label></td>
                    
                    <tr>
                      <td width="12%" height="30" class="menucategory">Spesifikasi</td>
                      <td width="88%" height="30"><label>
                        <input name="spesifikasi" type="text" id="spesifikasi" size="20" />
                      </label></td>
                    </tr>
                    <tr>
                      <td width="12%" height="30" class="menucategory">Harga</td>
                      <td width="88%" height="30"><label>
                        <input name="harga" type="text" id="harga" size="70" />
                      </label></td>
                    </tr>
                    <tr>
                      <td width="12%" height="30" class="menucategory">Foto</td>
                      <td width="88%" height="30"><label>
                        <input name="foto" type="text" id="foto" size="20" />
                      </label></td>
                    </tr>
                    <tr>
                      <td width="12%" height="30" class="menucategory">Kategori</td>
                      <td width="88%" height="30"><label>
                        <input name="kategori" type="text" id="kategori" size="20" />
                      </label></td>
                    </tr>
                    <tr>
                      <td width="12%" height="30">&nbsp;</td>
                      <td width="88%" height="30">&nbsp;</td>
                    </tr>
                    <tr>
                      <td height="30" colspan="2">
                        <label>
                        <input type="submit" name="button" id="button" value="Tambah" />
                        </label>
                              <tr>
                                  <td height="30" colspan="2">
                                     <label>
                                         <input type="reset" name="btn_reset" id="button" value="Batal">
                                         </label>
                      </td>
                      
                      </tr>
                    </table>
                </form>
            <table>          
                <tr>
          <td height="100%" valign="top"><div class="lihat" align="right"><a href="viewMobil.jsp">Lihat Hasil</a></div></td>
        </tr>
            </table>
              </td>
            </tr>
          </table></td>
        </tr>
      </table>
        <%
String a = null;
String b =request.getParameter("merk");
String c =request.getParameter("spesifikasi");
String d =request.getParameter("harga");
String e =request.getParameter("foto");
String f = request.getParameter("kategori");
Connection conn=null;
PreparedStatement ps=null;
Class.forName(xDRIVER).newInstance();
int updateQuery=0;
if(b!=null && c!=null && d!=null && e!=null && f!=null){
if(b!="" && c!="" && d!="" && e!="" && f!=""){
try{
conn=DriverManager.getConnection(xSTRING,xUSERNAME,xPASSWORD);
String query="Insert into tblproduct values(?,?,?,?,?,?)";
ps=conn.prepareStatement(query);
ps.setString(1,a);
ps.setString(2,b);
ps.setString(3,c);
ps.setString(4,d);
ps.setString(5,e);
ps.setString(6,f);

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

    </div></body>
</html>
