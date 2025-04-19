<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %> 
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Restaurante Sabor Real</title>
    <link rel="stylesheet" href="css/estilos.css">
    <link rel="stylesheet" href="Stylessesion.css">
    <style>
        body {
            font-family: 'Segoe UI', sans-serif;
            margin: 0;
            background: #fefaf6;
            color: #333;
        }

        header {
            background-color: #8b0000;
            color: white;
            padding: 20px 40px;
            display: flex;
            align-items: center;
            justify-content: space-between;
        }

        .logo-container {
            display: flex;
            align-items: center;
        }

         .logo-container img {
         height: 100px; 
         margin-right: 15px;
         }


        .nombre-restaurante {
         font-size: 2.2em; 
         font-weight: bold;
         }


        .header-text {
            text-align: center;
            flex-grow: 1;
        }

        .header-text h1 {
            font-size: 2em;
            margin: 0;
        }

        .header-text p {
            font-size: 1em;
            margin: 5px 0;
        }

        .btn {
            padding: 10px 20px;
            background: #d35400;
            color: white;
            border: none;
            border-radius: 5px;
            text-decoration: none;
        }
        .plato img {
         width: 100%;
         max-width: 300px;
         height: 200px;
         object-fit: cover;
         border-radius: 10px;
         display: block;
         margin: 0 auto 10px;
         }

      .plato {
      text-align: center;
      margin: 20px;
       }

    </style>
</head>

    <%
    String userName = (String) session.getAttribute("user_name");
    String userEmail = (String) session.getAttribute("user_email");
    
        if(userName != null) {
    %>
    <div class="user-info">
        Bienvenido, <%= userName %><br>
        (<%= userEmail %>)
        <a href="logout.jsp">Cerrar sesión</a>
    </div>
<%
    }
%>
<body>

<header>
    <div class="logo-container">
        <img src="img/LOGO.jpg" alt="LOGO">
        <div class="nombre-restaurante">SABOR REAL</div>
    </div>
    <div class="header-text">
        <h1>SIENTE EL SABOR AUTÉNTICO DE RESTAURANTE</h1>
        <p>Comida artesanal - Vinos seleccionados - Chefs de experiencia</p>
        <a class="btn" href="menu.jsp">Ver carta completa</a>
    </div>
</header>

<section class="menu">
    <h2 style="text-align:center;">Nuestra Carta</h2>

    <div class="tabs">
        <input type="radio" id="tab1" name="tab" checked>
        <label for="tab1">Entradas</label>

        <input type="radio" id="tab2" name="tab">
        <label for="tab2">Platos de Fondo</label>

        <input type="radio" id="tab3" name="tab">
        <label for="tab3">Bebidas</label>

        <input type="radio" id="tab4" name="tab">
        <label for="tab4">Postres</label>

        <div class="content">
            <div class="content-tab" id="content1">
                <div class="plato">
                <img src="img/Bruschetta de Tomate.jpg" alt="Bruschetta de Tomate">
                <div class="plato-info">Bruschetta de Tomate - S/22</div>
    
                <form action="Detalle_compra.jsp" method="get">
                <input type="hidden" name="nombre" value="Bruschetta de Tomate">
                <input type="hidden" name="precio" value="22.00">
                <input type="submit" value="Pedir">
    </form>
</div>    
                </div>
                <div class="plato"><img src="img/Empanadas de Queso.jpg"><div class="plato-info">Empanadas de Queso - S/18</div></div>
                <div class="plato"><img src="img/Ensalada Caprese.jpg"><div class="plato-info">Ensalada Caprese - S/20</div></div>
                <div class="plato"><img src="img/Ceviche Clásico.jpg"><div class="plato-info">Ceviche Clásico - S/24</div></div>
                <div class="plato"><img src="img/Anticuchos de Corazón.jpg"><div class="plato-info">Anticuchos de Corazón - S/25</div></div>
                
                <div class="plato"><img src="img/Croquetas de Pollo.jpg"><div class="plato-info">Croquetas de Pollo - S/19</div></div>
            </div>

            <div class="content-tab" id="content2">
                <div class="plato"><img src="img/Lasagna Bolognesa.jpg"><div class="plato-info">Lasagna Bolognesa - S/45</div></div>
                <div class="plato"><img src="img/Risotto de Champiñones.jpg"><div class="plato-info">Risotto de Champiñones - S/38</div></div>
                <div class="plato"><img src="img/Lomo Saltado.jpg"><div class="plato-info">Lomo Saltado - S/42</div></div>
                <div class="plato"><img src="img/Ají de Gallina.jpg"><div class="plato-info">Ají de Gallina - S/36</div></div>
                <div class="plato"><img src="img/Pollo a la Brasa.jpg"><div class="plato-info">Pollo a la Brasa - S/39</div></div>
                <div class="plato"><img src="img/Tallarin Verde con Bistec.jpg"><div class="plato-info">Tallarin Verde con Bistec - S/40</div></div>
            </div>

            <div class="content-tab" id="content3">
                <div class="plato"><img src="img/Jugo de Maracuyá.jpg"><div class="plato-info">Jugo de Maracuyá - S/10</div></div>
                <div class="plato"><img src="img/Refresco de Cebada.jpg"><div class="plato-info">Refresco de Cebada - S/8</div></div>
                <div class="plato"><img src="img/Chicha Morada.jpg"><div class="plato-info">Chicha Morada - S/9</div></div>
                <div class="plato"><img src="img/Limonada.jpg"><div class="plato-info">Limonada - S/7</div></div>
                <div class="plato"><img src="img/Inca Kola.jpg"><div class="plato-info">Inca Kola - S/6</div></div>
                <div class="plato"><img src="img/Café Americano.jpg"><div class="plato-info">Café Americano - S/10</div></div>
            </div>

            <div class="content-tab" id="content4">
                <div class="plato"><img src="img/Tiramisú.jpg"><div class="plato-info">Tiramisú - S/28</div></div>
                <div class="plato"><img src="img/Cheesecake de Fresa.jpg"><div class="plato-info">Cheesecake de Fresa - S/26</div></div>
                <div class="plato"><img src="img/Mousse de Maracuyá.jpg"><div class="plato-info">Mousse de Maracuyá - S/24</div></div>
                <div class="plato"><img src="img/Helado Artesanal.jpg"><div class="plato-info">Helado Artesanal - S/20</div></div>
                <div class="plato"><img src="img/Crema Volteada.jpg"><div class="plato-info">Crema Volteada - S/22</div></div>
                <div class="plato"><img src="img/Picarones.jpg"><div class="plato-info">Picarones - S/25</div></div>
            </div>
        </div>
    </div>
</section>

<section id="contacto">
    <h2>Contacto</h2>
    <p><strong>Teléfono:</strong> (01) 123-4567</p>
    <p><strong>Correo:</strong> contacto@saborabrasa.com</p>
    <p><strong>Dirección:</strong> Av. Gastronómica 456, Lima, Perú</p>
    <p><strong>Horario de Atención:</strong> Lunes a Domingo, 12:00 pm - 10:00 pm</p>
</section>

<footer>
    <p>&copy; 2025 Restaurante Sabor a Brasa. Todos los derechos reservados.</p>
</footer>

</body>
</html>
