/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import com.google.gson.Gson;
import com.google.gson.JsonObject;
import dao.CartDAO;
import dao.CustomerDAO;
import java.io.BufferedReader;
import java.io.IOException;
import dao.OrderDAO;
import dao.ProductDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.sql.Timestamp;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;
import model.Cart;
import model.Customer;
import model.Item;
import model.Order;
import model.OrderDetail;

/**
 *
 * @author trong
 */
@WebServlet(name = "GetOrderServlet", urlPatterns = {"/get-order"})
public class GetOrderServlet extends HttpServlet {

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
            out.println("<title>Servlet GetOrderServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet GetOrderServlet at " + request.getContextPath() + "</h1>");
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
        doPost(request, response);
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
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");
        CustomerDAO cusDao = new CustomerDAO();
        HttpSession session = request.getSession();
        OrderDAO ordDao = new OrderDAO();
        // Đọc dữ liệu JSON từ request
        StringBuilder sb = new StringBuilder();
        try (BufferedReader reader = request.getReader()) {
            String line;
            while ((line = reader.readLine()) != null) {
                sb.append(line);
            }
        }

        Gson gson = new Gson();
        JsonObject jsonObject = gson.fromJson(sb.toString(), JsonObject.class);
        System.out.println("JSON body: " + sb.toString());

        // Lấy thông tin khách hàng
        String fullName = jsonObject.get("fullName").getAsString();
        String phone = jsonObject.get("phone").getAsString();
        String email = jsonObject.get("email").getAsString();
        String paymentMethod = jsonObject.get("paymentMethod").getAsString();

        // Lấy thông tin địa chỉ
        JsonObject addressObj = jsonObject.getAsJsonObject("address");
        String street = addressObj.get("street").getAsString();
        String district = addressObj.get("district").getAsString();
        String city = addressObj.get("city").getAsString();
        String note = addressObj.get("note").getAsString();
        String fullAddress = addressObj.get("fullAddress").getAsString();
        CartDAO cartDao = new CartDAO();
        Cart checkoutCart = (Cart) session.getAttribute("checkoutItem");
        Customer customer = (Customer) session.getAttribute("infoCustomer");
        if (checkoutCart != null) {
            Timestamp time = Timestamp.valueOf(LocalDateTime.now());
            Order order = new Order(0, time, customer, null, checkoutCart.getTotalAmount());
            List<Item> list = checkoutCart.getItems();
            List<OrderDetail> odList = new ArrayList<>();
            for (Item item : list) {
                OrderDetail od = new OrderDetail(0, order, item.getProduct(), item.getQuantity(), item.getUnitPrice(), 0, "Pending", note, paymentMethod, street + ", " + district + ", " + city);
                odList.add(od);

            }
            ordDao.addOrder(order, odList);
            // Sau khi thêm thành công, xóa từng sản phẩm đã mua khỏi cart
            Cart cart = cartDao.getCartByID(customer.getCustomerID());
            int cartID = cart.getCartID();
            for (Item item : list) {
                cartDao.deleteItemByCartIDAndProductID(cartID, item.getProduct().getProductID());
            }
            Cart updatedCart = cartDao.getCartByID(customer.getCustomerID());
            List<Item> listItem = cartDao.getItemByCustomerID(customer.getCustomerID());
            updatedCart.setItems(listItem);
            session.setAttribute("cart", updatedCart);
        }
        System.out.println("Checkout cart: " + checkoutCart);

        session.setAttribute("address", street + ", " + district + ", " + city);
        JsonObject jsonResponse = new JsonObject();
        jsonResponse.addProperty("success", true);
        response.getWriter().print(jsonResponse.toString());
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
