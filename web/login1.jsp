<%@page import="java.sql.ResultSet" %>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%
    request.getParameter("username");   
    request.getParameter("password");
    
    Class.forName("com.mysql.jdbc.Driver");
    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/compshop","root", "");
    Statement st = con.createStatement();
    ResultSet rs;
    
    rs = st.executeQuery("select * from admin where username='" + request.getParameter("username") + "' and password='" + request.getParameter("password") + "'");
    if (rs.next()) {
        session.setAttribute("userid", request.getParameter("username"));
        
        //out.println("welcome " + userid);
        //out.println("<a href='logout.jsp'>Log out</a>");
        response.sendRedirect("tambah.jsp");
        
    } else {
        response.sendRedirect("loginerror.jsp");
    }
%>