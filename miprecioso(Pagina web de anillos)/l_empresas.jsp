<%@ page import="java.io.*" %>
<%@ page import="java.sql.*"%>
   <%
   
    Connection conexion=null;
    String mensaje="";
    String driver="com.mysql.jdbc.Driver";
    String url ="jdbc:mysql://localhost:3306/db_empresas?serverTimezone=UTC";
    String usuario="root";
    String clave ="";
    conexion = DriverManager.getConnection(url,usuario,clave);
    Statement st=conexion.createStatement();
	
	
    String tabla_nombre ="empresas";
try{
    Class.forName("com.mysql.jdbc.Driver");
    conexion =DriverManager.getConnection(url,usuario,clave);
    String select_value ="SELECT * FROM "+tabla_nombre+" WHERE empresa = '"+(String)request.getParameter("empresa")+"'";
				
    ResultSet rs=st.executeQuery(select_value);
    out.print("<table>");
    out.print("<tr><td>TELEFONO</td>");
    out.print("<td>DIRECCION</td>");
    out.print("<td>INFORMACION</td></tr>");
    
    while(rs.next()){

        out.print("<tr><td>"+rs.getObject("telefono")+"</td>");
        out.print("<td>"+rs.getObject("direccion")+"</td>");
        out.print("<td>"+rs.getObject("informacion")+"</td></tr>");
						

    }
    out.print("</table>");
    conexion.close();    
    }catch (Exception ex){
        out.println(ex.toString());
    }


			
%>