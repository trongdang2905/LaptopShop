/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dao.AccountDAO;
import dao.CustomerDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import org.mindrot.jbcrypt.BCrypt;
import java.sql.Date;
import model.Account;
import model.Customer;
import java.sql.Timestamp;
import java.time.LocalDateTime;
/**
 *
 * @author trong
 */
@WebServlet(name = "RegisterCustomerServlet", urlPatterns = {"/register-customer"})
public class RegisterCustomerServlet extends HttpServlet {

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
            out.println("<title>Servlet RegisterCustomerServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet RegisterCustomerServlet at " + request.getContextPath() + "</h1>");
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
        LocalDateTime now = LocalDateTime.now(); 
        String name = request.getParameter("fullname");
        String phone = request.getParameter("phone");
        String email = request.getParameter("email");
        String dateOfBirth = request.getParameter("dateofbirth");
        String address = request.getParameter("address");
        String password = request.getParameter("password");
        String confirmPassword = request.getParameter("confirmPassword");
        String hashedPassword = BCrypt.hashpw(password, BCrypt.gensalt());
        String msg = "";
        // Kiểm tra password và confirm password có giống nhau không?
        if (!password.isEmpty() && !confirmPassword.isEmpty()) {
            if (!password.equals(confirmPassword)) {
                msg = "Password is not the same!";
                request.setAttribute("differencePassword", msg);
                request.getRequestDispatcher("common/register.jsp").forward(request, response);
                return;
            }
        }

        // Kiểm tra email đã có trong Account hay chưa?, nếu có thì trả về thông báo email tồn tại
        if (accDao.getAccountByEmail(email) != null) {
            msg = "Account is existed!";
            request.setAttribute("existedAccount", msg);
            request.getRequestDispatcher("common/register.jsp").forward(request, response);
        } // Nếu chưa thì tạo mới Account sau đó tạo Customer
        else {
            Account account = new Account(0, email, hashedPassword, 1, true, Timestamp.valueOf(now));
            Customer customer = new Customer(0, accDao.getAccountByEmail(email), name, email, phone, address, Date.valueOf(dateOfBirth));
            cusDao.addCustomer(customer, account);
            response.sendRedirect("common/register-success.jsp");
        }
        // Tạo thành công thì đi đến trang Success
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
