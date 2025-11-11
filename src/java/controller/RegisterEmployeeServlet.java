/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dao.AccountDAO;

import dao.EmployeeDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.Account;
import org.mindrot.jbcrypt.BCrypt;
import java.sql.Date;
import java.sql.Timestamp;
import java.time.LocalDateTime;
import model.Employee;

/**
 *
 * @author trong
 */
@WebServlet(name = "RegisterEmployeeServlet", urlPatterns = {"/register-employee"})
public class RegisterEmployeeServlet extends HttpServlet {

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
            out.println("<title>Servlet RegisterEmployeeServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet RegisterEmployeeServlet at " + request.getContextPath() + "</h1>");
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
        EmployeeDAO empDao = new EmployeeDAO();
        LocalDateTime now = LocalDateTime.now(); 
        //Take infor of employee 
        String name = request.getParameter("fullname");
        String email = request.getParameter("email");
        String phone = request.getParameter("phone");
        String deparment = request.getParameter("department");
        String hireDate = request.getParameter("hiredate");
        String salary_raw = request.getParameter("salary");
        double salary = Double.parseDouble(salary_raw);
        String hashedPassword = BCrypt.hashpw(phone, BCrypt.gensalt());
        // Nếu email tồn tại thì đưa ra lỗi đã tồn tại
        
        if (accDao.getAccountByEmail(email) != null) {
            request.setAttribute("existedAccount", "error");
            request.getRequestDispatcher("admin/register-employee.jsp").forward(request, response);
        }// Nếu chưa thì tạo employee account mới
        else {
            Account account = new Account(0, email, hashedPassword, 3, true, Timestamp.valueOf(now));
            Employee employee = new Employee(0, account, name, email, phone, deparment, Date.valueOf(hireDate), salary);
            empDao.addCustomer(employee, account);
            request.setAttribute("success", "s");
            request.getRequestDispatcher("admin/register-employee.jsp").forward(request, response);
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
