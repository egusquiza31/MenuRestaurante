<%@page import="java.util.Map"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Pedido Finalizado</title>
    <link rel="stylesheet" type="text/css" href="stylesprocesarPago.css">
</head>
<body>
    <%
        String userName = (String) session.getAttribute("user_name");
        List<Map<String, Object>> carrito = (List<Map<String, Object>>) session.getAttribute("carrito");
        double total = 0.0;
    %>

    <div class="container">
        <% if (userName != null) { %>
            <div class="user-info">
                <h1>Pedido Finalizado</h1>
                <p><%= userName %></p>
            </div>
        <% } %>

        <div class="carrito">
            <% 
                if (carrito == null || carrito.isEmpty()) { 
            %>
                <p>El carrito está vacío.</p>
            <% 
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
                    <strong>Total a pagar: S/<%= String.format("%.2f", total) %></strong>
                </div>
            <% 
                }
            %>
        </div>
    </div>
</body>
</html>