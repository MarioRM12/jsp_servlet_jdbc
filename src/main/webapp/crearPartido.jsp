<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
</head>
<body>
<h2>Introduzca los datos del nuevo partido:</h2>
<form method="post" action="grabaPartido.jsp">
    fecha <input type="date" name="fecha"/></br>
    equipo1 <input type="text" name="equipo1"/></br>
    puntos_equipo1 <input type="number" name="puntos_equipo1"/></br>
    equipo2 <input type="text" name="equipo2"/></br>
    puntos_equipo2 <input type="number" name="puntos_equipo2"/></br>
    tipo_partido <input type="text" name="tipo_partido"/></br>
    <input type="submit" value="Crear">
</form>

</body>
</html>