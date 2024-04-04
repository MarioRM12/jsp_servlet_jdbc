package org.iesvdm.jsp_servlet_jdbc.servlet;

import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import org.iesvdm.jsp_servlet_jdbc.dao.SocioDAO;
import org.iesvdm.jsp_servlet_jdbc.dao.SocioDAOImpl;
import org.iesvdm.jsp_servlet_jdbc.model.Socio;

public class EditarSociosServlet extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int socioID = Integer.parseInt(request.getParameter("socioID")); // Obtener el ID del socio a editar
        SocioDAO socioDAO = new SocioDAOImpl();
        Socio socio = socioDAO.find(socioID).orElse(null); // Buscar el socio en la base de datos
        request.setAttribute("socio", socio); // Pasar el socio a la vista
        request.getRequestDispatcher("formularioEditarSocio.jsp").forward(request, response); // Cargar el formulario de edición
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int socioID = Integer.parseInt(request.getParameter("socioID")); // Obtener el ID del socio a editar
        String nombre = request.getParameter("nombre");
        int estatura = Integer.parseInt(request.getParameter("estatura"));
        int edad = Integer.parseInt(request.getParameter("edad"));
        String localidad = request.getParameter("localidad");

        Socio socio = new Socio(socioID, nombre, estatura, edad, localidad);
        SocioDAO socioDAO = new SocioDAOImpl();
        socioDAO.update(socio); // Actualizar los datos del socio en la base de datos
        response.sendRedirect("index.jsp"); // Redirigir al listado principal
    }
}
