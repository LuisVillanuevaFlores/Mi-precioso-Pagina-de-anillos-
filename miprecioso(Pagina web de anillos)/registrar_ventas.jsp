

<%@ page import="java.sql.*" %>

</script>
<%
    Connection conexion=null;

    String mensaje="";

    String driver="com.mysql.jdbc.Driver";
    String url ="jdbc:mysql://localhost:3306/db_empresas?serverTimezone=UTC";

    String tabla_nombre ="ventas";
    String usuario="root";
    String clave ="";
    try{
        Class.forName("com.mysql.jdbc.Driver");
        conexion = DriverManager.getConnection(url,usuario,clave);
        Statement st=conexion.createStatement();

        String nombre=request.getParameter("nombre");
        String apellido =request.getParameter("apellido");
        String DNI=request.getParameter("DNI");
        String producto=request.getParameter("producto");
        
        String select_value="SELECT * FROM productos WHERE nombre='"+producto+"'";
	    ResultSet rs=st.executeQuery(select_value);
        if(!rs.next()){
            out.print("<script>alert('PRODUCTO NO ENCONTRADO');</script>");
        }
        Integer stock = Integer.parseInt(rs.getObject("stock").toString());
    
        if(stock>0){
            String insert_value ="INSERT INTO "+tabla_nombre+"(nombre,apellido,DNI,producto) VALUES " +"('"+nombre+"','"+apellido+"','"+DNI+"','"+producto+"');";
                st.executeUpdate(insert_value);
           
            stock--;
            String u_stock ="UPDATE productos SET stock="+stock+" WHERE nombre ='"+producto+"'";
            st.executeUpdate(u_stock);
            out.print("<script>alert('VENTA REGISTRADA CORRECTAMENTE');window.location.replace('index.jsp');</script>");
                
                
        }
        else{
        
            out.print("<script>alert('PRODUCTO NO DISPONIBLE');</script>");
        }

        

        
        conexion.close();	 
    } catch(Exception ex){
        out.println(ex.toString());
    }
%>