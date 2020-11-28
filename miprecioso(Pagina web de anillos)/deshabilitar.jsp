
<%@page session="true" import="java.sql.*" %>

<%
Connection conexion=null;
String mensaje="";

String driver="com.mysql.jdbc.Driver";
String url ="jdbc:mysql://localhost:3306/db_empresas?serverTimezone=UTC";

String tabla_nombre ="empresas";
String usuario="root";
String clave ="";
try{
	Class.forName("com.mysql.jdbc.Driver");
	conexion = DriverManager.getConnection(url,usuario,clave);
	Statement st=conexion.createStatement();
	String habilitar=request.getParameter("habilitar");
	String deshabilitar =request.getParameter("deshabilitar");
    String modificar="";
    String select_value="SELECT * FROM "+tabla_nombre+" WHERE usuario='"+deshabilitar+"'";
	ResultSet rs=st.executeQuery(select_value);
    if(rs.next()){
        out.print("<script>alert('NO SE ENCONTRO LA EMPRESA');window.location.replace('index.jsp');</script>");
        return;
    }
    if(habilitar.equals("")){
        modificar ="UPDATE "+tabla_nombre+" SET autorizacion = 3 WHERE empresa = '"+deshabilitar+"'";
        out.print("<script>alert('EMPRESA DESHABILITADA CORRECTAMENTE');window.location.replace('index.jsp');</script>");
    }
	else if(deshabilitar.equals("")){
	    modificar ="UPDATE "+tabla_nombre+" SET autorizacion = 1 WHERE empresa = '"+habilitar+"'";
	    out.print("<script>alert('EMPRESA HABILITADA CORRECTAMENTE');window.location.replace('index.jsp');</script>");
	}
	st.executeUpdate(modificar);
	
	
	
	conexion.close();	
} catch(Exception ex){
	out.println(ex.toString());
}


%>
