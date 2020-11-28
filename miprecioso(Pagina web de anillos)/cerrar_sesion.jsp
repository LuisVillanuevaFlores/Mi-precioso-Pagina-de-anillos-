<%@page session="true" import="java.sql.*" pageEncoding="UTF-8"%>

<%
    session.setAttribute("login","0");
    response.sendRedirect("index.jsp");
%>