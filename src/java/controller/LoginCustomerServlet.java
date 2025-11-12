/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dao.AccountDAO;
import dao.CartDAO;
import dao.CustomerDAO;
import dao.EmployeeDAO;
import dao.TokenDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.time.LocalDateTime;
import java.util.UUID;
import model.Account;
import model.Cart;
import model.Customer;
import org.mindrot.jbcrypt.BCrypt;
import java.sql.Timestamp;
import java.util.List;
import model.Item;

/**
 *
 * @author trong
 */
@WebServlet(name = "LoginCustomerServlet", urlPatterns = {"/login-customer"})
public class LoginCustomerServlet extends HttpServlet {

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
            out.println("<title>Servlet LoginCustomerServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet LoginCustomerServlet at " + request.getContextPath() + "</h1>");
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
        processRequest(request, response);
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
        
        AccountDAO accDao = new AccountDAO();
        CustomerDAO cusDao = new CustomerDAO();
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String msg = "";
        //Kiểm tra email xem có trong db Account không? Nếu không thì không có tài khoản
        if (accDao.getAccountByEmail(email) == null) {
            msg = "Account not existed!";
            request.setAttribute("accountNotFound", msg);
            request.getRequestDispatcher("common/login.jsp").forward(request, response);
        } //Nếu có thì sẽ kiểm tra pass lấy được với pass đầu vào qua BCrypt.pw(input, hashPass)
        else {
            Account account = accDao.getAccountByEmail(email);
            boolean correctPass = BCrypt.checkpw(password, account.getPassWord());
            //Kiểm tra có đúng pass không?
            if (correctPass) {
                if (account.getRoleID() == 1) {
                    HttpSession session = request.getSession();
                    Customer customer = cusDao.getCustomerByEmail(email);
                    session.setAttribute("infoCustomer", customer);
                    session.setAttribute("accountCustomer", account);
                    Cart sessionCart = (Cart) session.getAttribute("cart");
                    CartDAO daoCart = new CartDAO();
                    if (sessionCart != null) {
                        // Lấy cart hiện tại trong DB của customer
                        List<Item> dbItems = daoCart.getItemByCustomerID(customer.getCustomerID());
                        if (dbItems == null) {
                            dbItems = sessionCart.getItems();
                            daoCart.addCart(sessionCart);
                        }
                        Cart dbCart = daoCart.getCartByID(customer.getCustomerID());
                        if (dbCart == null) {
                            dbCart = new Cart();
                            dbCart.setCreatedAt(Timestamp.valueOf(LocalDateTime.now()));
                            dbCart.setItems(dbItems);
                            dbCart.setStatus("Active");
                            dbCart.setCustomer(customer);
                            dbCart.setTotalPrice(sessionCart.getTotalAmount());
                            daoCart.addNewCart(dbCart);
                        }
                        dbCart.setItems(dbItems);

                        // Merge sessionCart vào dbCart
                        for (Item sItem : sessionCart.getItems()) {
                            Item existing = dbCart.getItemsByID(sItem.getProduct().getProductID());
                            if (existing != null) {
                                existing.setQuantity(existing.getQuantity() + sItem.getQuantity());
                                existing.setSubTotal(existing.getQuantity() * existing.getUnitPrice());
                            } else {
                                
                                sItem.setCart(dbCart);
                                dbCart.addToCart(sItem);
                            }
                        }

                        // Lưu lại DB
                        dbCart.setCustomer(customer);
                        dbCart.setCreatedAt(Timestamp.valueOf(LocalDateTime.now()));
                        dbCart.setStatus("Active");
                        daoCart.updateAndInsert(dbCart, customer);

                        // Xóa session cart cũ
                        session.removeAttribute("cart");

                        // Tạo session cart mới từ DB
                        List<Item> list = daoCart.getItemByCustomerID(customer.getCustomerID());
                        Cart cart = new Cart();
                        cart.setItems(list);
                        session.setAttribute("cart", cart);
                        session.setAttribute("size", cart.size());
                    } else {
                        List<Item> list = daoCart.getItemByCustomerID(customer.getCustomerID());
                        Cart cart = new Cart();
                        cart.setItems(list);
                        session.setAttribute("cart", cart);
                        session.setAttribute("size", cart.size());
                    }
                    // Tạo token và cookies của username để lưu đăng nhập
                    String token = UUID.randomUUID().toString();
                    TokenDAO.saveToken(token, email);
                    Cookie cookie = new Cookie("auth-token", token);
                    cookie.setHttpOnly(true);
                    cookie.setSecure(true);
                    cookie.setMaxAge(60 * 60 * 24 * 7);
                    response.addCookie(cookie);
                    response.sendRedirect("product");
                } else if (account.getRoleID() == 2) {
                    HttpSession session = request.getSession();
                    session.setAttribute("accountAdmin", account);
                    response.sendRedirect("admin/dashboard.jsp");
                } else if (account.getRoleID() == 3) {
                    HttpSession session = request.getSession();
                    EmployeeDAO empDao = new EmployeeDAO();
                    session.setAttribute("infoEmployee", empDao.getEmployeeByEmail(email));
                    session.setAttribute("accountEmployee", account);
                    response.sendRedirect("/laptop/employee-handle");
                }
            } else {
                msg = "Account not existed!";
                request.setAttribute("accountNotFound", msg);
                request.getRequestDispatcher("common/login.jsp").forward(request, response);
            }
        }
        
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
