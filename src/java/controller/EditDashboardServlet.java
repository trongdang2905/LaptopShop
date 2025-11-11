/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dao.CategoryDAO;
import dao.ProductDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.Category;
import model.Product;

/**
 *
 * @author trong
 */
@WebServlet(name = "EditDashboardServlet", urlPatterns = {"/edit-product"})

public class EditDashboardServlet extends HttpServlet {


    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet EditDashboardServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet EditDashboardServlet at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String id_raw = request.getParameter("id");
        ProductDAO dao = new ProductDAO();
        try {
            int id = Integer.parseInt(id_raw);
            Product p = dao.getProductByID(id);
            request.setAttribute("product", p);
            request.getRequestDispatcher("dashboard-update-product.jsp").forward(request, response);
        } catch (NumberFormatException e) {
            e.printStackTrace();
        }
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        ProductDAO productDao = new ProductDAO();
        CategoryDAO categoryDao = new CategoryDAO();
        String id_raw = request.getParameter("productId");
        String name = request.getParameter("name");
        String description = request.getParameter("description");
        String price_raw = request.getParameter("price");
        String quantity_raw = request.getParameter("quantityInStock");
        String brand = request.getParameter("brand");
        String[] imageLinks = request.getParameterValues("imageLinks");
        try {
            double price = Double.parseDouble(price_raw);
            int quantity = Integer.parseInt(quantity_raw);
            int id = Integer.parseInt(id_raw);
            // 1️⃣ Xử lý category
            Category c = categoryDao.getCategoryByName(brand);
            if (c == null) {
                c = categoryDao.addCategory(new Category(0, brand)); // trả về Category với ID
            }

            

            // 4️⃣ Redirect về dashboard
            response.sendRedirect("dashboard-product");

        } catch (NumberFormatException e) {
            e.printStackTrace();
            response.getWriter().println("Price or quantity is invalid!");
        } catch (Exception e) {
            e.printStackTrace();
            response.getWriter().println("Error: " + e.getMessage());
        }
    }

    // Hàm đổi tên file, giữ đuôi
    private String modifyFileName(String name) {
        String[] words = name.trim().split("[\\s\\t]+");
        StringBuilder newName = new StringBuilder();
        for (int i = 0; i < words.length; i++) {
            newName.append(words[i].toLowerCase());
            if (i != words.length - 1) {
                newName.append("-");
            }
        }
        return newName.toString();
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
