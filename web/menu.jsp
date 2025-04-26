<%@page import="java.util.Map"%>
<%@page import="java.util.List"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import ="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Menú - Sabor a Brasa</title>
    <link rel="stylesheet" href="css/estilos.css">
    
    <style>
        body {
            font-family: 'Segoe UI', sans-serif;
            background: #fefaf6;
            margin: 0;
        }
        header {
            background-color: #8b0000;
            padding: 30px;
            text-align: center;
            color: white;
        }
        section {
            padding: 40px;
            max-width: 900px;
            margin: auto;
        }
        .categoria {
            margin-bottom: 30px;
        }
        .categoria h3 {
            color: #8b0000;
            margin-bottom: 15px;
        }
        .plato {
            background: white;
            padding: 15px;
            border-radius: 10px;
            margin-bottom: 10px;
            box-shadow: 0 2px 6px rgba(0,0,0,0.1);
        }
        .plato img {
            width: 150px;
            height: auto;
            border-radius: 10px;
        }
        .plato p {
            margin: 10px 0;
        }
        .plato form {
            margin-top: 10px;
        }
        .plato button {
            background: #d35400;
            color: white;
            padding: 10px 20px;
            border: none;
            border-radius: 6px;
            cursor: pointer;
        }
        .plato button:hover {
            background: #b84300;
        }
        footer {
            background: #8b0000;
            color: white;
            text-align: center;
            padding: 20px;
            margin-top: 40px;
        }
    </style>
</head>
<body>

<header style="background-color: #8b0000; padding: 20px 40px; color: white; display: flex; align-items: center;">
    <img src="img/LOGO.jpg" alt="LOGO" style="height: 60px; margin-right: 15px;">
    <link rel="stylesheet" href="Stylessesion.css">
    <h1 style="margin: 0;">Nuestra Carta</h1>
    
</header>
    
<%
      //Usuario_carrito
    List<Map<String, Object>> carrito = (List<Map<String, Object>>) session.getAttribute("carrito");
    int cantidad = (carrito != null) ? carrito.size() : 0;
%>

<div style="text-align: right; padding: 10px 30px;">
    <a href="verCarrito.jsp" style="text-decoration: none; color: #8b0000; font-weight: bold;">
        🛒 Carrito (<%= cantidad %>)
    </a>
</div>

    
        <%
        
      
    String userName = (String) session.getAttribute("user_name");
    String userEmail = (String) session.getAttribute("user_email");
    
        if(userName != null) {
    %>
    <div class="user-info">
        Bienvenido, <%= userName %><br>
        (<%= userEmail %>)
        <a href="index.jsp">Cerrar sesión</a>
    </div>
<%
    }
%>

