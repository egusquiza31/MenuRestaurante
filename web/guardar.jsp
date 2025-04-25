<%@ page import ="java.sql.*"%>
<%
    String nombre = request.getParameter("nombre");
    String apellido = request.getParameter("apellido");
    String email = request.getParameter("email");
    String telefono = request.getParameter("telefono");
    String password = request.getParameter("password");
   
            
    String url = "jdbc:mysql://localhost:3306/bdmenu_restaurante?useSSL=false";
    String usuario="root";
    String clave="ajugardota2";
    
    Connection conn = null;
    PreparedStatement stmt = null;
    
    try
    {
        Class.forName("com.mysql.cj.jdbc.Driver");
        conn = DriverManager.getConnection(url,usuario,clave);
        
        String sql = "INSERT INTO cliente (nombre, apellido , email, telefono, password) VALUES (?, ?, ?, ?, ?)";
        stmt = conn.prepareStatement(sql);
        stmt.setString(1, nombre);
        stmt.setString(2, apellido);
        stmt.setString(3, email);
        stmt.setString(4, telefono);
        stmt.setString(5, password);
        
        int filas = stmt.executeUpdate();
        
        if(filas > 0){
%>
<p style="text-align: center; color:green; font-size: 50px; ">
    ¡¡Cliente <%=nombre%> guardado con éxito!!
</p>
<p style="text-align: center;">
    <a href="formulario.jsp">Volver</a> | <a href="Menu_Restaurante.jsp">Ingresar a la página</a>
</p>
<%
}else{
%>
<p style="text-align: center; color: red;">
    Error al guardar el usuario.
</p>
<%
    }
}
finally
{
    if(stmt !=null)try{
        stmt.close();
    }catch(Exception e){
    }
    if(conn != null)try{
        conn.close();
    }catch(Exception e){}
    }
%>