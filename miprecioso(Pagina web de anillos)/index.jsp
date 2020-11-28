<%@ page import="java.io.*" %>
<%@ page import="java.sql.*"%>
<%@ page import="java.util.*" session="true" %>
<%@ include file="categorias.jsp" %>
<%
    Connection conexion=null;
    String mensaje="";
    String driver="com.mysql.jdbc.Driver";
    String url ="jdbc:mysql://localhost:3306/db_empresas?serverTimezone=UTC";
    String usuario="root";
    String clave ="";
    conexion = DriverManager.getConnection(url,usuario,clave);
    Statement st=conexion.createStatement();
%>

<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8"/>
    <meta name="description" content="Compra y venta de anillos"/>
    <meta name="keywords" content="anillo,venta,compra,bajos precios"/>
    <script src="jquery-3.3.1.min.js"></script>
    <script src="main.js"></script>
    <title>Mi Precioso</title>
	<link rel="stylesheet" href="estilos.css" />    
</head>

<body>
	<header >
        <nav class="b_busqueda">


            <ul>
                <li><a href="index.jsp">MiPrecioso.com</a></li>
                <li><a>Busqueda</a></li>
                <input type="text" class="buscador" name="buscador" placeholder="Ingrese producto">
              <%



                    if (session.getAttribute("login")==null){
                        session.setAttribute("login","0");
                    }

                    String viewPermision = (String)session.getAttribute("login");
                    out.println("<span style='float:right'>");
                    if(viewPermision.equals("1")){
                        out.println("<li><a href='#i_producto' id='productos'>-Productos-</a></li>");
                        out.println("<li><a href='#r_ventas' id='ventas'>-Ventas-</a></li>");
                        out.println("<li><a href='#perfil2' id='cuenta'>-Mi cuenta-</a></li>");
                        
                        out.println("<li><a href='cerrar_sesion.jsp'>Cerrar sesion</a></li>");
                        

                    }
                    else if(viewPermision.equals("2")){
                        out.println("<li><a href='#i_producto' id='ventas'>*Productos*</a></li>");
                        out.println("<li><a href='#r_ventas' id='ventas'>*Ventas*</a></li>");
                        out.println("<li><a href='#registro' id='admin'>*Registrar*</a></li>");
                        out.println("<li><a href='#perfil' id='cuenta'>*Mi cuenta*</a></li>");
                        out.println("<li><a href='cerrar_sesion.jsp'>Cerrar sesion</a></li>");
                        
                    }
                    else if(viewPermision.equals("0")){
                        out.println("<li><a href='#login'>Iniciar sesion</a></li>");
                    }

                    out.println("</span>");


              %>

            </ul>
        </nav>

        <h1 class="titulo">Mi Precioso</h1>

        <nav class="navegacion" id="nav">
            <ul class="menu">
                <li><a href="#inicio">Inicio</a></li>
                <li><a>Categorias</a>
                    <ul class="submenu">
                        <li><a href="#compromiso">Compromiso</a></li>
                        <li><a href="#bodas">Bodas</a></li>
                        <li><a href="#amistad">Amistad</a></li>
                        <li><a href="#eternidad">Eternidad</a></li>
                    </ul>
                </li>

                <li><a>Nosotros</a>
                    <ul class="submenu">
                        <li><a href="#que_ofrecemos">¿Que ofrecemos?</a></li>
                        <li><a href="#quienes_somos">¿Quines somos?</a></li>
                    </ul>
                </li>
                <li><a href="#empresas">Empresas</a></li>
            </ul>

        </nav>
    </header>
    
    <section id="inicio" class="exp"> 
        <div class="fondo"></div>
        <div class="banner"></div>
    	<div class="separador"></div>         
        <article >
    		<h2>Articulos mas vendidos</h2>
            <div class="contenedor" style="margin: 20px;">
            <%
                String aux;
                String result="";
                
                Integer con=0;
                String consulta;
                for(int i=1;i<=20;i++){
                    String select_value="SELECT * FROM productos WHERE stock='"+i+"'";
	                ResultSet rs=st.executeQuery(select_value);
                    while(rs.next()&&con<5){
                        aux="<div><a href='anillo.jsp?nombre="+(String)rs.getObject("nombre")+"'><img src='img/empresas/";
                        aux+=(String)rs.getObject("empresa")+'/'+(String)rs.getObject("categoria")+'/'+(String)rs.getObject("nombre")+".png' ";
                        aux+="alt='anillo "+(String)rs.getObject("nombre")+"'></a></div>";
                        result+=aux;
                               
                        con++;
                                
                
                   }
                
                }
                out.print(result);
            %>
            </div>
        </article>
        <div class="separador"></div>   
        <div style="height:50px;clear:both;"></div>
        <div class="parte_final">
        <article>
        	<h2>Tambien te podria interesar:</h2>
          <a style="font-size: 25px" href="https://www.google.com/">Venta de carros</a><br>
          <a style="font-size: 25px" href="https://www.google.com/">Venta de bicicletas</a><br>
          <a style="font-size: 25px" href="https://www.google.com/">Venta de cámaras</a><br>
        </article>
        <article>
            <h2>¿Por que comprar en MiPrecioso?</h2>
            <div class="razones">
            	<div>
                	<img src="img/r_1.png" alt="anillo pacman">
                    <figcaption>Ahorra mas dinero</figcaption>
                </div>
                <div>
                	<img src="img/r_2.png" alt="anillo">
                    <figcaption>Compras y ventas seguras</figcaption>
                </div>
                <div>
                	<img src="img/r_3.png" alt="anillo">
                    <figcaption>Sitio web numero 1 en ventas</figcaption>
                </div>
                <div>
                	<img src="img/r_4.png" alt="anillo">
                    <figcaption>Rapida entrega de productos</figcaption>
                </div>
                <div>
                	<img src="img/r_5.png" alt="anillo">
                    <figcaption>Contacto directo con vendedores</figcaption>
                </div>
            </div>
        </article>
		</div>
    </section>
    
    <section id="compromiso">
       <h2>Articulos de compromiso</h2>
        <div class="contenedor">
            <%= categoria("Compromiso")%>    
        </div>
    </section>
    
    <section id="bodas">
       <h2>Articulos de bodas</h2>
        <div class="contenedor">
            <%= categoria("Bodas")%>    
        </div>
    </section>
    
    <section id="amistad">
       <h2>Articulos de amistad</h2>
        <div class="contenedor">
            <%= categoria("Amistad")%>    
        </div>
    </section> 
    
    <section id="eternidad">
       <h2>Articulos de eternidad</h2>
        <div class="contenedor">
            <%= categoria("Eternidad")%>    
        </div>
    </section>
    
	<section  id="login" >
	    
		<form action="login.jsp" method="POST">
			<h2>Iniciar sesion:</h2>
            <label for="username"><span>Nombre de usuario<em>(requerido)</em></span></label><br>
			<input type="text" name="username" id="username"required/><br>
			<label for="password"><span>Contraseña<em>(requerido)</em></span></label><br>
			<input type="password" name="password" id="password" required/><br>
			<br>
		
			<input type="submit" name="Ingresar" value="Ingresar" id="Ingresar"/>
		</form> 
		<br>
	</section>
   
    <section id="registro" >
	    
		<form action="registro.jsp" method="POST" class="login" >
		    <div>
                <h2 >Registrar empresas</h2>
		        <label for="usuario"><span>Usuario:</span></label><br>
                <input type="text" name="user" required/><br>

                <label for="contraseña"><span>Contraseña:</span></label><br>
                <input type="text" name="password" required/><br>

                <label for="empresa"><span>Nombre de la empresa:</span></label><br>
                <input type="text" name="empresa" required/><br><br><br>
                <input type="submit" name="submit" value="Añadir informacion" class="b_anadir">
                <input type="submit" name="submit" value="Registrarse" class="b_registrarse">
            </div>
			
           <div>
               <label for="telefono"><span>Numero de telefono</span></label><br>
                <input type="number" name="telefono"/><br>

                <label for="direccion"><span>Direccion</span></label><br>
                <input type="text" name="direccion"/><br>

                <label for="informacion"><span>Informacion adicional</span></label><br>
                <textarea name="informacion"></textarea><br><br>
           </div>
            
			
		</form> 
		<br>
	</section>
   
   <section id="quienes_somos" >
       <article>
          <h2>¿Quienes somos?</h2>
           <h2 style="font:normal 20px 'Fuente_3'">Somos una pagina web que cntrola y/o administra empresas especializadas en la venta de anillos, con años de garantia y seguridad.</h2>
       </article>
   </section>
   
   <section id="que_ofrecemos">
       <article>
       		<h2>¿Que ofrecemos?</h2>
           <h2 style="font:normal 20px 'Fuente_3'">Anillos en las categorias de Compromiso, Bodas, Amistad y Eternidad, elaborados en las disintas aleaciones que presentan nuestras empresas asociadas.</h2>
           
       </article>
   </section>

   
   <section id="r_ventas">
      
        <table>
            <h2>TOTAL DE VENTAS:</h2>
                  <tr>
                      <th>Nombre</th>
                      <th>Apellido</th>
                      <th>DNI</th>
                      <th>Producto</th>
                      <th>Empresa</th>
                      <th>Precio</th>
                  </tr>
                    <%
                        
                        try{
                            Class.forName("com.mysql.jdbc.Driver");
                            conexion =DriverManager.getConnection(url,usuario,clave);
                            String select_value ="SELECT * FROM ventas";
                            String buscar_info;
                     
                            ResultSet rs=st.executeQuery(select_value);
                            Statement st2=conexion.createStatement();
                            ResultSet rs2;
                            while(rs.next()){
                                out.print("<tr><td>"+rs.getObject("nombre")+"</td>");
                                out.print("<td>"+rs.getObject("apellido")+"</td>");
                                out.print("<td>"+rs.getObject("DNI")+"</td>");
                               
                                out.print("<td>"+rs.getObject("producto")+"</td>");
                                buscar_info="SELECT * FROM productos WHERE nombre ='"+(String)rs.getObject("producto")+"'";
                                rs2=st2.executeQuery(buscar_info);
                                if(!rs2.next()){out.print("<script>alert('Producto no encontrado');</script>");}
                                out.print("<td>"+rs2.getObject("empresa")+"</td>");
                                out.print("<td>"+rs2.getObject("precio")+"</td></tr>");

                                
                            }
                            conexion.close();
                        }catch (Exception ex){
                            out.println(ex.toString());
                        }

                    %>



            </table>
   
      
      <h2>REGISTRAR VENTA:</h2>
      
      <article id ="registrar_ventas">
           <form action="registrar_ventas.jsp">
            
                <label for="Nombre">Nombre:</label><br>
                <input type="text" name="nombre"><br>
                
                <label for="Apellido">Apellido:</label><br>
                <input type="text" name="apellido"><br>
               
                <label for="DNI">DNI:</label><br>
                <input type="text" name="DNI"><br>
                
                <label for="Producto">Producto:</label><br>
                <input type="text" name="producto"><br>
                
                <input type="submit" name="submit" value="Registrar Venta" class="b_anadir">
                
           </form>
           
       </article>     
       
   </section>

     
   <section id="empresas">
      
       <h2><a id="ep1" href="l_empresas.jsp?empresa=Inka_Rings">Inka Rings</a></h2><br>
       <h2><a id="ep2" href="l_empresas.jsp?empresa=Diamonds_Peru">Diamonds Peru</a>  </h2><br>
       <h2><a id="ep3" href="l_empresas.jsp?empresa=Eternal_Passion">Eternal Passion</a>  </h2><br>
       
   <div id="detalles"> </div>
       
   </section>
   
   <section id="perfil">
      <h2>MI PERFIL</h2>
      <table>
          <caption>Empresas habilitadas:</caption>
          <tr>
              <th>Usuario</th>
              <th>Contraseña</th>
              <th>Empresa</th>
              <th>Telefono</th>
              <th>Direccion</th>
              <th>Informacion</th>
          </tr>
          <%
		
				String tabla_nombre ="empresas";
				try{
					Class.forName("com.mysql.jdbc.Driver");
					conexion =DriverManager.getConnection(url,usuario,clave);
					String select_value ="SELECT * FROM "+tabla_nombre+" WHERE autorizacion = 1";
				
					ResultSet rs=st.executeQuery(select_value);
					while(rs.next()){
						out.print("<tr><td>"+rs.getObject("usuario")+"</td>");
						out.print("<td>"+rs.getObject("password")+"</td>");
						out.print("<td>"+rs.getObject("empresa")+"</td>");
						out.print("<td>"+rs.getObject("telefono")+"</td>");
						out.print("<td>"+rs.getObject("direccion")+"</td>");
             out.print("<td>"+rs.getObject("informacion")+"</td></tr>");
						

					}
					conexion.close();
				}catch (Exception ex){
					out.println(ex.toString());
			    }


			
			%>         
          
      </table>
      <table>
          <caption>Empresas deshabilitadas:</caption>
          <tr>
              <th>Usuario</th>
              <th>Contraseña</th>
              <th>Empresa</th>
              <th>Telefono</th>
              <th>Direccion</th>
              <th>Informacion</th>
          </tr>
          <%
				try{
					Class.forName("com.mysql.jdbc.Driver");
					conexion =DriverManager.getConnection(url,usuario,clave);
					String select_value ="SELECT * FROM "+tabla_nombre+" WHERE autorizacion = 3";
	
					ResultSet rs=st.executeQuery(select_value);
					while(rs.next()){
						out.print("<tr><td>"+rs.getObject("usuario")+"</td>");
						out.print("<td>"+rs.getObject("password")+"</td>");
						out.print("<td>"+rs.getObject("empresa")+"</td>");
						out.print("<td>"+rs.getObject("telefono")+"</td>");
						out.print("<td>"+rs.getObject("direccion")+"</td>");
             out.print("<td>"+rs.getObject("informacion")+"</td></tr>");
						

					}
					conexion.close();
				}catch (Exception ex){
					out.println(ex.toString());
			    }


			
			%>         
          
      </table>
      <form action="deshabilitar.jsp" method="POST">
			
            <label for="username"><span>Nombre de usuario<em>(requerido)</em></span></label><br>
			<input type="text" name="deshabilitar" id="deshabilitar" placeholder="Ingrese empresa a deshabilitar"/><br>
			<input type="text" name="habilitar" id="habilitar" placeholder="Ingrese empresa a habilitar"/><br><br>
			<input type="submit" name="Procesar" value="Procesar" id="Procesar"/>
		</form> 
      
        <article id ="zona_productos">
           <form action="modificar_producto.jsp">
               <h2>Manejo de productos:</h2>

                <label for="busqueda">Inicie busqueda:</label><br>
                <input type="text" name="busqueda" /><br>
                
                <label for="precio">Asignar precio:</label><br>
                <input type="text" name="precio" /><br>
                
                <label for="cambiar_stock">Cambiar stock:</label><br>
                <input type="text" name="stock"/><br>
                
                <h3>MODIFICAR CARACTERISTICAS:</h3>
                <label for="metal">Metal:</label><br>
                <input type="text" name="metal"><br>
               
                <label for="peso">Peso:</label><br>
                <input type="text" name="peso"><br>
               
                <label for="piedra">Piedra:</label><br>
                <input type="text" name="piedra"><br>
               
                <label for="forma">Forma:</label><br>
                <input type="text" name="forma"><br>
                
                <label for="quilates">Quilates:</label><br>
                <input type="text" name="quilates"><br>
                
                <label for="piedras">Numero de piedras:</label><br>
                <input type="text" name="piedras"><br>
               
                <label for="diametro">Diametro:</label><br>
                <input type="text" name="diametro"><br>
                
                <input type="submit" name="submit" value="Modificar datos" class="b_anadir">
                
           </form>
           
       </article>
      
   </section>
   

   <section id="perfil2">
      <h2>MI PERFIL</h2>

        <article id ="zona_productos">
           <form action="modificar_producto.jsp">
               <h2>Manejo de productos:</h2>

                <label for="busqueda">Inicie busqueda:</label><br>
                <input type="text" name="busqueda" /><br>
                
                <h3>MODIFICAR CARACTERISTICAS:</h3>
                <label for="metal">Metal:</label><br>
                <input type="text" name="metal"><br>
               
                <label for="peso">Peso:</label><br>
                <input type="text" name="peso"><br>
               
                <label for="piedra">Piedra:</label><br>
                <input type="text" name="piedra"><br>
               
                <label for="forma">Forma:</label><br>
                <input type="text" name="forma"><br>
                
                <label for="quilates">Quilates:</label><br>
                <input type="text" name="quilates"><br>
                
                <label for="piedras">Numero de piedras:</label><br>
                <input type="text" name="piedras"><br>
               
                <label for="diametro">Diametro:</label><br>
                <input type="text" name="diametro"><br>
                
                <input type="submit" name="submit" value="Modificar datos" class="b_anadir">
                
           </form>
           
       </article> 
       
   </section>
   
   
   <section id="i_producto">
       
              <article>
           <form action="productos.jsp">
              <h2>Ingresar producto:</h2>
               <label for="nombre">Nombre del anillo:</label><br>
               <input type="text" name="nombre"><br>
               
               <label for="categoria">Ingrese categoria:</label><br>
               <input type="text" name="categoria"><br>
               
               <label for="empresa">Ingrese empresa:</label><br>
               <input type="text" name="empresa"><br>
               
               <label for="precio">Ingrese precio:</label><br>
               <input type="text" name="precio"><br>
               
               <label for="stock">Cantidad de productos:</label><br>
               <input type="text" name="stock"><br>
               
               <label for="metal">Metal:</label><br>
               <input type="text" name="metal"><br>
               
               <label for="peso">Peso:</label><br>
               <input type="text" name="peso"><br>
               
               <label for="piedra">Piedra:</label><br>
               <input type="text" name="piedra"><br>
               
               <label for="forma">Forma:</label><br>
               <input type="text" name="forma"><br>
               
               <label for="quilates">Quilates:</label><br>
               <input type="text" name="quilates"><br>
               
               <label for="piedras">Numero de piedras:</label><br>
               <input type="text" name="piedras"><br>
               
               <label for="diametro">Diametro:</label><br>
               <input type="text" name="diametro"><br>
               
               <input type="submit" name="submit" value="Registrar anillo" class="b_anadir">
           </form>
       </article>  
   </section>
   
   <footer class="pie">
    	<div class="pieinfo">
            <div style="text-align: center;">
                <h3>Servicios: </h3>
                Venta de anillos <br>
                Distribucion de anillos <br>
                Garantia de un año <br>
                
                
            </div>
            <div style="text-align: center;">
                <h3>Contacto:</h3>
                Andy Ñaca Rodriguez <br>
                Luis Villanueva Flores<br>
                <address> telefono </address>
                955511689 <br>
                964760654<br>
            </div>
            <div style="text-align: center;">
                <h3>Redes Sociales:</h3>
                Whatsapp <br>
                Facebook<br>
                Instagram<br>
            </div>
        </div>
        <time style="display:block;" datetime="2018/06/31" pubdate>Publicado el 24/06/2018</time>
        <div style="text-align:center; width:100%">
        <h4 class="final">MI PRECIOSO</h4>
        </div>
    </footer>

</body>
</html>