<section>

    <!-- Entradas -->
    <div class="categoria">
        <h3>Entradas</h3>
        <%
            
            String url = "jdbc:mysql://localhost:3306/bdmenu_restaurante?useSSL=false";
            String user = "root";
            String pass = "menu123";
            Connection conn = null;
            PreparedStatement stmt = null;
            ResultSet rs = null;
            try {
                Class.forName("com.mysql.cj.jdbc.Driver");
                conn = DriverManager.getConnection(url, user, pass);
                stmt = conn.prepareStatement("SELECT nombre, imagen, precio FROM platos WHERE categoria = ?");
                stmt.setString(1, "entrada");
                rs = stmt.executeQuery();
                while (rs.next()) {
        %>
        <div class="plato">
            <img src="<%=rs.getString("imagen")%>" alt="<%=rs.getString("nombre")%>">
            <p><strong><%=rs.getString("nombre")%></strong> - S/<%=rs.getString("precio")%></p>
        <form method="post" action="agregarCarrito.jsp">
         <input type="hidden" name="producto" value="<%= rs.getString("nombre") %>">
         <input type="submit" value="Agregar al carrito">
        </form>

        </div>
        <% 
                }
            } catch (Exception e) {
                out.println("Error: " + e.getMessage());
            } finally {
                if (rs != null) try { rs.close(); } catch (Exception e) {}
                if (stmt != null) try { stmt.close(); } catch (Exception e) {}
                if (conn != null) try { conn.close(); } catch (Exception e) {}
            }
        %>
    </div>

    <!-- Platos de Fondo -->
    <div class="categoria">
        <h3>Platos de Fondo</h3>
        <%
            try {
                conn = DriverManager.getConnection(url, user, pass);
                stmt = conn.prepareStatement("SELECT nombre, imagen, precio FROM platos WHERE categoria = ?");
                stmt.setString(1, "fondo");
                rs = stmt.executeQuery();
                while (rs.next()) {
        %>
        <div class="plato">
            <img src="<%=rs.getString("imagen")%>" alt="<%=rs.getString("nombre")%>">
            <p><strong><%=rs.getString("nombre")%></strong> - S/<%=rs.getString("precio")%></p>
            <form method="post" action="agregarCarrito.jsp">
                <input type="hidden" name="producto" value="<%=rs.getString("nombre")%>">
                 <input type="submit" value="Agregar al carrito">
            </form>
                
        </div>
        <% 
                }
            } catch (Exception e) {
                out.println("Error: " + e.getMessage());
            } finally {
                if (rs != null) try { rs.close(); } catch (Exception e) {}
                if (stmt != null) try { stmt.close(); } catch (Exception e) {}
                if (conn != null) try { conn.close(); } catch (Exception e) {}
            }
        %>
    </div>

    <!-- Bebidas -->
    <div class="categoria">
        <h3>Bebidas</h3>
        <%
            try {
                conn = DriverManager.getConnection(url, user, pass);
                stmt = conn.prepareStatement("SELECT nombre, imagen, precio FROM platos WHERE categoria = ?");
                stmt.setString(1, "bebida");
                rs = stmt.executeQuery();
                while (rs.next()) {
        %>
        <div class="plato">
            <img src="<%=rs.getString("imagen")%>" alt="<%=rs.getString("nombre")%>">
            <p><strong><%=rs.getString("nombre")%></strong> - S/<%=rs.getString("precio")%></p>
            <form method="post" action="agregarCarrito.jsp">
                <input type="hidden" name="producto" value="<%=rs.getString("nombre")%>">
                 <input type="submit" value="Agregar al carrito">
            </form>
                
                
                
        </div>
        <% 
                }
            } catch (Exception e) {
                out.println("Error: " + e.getMessage());
            } finally {
                if (rs != null) try { rs.close(); } catch (Exception e) {}
                if (stmt != null) try { stmt.close(); } catch (Exception e) {}
                if (conn != null) try { conn.close(); } catch (Exception e) {}
            }
        %>
    </div>

    <!-- Postres -->
    <div class="categoria">
        <h3>Postres</h3>
        <%
            try {
                conn = DriverManager.getConnection(url, user, pass);
                stmt = conn.prepareStatement("SELECT nombre, imagen, precio FROM platos WHERE categoria = ?");
                stmt.setString(1, "postre");
                rs = stmt.executeQuery();
                while (rs.next()) {
        %>
        <div class="plato">
            <img src="<%=rs.getString("imagen")%>" alt="<%=rs.getString("nombre")%>">
            <p><strong><%=rs.getString("nombre")%></strong> - S/<%=rs.getString("precio")%></p>
            <form method="post" action="agregarCarrito.jsp">
                <input type="hidden" name="producto" value="<%=rs.getString("nombre")%>">
                 <input type="submit" value="Agregar al carrito">
            </form>
                
        </div>
        <% 
                }
            } catch (Exception e) {
                out.println("Error: " + e.getMessage());
            } finally {
                if (rs != null) try { rs.close(); } catch (Exception e) {}
                if (stmt != null) try { stmt.close(); } catch (Exception e) {}
                if (conn != null) try { conn.close(); } catch (Exception e) {}
            }
        %>
    </div>

</section>

<footer>
    <p>&copy; 2025 Restaurante Sabor a Brasa</p>
</footer>

</body>
</html>
