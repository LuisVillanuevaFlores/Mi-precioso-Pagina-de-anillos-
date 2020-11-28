
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
	
	String modificar;
	String busqueda=request.getParameter("busqueda");
	String precio=request.getParameter("precio");
	String stock=request.getParameter("stock");
	int a=0;
    String metal=request.getParameter("metal");
    String peso=request.getParameter("peso");
    String piedra=request.getParameter("piedra");
    String forma=request.getParameter("forma");
    String quilates=request.getParameter("quilates");
    String piedras=request.getParameter("piedras");
    String diametro=request.getParameter("diametro");
    
	String select_value="SELECT * FROM "+tabla_nombre+" WHERE nombre = '"+busqueda+"'";
	ResultSet rs=st.executeQuery(select_value);
	if(!rs.next()){
		out.print("<script>alert('PRODUCTO NO ENCONTRADO');window.location.replace('index.jsp');</script>");
		
		return;
	}
	else{
        modificar ="UPDATE "+tabla_nombre+" SET ";
        
	    if(precio!=""&&precio!=null){    
	        modificar+="precio = "+precio;
	        a++;
	    }
		if(stock!=""&&stock!=null){
            if(a>0){modificar+=",";}
	        modificar+="stock = "+stock;
	        a++;
	    }

	    if(metal!=""){
            if(a>0){modificar+=",";}
	        modificar+="metal = '"+metal+"'";
	        a++;
	    }
	    if(peso!=""){
            if(a>0){modificar+=",";}
	        modificar+="peso = '"+peso+"'";
	        a++;
	    }
	    if(piedra!=""){
            if(a>0){modificar+=",";}
	        modificar+="piedra = '"+piedra+"'";
	        a++;
	    }
	    if(forma!=""){
            if(a>0){modificar+=",";}
	        modificar+="forma = '"+forma+"'";
	        a++;
	    }
	    if(quilates!=""){
            if(a>0){modificar+=",";}
	        modificar+="quilates = '"+quilates+"'";
	        a++;
	    }
	    if(piedras!=""){
            if(a>0){modificar+=",";}
	        modificar+="piedras = '"+piedras+"'";
	        a++;
	    }
		if(diametro!=""){
            if(a>0){modificar+=",";}
	        modificar+="diametro = '"+diametro+"'";
	    }
	    
		modificar+=" WHERE nombre = '"+busqueda+"'";
		
		/*out.print(modificar);*/

		out.print("<script>alert('PRODUCTO ACTUALIZADO PRODUCTO');window.location.replace('index.jsp');</script>");
		
		
		st.executeUpdate(modificar);
	}
	
	conexion.close();	
} catch(Exception ex){
	out.println(ex.toString());
}


%>