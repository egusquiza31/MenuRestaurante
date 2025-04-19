<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%
    String nombre = request.getParameter("nombre");
    String precio = request.getParameter("precio");
%>
<html>
<head>
    <title>Detalle del Plato</title>
</head>
<body>
    <h2>Detalle del Pedido</h2>
    <p><strong>Plato:</strong> <%= nombre %></p>
    <p><strong>Precio:</strong> S/ <%= precio %></p>
    <a href="Menu_Restaurante.jsp">Volver</a>
</body>
</html>
