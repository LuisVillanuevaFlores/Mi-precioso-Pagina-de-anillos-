
<%@ page import="java.sql.*" %>
<script language="javascript" src="main.js">
</script>
<%
Connection conexion=null;

String mensaje="";

String driver="com.mysql.jdbc.Driver";
String url ="jdbc:mysql://localhost:3306/db_empresas?serverTimezone=UTC";

String tabla_nombre ="productos";
String usuario="root";
String clave ="";
try{
	Class.forName("com.mysql.jdbc.Driver");
	conexion = DriverManager.getConnection(url,usuario,clave);
	Statement st=conexion.createStatement();
	
	String nombre=request.getParameter("nombre");
	String categoria=request.getParameter("categoria");
	String empresa=request.getParameter("empresa");
	String precio=request.getParameter("precio");
	String stock=request.getParameter("stock");
	
    String metal=request.getParameter("metal");
    String peso=request.getParameter("peso");
    String piedra=request.getParameter("piedra");
    String forma=request.getParameter("forma");
    String quilates=request.getParameter("quilates");
    String piedras=request.getParameter("piedras");
    String diametro=request.getParameter("diametro");
    
	String select_value="SELECT * FROM "+tabla_nombre+" WHERE nombre='"+nombre+"'";
	ResultSet rs=st.executeQuery(select_value);
	if(rs.next()){
		response.sendRedirect("error.html");
	}
	else{
		String insert_value ="INSERT INTO "+tabla_nombre+" (nombre,categoria,empresa,precio,stock,metal,peso,piedra,forma,quilates,piedras,diametro) VALUES " +"('"+nombre+"','"+categoria+"','"+empresa+"','"+precio+"','"+stock+"','"+metal+"','"+peso+"','"+piedra+"','"+forma+"','"+quilates+"','"+piedras+"','"+diametro+"')";
		
		st.executeUpdate(insert_value);
        response.sendRedirect("index.jsp");
		
	}
	conexion.close();	
} catch(Exception ex){
	out.println(ex.toString());
}


%>