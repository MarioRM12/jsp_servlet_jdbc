package org.iesvdm.jsp_servlet_jdbc.servlet;
import java.io.IOException;


import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import org.iesvdm.jsp_servlet_jdbc.dao.SocioDAO;
import org.iesvdm.jsp_servlet_jdbc.dao.SocioDAOImpl;

public class BorrarSociosServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int socioID = Integer.parseInt(request.getParameter("socioID")); // Obtener el ID del socio a borrar
        SocioDAO socioDAO = new SocioDAOImpl();
        socioDAO.delete(socioID); // Eliminar el socio de la base de datos
        response.sendRedirect("index.jsp"); // Redirigir al listado principal
    }
}

