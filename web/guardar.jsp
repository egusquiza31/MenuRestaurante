<%@ page import ="java.sql.*"%>
<%
    String nombre = request.getParameter("nombre");
    String correo = request.getParameter("email");
    
    String url="jdbc:mysql://localhost:3306/registro_usuarios?useSSL=false";
    String usuario="root";
    String clave="ajugardota2";
    
    Connection conn = null;
    PreparedStatement stmt = null;
    
    try
    {
        Class.forName("com.mysql.cj.jdbc.Driver");
        conn = DriverManager.getConnection(url,usuario,clave);
        
        String sql = "INSERT INTO usuarios (nombre, correo) VALUES (?, ?)";
        stmt = conn.prepareStatement(sql);
        stmt.setString(1, nombre);
        stmt.setString(2, correo);
        
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