
<%@ page import="java.sql.*" %>
<script language="javascript" src="main.js">
</script>
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
	String user=request.getParameter("user");
	String password =request.getParameter("password");
	String empresa=request.getParameter("empresa");
	String telefono=request.getParameter("telefono");
	String direccion=request.getParameter("direccion");
	String informacion=request.getParameter("informacion");

	String select_value="SELECT * FROM "+tabla_nombre+" WHERE empresa='"+empresa+"'";
	ResultSet rs=st.executeQuery(select_value);
	if(rs.next()){
		response.sendRedirect("error.html");
	}
	else{
		String insert_value ="INSERT INTO "+tabla_nombre+"(usuario,password,empresa,telefono,direccion,informacion) VALUES " +"('"+user+"','"+password+"','"+empresa+"','"+telefono+"','"+direccion+"','"+informacion+"');";
		st.executeUpdate(insert_value);
        response.sendRedirect("index.jsp");
		
	}
	conexion.close();	
} catch(Exception ex){
	out.println(ex.toString());
}


%>