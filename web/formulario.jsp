<%@page contentType="text/html;charset=UTF-8" language="java"%>

<html>
    <head>
        <title>Formulario Usuario</title>
        <link rel="stylesheet" type="text/css" href="stylesformulario.css"/>
    </head>
    <body>
        <form action="guardar.jsp" method="post">
            <h2>Resgistrar Usuario</h2>
            <input type="text" name="nombre" placeholder="Nombre..." required>
            <input type="text" name="apellido" placeholder="Apellido..." required>
            <input type="text" name="email" placeholder="Correo electrónico..." required>
            <input type="text" name="telefono" placeholder="Telefono..." required>
            <input type="text" name="contraseña" placeholder="Contraseña..." required>
            <input type="submit" value="Guardar">
        </form>    
    </body>
</html>
