
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
	String user=request.getParameter("username");
	String password =request.getParameter("password");
	
	if(user.equals("admin") & password.equals("admin")){
        
	    session.setAttribute("login","2");
	    out.print("<script>alert('BIENVENIDO SEÑOR ADMINISTRADOR');window.location.replace('index.jsp');</script>");
	    return;
	}
	String select_value="SELECT * FROM "+tabla_nombre+" WHERE usuario='"+user+"'";
	ResultSet rs=st.executeQuery(select_value);
	while(rs.next()){
		if(rs.getObject("password").equals(password)){
            if(rs.getObject("autorizacion").equals(3)){
                out.print("<script>alert('SU EMPRESA SE ENCUENTRA DESHABILITADA');window.location.replace('index.jsp');</script>");
		        return;
            }
            session.setAttribute("login","1");
            
		    out.print("<script>alert('BIENVENIDO SEÑOR REPRESENTANTE DE LA EMPRESA');window.location.replace('index.jsp');</script>");
		    return;
		}
	}
    out.print("<script>alert('Usuario o contraseña incorrectos!');window.location.replace('index.jsp');</script>");
	conexion.close();	
} catch(Exception ex){
	out.println(ex.toString());
}


%>
