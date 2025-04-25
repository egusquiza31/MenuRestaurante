<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.*, java.sql.*" %>
<%
    request.setCharacterEncoding("UTF-8");
    
    String productoNombre = request.getParameter("producto");
    
    // Obtener el precio del producto desde la base de datos
    String url = "jdbc:mysql://localhost:3306/bdmenu_restaurante?useSSL=false";
    String user = "root";
    String pass = "tu_contraseña";
    double precio = 0.0;
    
    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        Connection conn = DriverManager.getConnection(url, user, pass);
        PreparedStatement stmt = conn.prepareStatement(
            "SELECT precio FROM platos WHERE nombre = ?");
        stmt.setString(1, productoNombre);
        ResultSet rs = stmt.executeQuery();
        
        if (rs.next()) {
            precio = rs.getDouble("precio");
        }
        
        rs.close();
        stmt.close();
        conn.close();
    } catch (Exception e) {
        out.println("Error: " + e.getMessage());
    }
    
    // Crear un Map para representar el producto
    Map<String, Object> producto = new HashMap<>();
    producto.put("nombre", productoNombre);
    producto.put("precio", precio);
    
    // Obtener o crear el carrito en la sesión
    List<Map<String, Object>> carrito = (List<Map<String, Object>>) session.getAttribute("carrito");
    if (carrito == null) {
        carrito = new ArrayList<>();
        session.setAttribute("carrito", carrito);
    }
    
    // Agregar el producto al carrito
    carrito.add(producto);
    
    response.sendRedirect("menu.jsp");
%>