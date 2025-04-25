<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.*" %>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Carrito</title>
    <link rel="stylesheet" href="StylesCarrito.css">
    
</head>
<body>
    <div class="carrito-container">
        <h2>Tu Carrito</h2>
        
        <%
            List<Map<String, Object>> carrito = (List<Map<String, Object>>) session.getAttribute("carrito");
            double total = 0.0;
            
            if (carrito == null || carrito.isEmpty()) {
                out.println("<p>El carrito está vacío.</p>");
            } else {
                for (Map<String, Object> item : carrito) {
                    String nombre = (String) item.get("nombre");
                    double precio = (double) item.get("precio");
                    total += precio;
        %>
                    <div class="carrito-item">
                        <span class="item-nombre"><%= nombre %></span>
                        <span class="item-precio">S/<%= String.format("%.2f", precio) %></span>
                    </div>
        <%
                }
        %>
                <div class="total">
                    Total a pagar: S/<%= String.format("%.2f", total) %>
                </div>
        <%
            }
        %>
        
        <div class="acciones">
            <form action="vaciarCarrito.jsp" method="post">
                <input type="submit" value="Vaciar carrito" class="btn btn-vaciar">
            </form>
            <a href="menu.jsp" class="btn">Volver al menú</a>
            <% if (carrito != null && !carrito.isEmpty()) { %>
                <a href="procesarPago.jsp" class="btn">Pagar ahora</a>
            <% } %>
        </div>
    </div>
</body>
</html>