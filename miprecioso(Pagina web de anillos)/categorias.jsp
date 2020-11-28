
<%@ page session="true" import="java.sql.*" %>

<%@ page import="java.io.*" %>
<%@ page import="java.sql.*"%>
<%@ page import="java.util.*" session="true" %>

<%!
    public String categoria(String c){
        Connection conexion=null;
        String mensaje="";
        String driver="com.mysql.jdbc.Driver";
        String url ="jdbc:mysql://localhost:3306/db_empresas?serverTimezone=UTC";
        String tabla_nombre ="productos";
        String usuario="root";
        String clave ="";
        String aux;
        String result="";
        try{
            Class.forName("com.mysql.jdbc.Driver");
            conexion = DriverManager.getConnection(url,usuario,clave);
            Statement st=conexion.createStatement();
            
            String select_value="SELECT * FROM "+tabla_nombre+" WHERE categoria='"+c+"'";
            ResultSet rs=st.executeQuery(select_value);
            while(rs.next()){
                aux="<div><a href='anillo.jsp?nombre="+(String)rs.getObject("nombre")+"'><img src='img/empresas/";
                aux+=(String)rs.getObject("empresa")+'/'+c+'/'+(String)rs.getObject("nombre")+".png' ";
                aux+="alt='anillo "+(String)rs.getObject("nombre")+"'></a></div>";
                result+=aux;
                                
                
            }
            
            conexion.close();
            return result;	
        } catch(Exception ex){
            return ex.toString();
        } 

        
    }
%>
