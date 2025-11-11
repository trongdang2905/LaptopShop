/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dao.CartDAO;
import dao.ProductDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.Cart;
import model.Customer;
import model.Item;
import model.Product;
import java.sql.*;
import java.time.LocalDate;
import java.time.LocalDateTime;

/**
 *
 * @author trong
 */
@WebServlet(name = "AddToCartServlet", urlPatterns = {"/add-to-cart"})
public class AddToCartServlet extends HttpServlet {

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
            out.println("<title>Servlet AddToCartServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet AddToCartServlet at " + request.getContextPath() + "</h1>");
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
        String id_r = request.getParameter("productId");
        String quantity_r = request.getParameter("quantity");

        int productId = Integer.parseInt(id_r);
        int quantity = Integer.parseInt(quantity_r);

        HttpSession session = request.getSession();
        ProductDAO daoProduct = new ProductDAO();
        CartDAO daoCart = new CartDAO();

        Product product = daoProduct.getProductByID(productId);

        // Lấy hoặc tạo cart
        Cart cart = (Cart) session.getAttribute("cart");
        if (cart == null) {
            cart = new Cart();
        }

        // Tạo Item
        Item item = new Item(0, cart, product, quantity, product.getPrice(), quantity * product.getPrice());
        cart.addToCart(item);

        // Nếu đã đăng nhập → lưu cart vào database
        Cart sessionCart = (Cart) session.getAttribute("cart");
        Customer customer = (Customer) session.getAttribute("infoCustomer");
        if (sessionCart != null && customer != null) {
            // Kiểm tra Cart trong DB của customer
            Cart existingCart = daoCart.getCartByID(customer.getCustomerID());
            if (existingCart != null) {
                // Chỉ thêm item mới vào Cart cũ, không insert lại tất cả
                daoCart.addItemToCart(existingCart.getCartID(), item);
            } else {
                // Tạo Cart mới, thêm item
                cart.setCustomer(customer);
                daoCart.addCart(cart); // Chỉ thêm toàn bộ khi Cart mới
            }
        } else {
            // Chưa đăng nhập → lưu cart vào session
            session.setAttribute("cart", cart);
            session.setAttribute("size", cart.size());
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
        processRequest(request, response);
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
