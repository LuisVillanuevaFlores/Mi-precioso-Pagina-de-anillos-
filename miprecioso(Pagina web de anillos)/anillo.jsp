
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8"/>
    <meta name="description" content=""/>
    <meta name="keywords" content=""/>
    <script src="jquery-3.3.1.min.js"></script>
    <script src="main.js"></script>
    <title>Mi Precioso</title>
	<link rel="stylesheet" href="estilos.css" />    
</head>

<body>

    <section style="opacity: 0.8;">
      <h2>INFORMACION DE ANILLO</h2>
       <div class="contenedor2">
       <div class="cajita">
        <h2>ANILLO <%= request.getParameter("nombre") %></h2>
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
					conexion =DriverManager.getConnection(url,usuario,clave);
					String select_value ="SELECT * FROM "+tabla_nombre+" WHERE nombre = '"+(String)request.getParameter("nombre")+"'";
					Statement st=conexion.createStatement();
					ResultSet rs=st.executeQuery(select_value);
                    
	                while(rs.next()){
                        
                        out.print("<br>CARACTERISTICAS:<br>");
                        out.print("EMPRESA : "+(String)rs.getObject("empresa")+"<br>");
                        out.print("PRECIO : "+rs.getObject("precio")+"<br>");
                        out.print("STOCK : "+rs.getObject("stock")+"<br><br><br>");
                        out.print("DESCRIPCION : <br>");
                        out.print("    Metal : "+(String)rs.getObject("metal")+"<br>");
                        out.print("    Peso : "+(String)rs.getObject("peso")+"<br>");
                        out.print("    Piedra : "+(String)rs.getObject("piedra")+"<br>");
                        out.print("    Forma : "+(String)rs.getObject("forma")+"<br>");
                        out.print("    Quilates : "+(String)rs.getObject("quilates")+"<br>");
                        out.print("    Numero de piedras : "+(String)rs.getObject("piedras")+"<br>");
                        out.print("    Diametro : "+(String)rs.getObject("diametro")+"<br>");
                        out.print("</div>");
                        out.print("<div class='imgP'><img class='ani' src='img/empresas/"+(String)rs.getObject("empresa")+'/'+(String)rs.getObject("categoria")+'/'+(String)rs.getObject("nombre")+".png' alt='anillo "+(String)rs.getObject("nombre")+"'></div>");
                        
                    }
                
					conexion.close();
				}catch (Exception ex){
					out.println(ex.toString());
			    }


			
			%> 
       <br><br><br><br>
        </div>
    </section>
    <footer>
    </footer>

</body>
</html>