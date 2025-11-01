package controller;

import dao.CategoryDAO;
import dao.ProductDAO;

import java.io.IOException;
import jakarta.servlet.ServletException;

import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.util.ArrayList;
import java.util.List;
import model.Category;
import model.Product;

@WebServlet(name = "AddProductServlet", urlPatterns = {"/add-product"})

public class AddProductServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        ProductDAO productDao = new ProductDAO();
        CategoryDAO categoryDao = new CategoryDAO();

        String name = request.getParameter("name");
        String description = request.getParameter("description");
        String price_raw = request.getParameter("price");
        String quantity_raw = request.getParameter("quantityInStock");
        String brand = request.getParameter("brand");
        String[] imageLinks = request.getParameterValues("imageLinks");
        List<String> image = new ArrayList<>();
        for (String imageLink : imageLinks) {
            image.add(imageLink);
        }
        try {
            double price = Double.parseDouble(price_raw);
            int quantity = Integer.parseInt(quantity_raw);

            // 1️⃣ Xử lý category
            Category c = categoryDao.getCategoryByName(brand);
            if (c == null) {
                c = categoryDao.addCategory(new Category(0, brand)); // trả về Category với ID
            }
            Product p = new Product(0, name, description, price, quantity, c, image);
            productDao.addProduct(p);
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

}
