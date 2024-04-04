<%@page import="java.sql.*" %>
<%@page import="java.util.Objects" %>
<%@ page import="java.io.IOException" %>
<%@page contentType="text/html" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
</head>
<body>
<%
    //CÓDIGO DE VALIDACIÓN
    boolean valida = true;
    Date fecha = null;
    String equipo1 = null;
    int puntos_equipo1 = -1;
    String equipo2 = null;
    int puntos_equipo2 = -1;
    String tipo_partido = null;

    try {

        fecha = Date.valueOf(request.getParameter("fecha"));

        equipo1 = request.getParameter("equipo1");

        puntos_equipo1 = Integer.parseInt(request.getParameter("puntos_equipo1"));

        equipo2 = request.getParameter("equipo2");

        puntos_equipo2 = Integer.parseInt(request.getParameter("puntos_equipo2"));

        tipo_partido = request.getParameter("tipo_partido");


        Objects.requireNonNull(request.getParameter("localidad"));


    } catch (Exception ex) {
        ex.printStackTrace();

        valida = false;
    }
    //FIN CÓDIGO DE VALIDACIÓN

    if (valida) {

        Connection conn = null;
        PreparedStatement ps = null;
// 	ResultSet rs = null;

        response.sendRedirect("index.jsp");

        try {

            //CARGA DEL DRIVER Y PREPARACIÓN DE LA CONEXIÓN CON LA BBDD
            //						v---------UTILIZAMOS LA VERSIÓN MODERNA DE LLAMADA AL DRIVER, no deprecado
            Class.forName("com.mysql.cj.jdbc.Driver");
            conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/partido", "root", "user");


            String sql = "INSERT INTO partido VALUES ( " +
                    "?, " + //fecha
                    "?, " + //equipo1
                    "?, " + //puntos_equipo1
                    "?, " + //equipo2
                    "?, " + //puntos_equipo2
                    "?)"; //tipo_partido

            ps = conn.prepareStatement(sql);
            int idx = 1;
            ps.setDate(idx++, fecha);
            ps.setString(idx++, equipo1);
            ps.setInt(idx++, puntos_equipo1);
            ps.setString(idx++, equipo2);
            ps.setInt(idx++, puntos_equipo2);
            ps.setString(idx++, tipo_partido);

            int filasAfectadas = ps.executeUpdate();
            System.out.println("SOCIOS GRABADOS:  " + filasAfectadas);


        } catch (Exception ex) {
            ex.printStackTrace();
        } finally {

            try {
                ps.close();
            } catch (Exception e) { /* Ignored */ }
            try {
                conn.close();
            } catch (Exception e) { /* Ignored */ }
        }

    } else {
        //out.println("Error de validación!");
        response.sendRedirect("index.jsp");
    }
%>

</body>
</html>