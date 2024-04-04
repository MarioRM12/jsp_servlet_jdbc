<%--
  Created by IntelliJ IDEA.
  User: marioromero
  Date: 4/4/24
  Time: 12:35
  To change this template use File | Settings | File Templates.
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Editar Socio</title>
</head>
<body>
<h2>Editar Socio</h2>
<form method="post" action="EditarSociosServlet">
    <input type="hidden" name="socioID" value="${socio.socioId}"> <!-- Campo oculto para pasar el ID del socio -->
    Nombre: <input type="text" name="nombre" value="${socio.nombre}"><br>
    Estatura: <input type="number" name="estatura" value="${socio.estatura}"><br>
    Edad: <input type="number" name="edad" value="${socio.edad}"><br>
    Localidad: <input type="text" name="localidad" value="${socio.localidad}"><br>
    <input type="submit" value="Actualizar">
</form>
</body>
</html>
