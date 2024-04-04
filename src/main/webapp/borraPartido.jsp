<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
</head>
<body>
<%
    //CÓDIGO DE VALIDACIÓN
    boolean valida = true;
    int id = -1;
    try {
        id = Integer.parseInt(request.getParameter("id"));
    } catch (NumberFormatException nfe) {
        nfe.printStackTrace();
        valida = false;
    }
    //FIN CÓDIGO DE VALIDACIÓN

    if (valida) {


        Connection conn = null;
        PreparedStatement ps = null;
// 	ResultSet rs = null;

        try {

            //CARGA DEL DRIVER Y PREPARACIÓN DE LA CONEXIÓN CON LA BBDD
            //						v---------UTILIZAMOS LA VERSIÓN MODERNA DE LLAMADA AL DRIVER
            Class.forName("com.mysql.cj.jdbc.Driver");
            conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/juego","root", "user");

            String sql = "DELETE FROM partido WHERE id = ?";

            ps = conn.prepareStatement(sql);

            ps.setInt(1, id);

            int filasAfectadas = ps.executeUpdate();

            System.out.println("Partido BORRADO:  " + filasAfectadas);

        } catch (Exception ex) {
            ex.printStackTrace();
        } finally {

            try { ps.close(); } catch (Exception e) {}
            try { conn.close(); } catch (Exception e) {}
        }

    }
%>
<script>document.location = "index.jsp"</script>
</body>
</html>