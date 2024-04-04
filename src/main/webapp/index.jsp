<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.Statement" %>
<%@ page import="java.sql.ResultSet" %>
<html>
<head>
    <title>Listado partidos</title>
</head>
<body>
<h1>Listado de partidos</h1>
<form action="crearPartido.jsp">
    <input type="submit" value="Crear">
</form>

<%
    //CARGA DEL DRIVER Y PREPARACIÓN DE LA CONEXIÓN CON LA BBDD
    //						v---------UTILIZAMOS LA VERSIÓN MODERNA DE LLAMADA AL DRIVER, no deprecado
    Class.forName("com.mysql.cj.jdbc.Driver");
    Connection conexion = DriverManager.getConnection("jdbc:mysql://localhost:3306/juego","root", "user");

    //UTILIZAR STATEMENT SÓLO EN QUERIES NO PARAMETRIZADAS.
    Statement s = conexion.createStatement();
    ResultSet listado = s.executeQuery ("SELECT * FROM partido");

    while (listado.next()) {
        out.println( "<br>" + "idPartido: " + listado.getString("id") + " Fecha: " + listado.getString("fecha") + " Equipo1: " +
                listado.getString("equipo1") + " Equipo2: " + listado.getString("equipo2") + "<input type=\"submit\" value=\"Borrar\">" + "<form action=\"formularioEditarSocio.jsp\"><input type=\"submit\" value=\"Modificar\"></form>" + "<br>");
    }
    listado.close();
    s.close();
    conexion.close();
%>
</body>
</html>