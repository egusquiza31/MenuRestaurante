<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
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
    <h1 style="margin: 0;">Nuestra Carta</h1>
</header>

<section>

    <!-- Entradas -->
    <div class="categoria">
        <h3>Entradas</h3>
        <%
            String[] entradas = {
                "Bruschetta de Tomate|img/Bruschetta de Tomate.jpg|22",
                "Empanadas de Queso|img/Empanadas de Queso.jpg|18",
                "Ensalada Caprese|img/Ensalada Caprese.jpg|20",
                "Ceviche Clásico|img/Ceviche Clásico.jpg|24",
                "Anticuchos de Corazón|img/Anticuchos de Corazón.jpg|25",
                "Croquetas de Pollo|img/Croquetas de Pollo.jpg|19"
            };
            for (String e : entradas) {
                String[] datos = e.split("\\|");
        %>
        <div class="plato">
            <img src="<%=datos[1]%>" alt="<%=datos[0]%>">
            <p><strong><%=datos[0]%></strong> - S/<%=datos[2]%></p>
            <form action="agregarPedido.jsp" method="post">
                <input type="hidden" name="plato" value="<%=datos[0]%>">
                <button type="submit">Agregar Pedido</button>
            </form>
        </div>
        <% } %>
    </div>

    <!-- Platos de Fondo -->
    <div class="categoria">
        <h3>Platos de Fondo</h3>
        <%
            String[] fondos = {
                "Lasagna Bolognesa|img/Lasagna Bolognesa.jpg|45",
                "Risotto de Champiñones|img/Risotto de Champiñones.jpg|38",
                "Lomo Saltado|img/Lomo Saltado.jpg|42",
                "Ají de Gallina|img/Ají de Gallina.jpg|36",
                "Pollo a la Brasa|img/Pollo a la Brasa.jpg|39",
                "Tallarin Verde con Bistec|img/Tallarin Verde con Bistec.jpg|40"
            };
            for (String f : fondos) {
                String[] datos = f.split("\\|");
        %>
        <div class="plato">
            <img src="<%=datos[1]%>" alt="<%=datos[0]%>">
            <p><strong><%=datos[0]%></strong> - S/<%=datos[2]%></p>
            <form action="agregarPedido.jsp" method="post">
                <input type="hidden" name="plato" value="<%=datos[0]%>">
                <button type="submit">Agregar Pedido</button>
            </form>
        </div>
        <% } %>
    </div>

    <!-- Bebidas -->
    <div class="categoria">
        <h3>Bebidas</h3>
        <%
            String[] bebidas = {
                "Jugo de Maracuyá|img/Jugo de Maracuyá.jpg|10",
                "Refresco de Cebada|img/Refresco de Cebada.jpg|8",
                "Chicha Morada|img/Chicha Morada.jpg|9",
                "Limonada|img/Limonada.jpg|7",
                "Inca Kola|img/Inca Kola.jpg|6",
                "Café Americano|img/Café Americano.jpg|10"
            };
            for (String b : bebidas) {
                String[] datos = b.split("\\|");
        %>
        <div class="plato">
            <img src="<%=datos[1]%>" alt="<%=datos[0]%>">
            <p><strong><%=datos[0]%></strong> - S/<%=datos[2]%></p>
            <form action="agregarPedido.jsp" method="post">
                <input type="hidden" name="plato" value="<%=datos[0]%>">
                <button type="submit">Agregar Pedido</button>
            </form>
        </div>
        <% } %>
    </div>

    <!-- Postres -->
    <div class="categoria">
        <h3>Postres</h3>
        <%
            String[] postres = {
                "Tiramisú|img/Tiramisú.jpg|28",
                "Cheesecake de Fresa|img/Cheesecake de Fresa.jpg|26",
                "Mousse de Maracuyá|img/Mousse de Maracuyá.jpg|24",
                "Helado Artesanal|img/Helado Artesanal.jpg|20",
                "Crema Volteada|img/Crema Volteada.jpg|22",
                "Picarones|img/Picarones.jpg|25"
            };
            for (String p : postres) {
                String[] datos = p.split("\\|");
        %>
        <div class="plato">
            <img src="<%=datos[1]%>" alt="<%=datos[0]%>">
            <p><strong><%=datos[0]%></strong> - S/<%=datos[2]%></p>
            <form action="agregarPedido.jsp" method="post">
                <input type="hidden" name="plato" value="<%=datos[0]%>">
                <button type="submit">Agregar Pedido</button>
            </form>
        </div>
        <% } %>
    </div>

</section>

<footer>
    <p>&copy; 2025 Restaurante Sabor a Brasa</p>
</footer>

</body>
</html>
