<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.sql.*" %>
<%
    // Obtener parámetros del formulario
    String email = request.getParameter("email");
    String password = request.getParameter("password");
    
    // Validación básica
    if(email == null || password == null || email.isEmpty() || password.isEmpty()) {
        response.sendRedirect("index.jsp?error=Campos vacíos");
        return;
    }
%>
<html>
<head>
    <title>Verificación de Credenciales</title>
    <link rel="stylesheet" type="text/css" href="stylesLogin.css">
</head>
<body>
    <div class="login-container">
        <%
        // Conexión a la base de datos (configura estos valores)
        String url = "jdbc:mysql://localhost:3306/bdmenu_restaurante?useSSL=false";
        String usuario = "root";
        String contraseña = "menu123";
        
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection conn = DriverManager.getConnection(url, usuario, contraseña);
            
            // Consulta segura con PreparedStatement
            String sql = "SELECT id_cliente, nombre FROM cliente WHERE email = ? AND password = ?";
            PreparedStatement stmt = conn.prepareStatement(sql);
            stmt.setString(1, email);
            stmt.setString(2, password);
            
            ResultSet rs = stmt.executeQuery();
            
            if(rs.next()) {
                // Usuario válido
                int userId = rs.getInt("id_cliente");
                String nombre = rs.getString("nombre");
                
                // Crear sesión
                session.setAttribute("user_id", userId);
                session.setAttribute("user_name", nombre);
                session.setAttribute("user_email", email);
        %>
                <div class="success-message">
                    <h2>¡Bienvenido, <%= nombre %>!</h2>
                    <p>Has iniciado sesión correctamente.</p>
                    <a href="Menu_Restaurante.jsp" class="btn-success">Continuar al sistema</a>
                </div>
        <%
            } else {
                // Credenciales inválidas
        %>
                <div class="error-message">
                    <h2>Error de autenticación</h2>
                    <p>Correo electrónico o contraseña incorrectos.</p>
                    <a href="index.jsp" class="btn-error">Volver a intentar</a>
                </div>
        <%
            }
            
            // Cerrar recursos
            rs.close();
            stmt.close();
            conn.close();
            
        } catch(Exception e) {
        %>
            <div class="error-message">
                <h2>Error del sistema</h2>
                <p>Ocurrió un error al procesar tu solicitud.</p>
                <a href="index.jsp" class="btn-error">Volver al login</a>
            </div>
        <%
            e.printStackTrace();
        }
        %>
    </div>
</body>
</html>