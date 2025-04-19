<%@ page contentType="text/html;charset=UTF-8" %>
<html>
  <head>
    <title>Inicio</title>
    <link rel="stylesheet" type="text/css" href="stylesLogin.css"/>
  </head>
  <body>
    <h2>Iniciar Sesión</h2>
    
    <!-- Formulario Login -->
    <form method="POST" action="Confirmar.jsp">
        <input type="email" name="email" placeholder="Correo electrónico" required>
        <input type="password" name="password" placeholder="Contraseña" required>
        <button type="submit">Ingresar</button>
    </form>

    <!-- Botón registro -->
    <p>
        ¿No tienes cuenta? 
        <a href="formulario.jsp">Registrar Usuario</a>
    </p>

  </body>
</html>
