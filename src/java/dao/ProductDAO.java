/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import java.util.ArrayList;
import java.util.List;
import model.Product;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import model.Category;

/**
 *
 * @author trong
 */
public class ProductDAO extends DBContext {

    public List<Product> getAllProduct() {
        List<Product> list = new ArrayList<>();
        String sql = "select * from Product";
        CategoryDAO c = new CategoryDAO();
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Product p = new Product();
                p.setProductID(rs.getInt(1));
                p.setName(rs.getString(2));
                p.setDescription(rs.getString(3));
                p.setPrice(rs.getDouble(4));
                p.setQuantityInStock(rs.getInt(5));
                p.setCategory(c.getCategoryByID(rs.getInt(6)));

                list.add(p);
            }
        } catch (SQLException e) {
        }
        return list;
    }

    public List<Product> getProductByCategoryID(int categoryID) {
        List<Product> list = new ArrayList<>();
        String sql = "select * from Product where CategoryID = ?";
        CategoryDAO c = new CategoryDAO();
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, categoryID);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Product p = new Product();
                p.setProductID(rs.getInt(1));
                p.setName(rs.getString(2));
                p.setDescription(rs.getString(3));
                p.setPrice(rs.getDouble(4));
                p.setQuantityInStock(rs.getInt(5));
                p.setCategory(c.getCategoryByID(rs.getInt(6)));

                list.add(p);
            }
        } catch (SQLException e) {
        }
        return list;
    }

    public List<Product> searchProductByName(String keyword) {
        List<Product> list = new ArrayList<>();
        String sql = "SELECT * FROM Product WHERE Name LIKE ?";
        CategoryDAO c = new CategoryDAO();
        try {

            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, "%" + keyword + "%");
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                Product p = new Product();
                p.setProductID(rs.getInt(1));
                p.setName(rs.getString(2));
                p.setDescription(rs.getString(3));
                p.setPrice(rs.getDouble(4));
                p.setQuantityInStock(rs.getInt(5));
                p.setCategory(c.getCategoryByID(rs.getInt(6)));

                list.add(p);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }

    public int countProduct() {
        String sql = "select count(*) from Product";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                return rs.getInt(1);
            }
        } catch (Exception e) {
        }
        return 0;
    }

    public List<Product> getProductByPage(int offset, int limit) {
        List<Product> list = new ArrayList<>();
        String sql = "SELECT * FROM Product ORDER BY ProductID\n"
                + "OFFSET ? ROWS FETCH NEXT ? ROWS ONLY";
        CategoryDAO c = new CategoryDAO();
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, offset);
            st.setInt(2, limit);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Product p = new Product();
                p.setProductID(rs.getInt(1));
                p.setName(rs.getString(2));
                p.setDescription(rs.getString(3));
                p.setPrice(rs.getDouble(4));
                p.setQuantityInStock(rs.getInt(5));
                p.setCategory(c.getCategoryByID(rs.getInt(6)));

                list.add(p);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }

    public void addProduct(Product p) {
        String sql = "INSERT INTO [dbo].[Product] "
                + "([Name], [Description], [Price], [QuantityInStock], [CategoryID]) "
                + "VALUES (?, ?, ?, ?, ?)";
        String addImage = "INSERT INTO [dbo].[ProductImage] (ProductID, ImagePath) VALUES (?, ?)";
        try {
            PreparedStatement st = connection.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
            st.setString(1, p.getName());
            st.setString(2, p.getDescription());
            st.setDouble(3, p.getPrice());
            st.setInt(4, p.getQuantityInStock());
            st.setInt(5, p.getCategory().getCategoryID());
            st.executeUpdate();
            ResultSet rs = st.getGeneratedKeys();
            int productID = 0;
            if (rs.next()) {
                productID = rs.getInt(1);
            }

            // 4️⃣ Thêm từng link ảnh (nếu có)
            if (p.getImageToCreate() != null) {
                PreparedStatement stImg = connection.prepareStatement(addImage);
                for (String link : p.getImageToCreate()) {
                    stImg.setInt(1, productID);
                    stImg.setString(2, link);
                    stImg.addBatch(); // thêm vào batch
                }
                stImg.executeBatch(); // chạy tất cả cùng lúc
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public Product getProductByID(int id) {
        String sql = "select * from Product where ProductID = ?";
        CategoryDAO c = new CategoryDAO();
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, id);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                Product p = new Product();
                p.setProductID(rs.getInt(1));
                p.setName(rs.getString(2));
                p.setDescription(rs.getString(3));
                p.setPrice(rs.getDouble(4));
                p.setQuantityInStock(rs.getInt(5));
                p.setCategory(c.getCategoryByID(rs.getInt(6)));

                return p;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    public void updateProductByID(Product p) {
        String sql = "UPDATE [dbo].[Product]\n"
                + "SET [Name] = ?,\n"
                + "    [Description] = ?,\n"
                + "    [Price] = ?,\n"
                + "    [QuantityInStock] = ?,\n"
                + "    [CategoryID] = ?,\n"
                + "WHERE [ProductID] = ?;";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, p.getName());
            st.setString(2, p.getDescription());
            st.setDouble(3, p.getPrice());
            st.setInt(4, p.getQuantityInStock());
            st.setInt(5, p.getCategory().getCategoryID());

            st.setInt(6, p.getProductID());
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public void deleteProductByID(int id) {
        String deleteProduct = "DELETE FROM Product WHERE ProductID = ?";
        String deleteProductImage = "DELETE FROM ProductImage WHERE ProductID = ?";

        try {
            connection.setAutoCommit(false); // bắt đầu transaction

            // Xóa ảnh trước
            try (PreparedStatement st = connection.prepareStatement(deleteProductImage)) {
                st.setInt(1, id);
                st.executeUpdate();
            }

            // Xóa product
            try (PreparedStatement st2 = connection.prepareStatement(deleteProduct)) {
                st2.setInt(1, id);
                st2.executeUpdate();
            }

            connection.commit(); // nếu không lỗi thì xác nhận xóa

        } catch (SQLException e) {
            try {
                connection.rollback(); // có lỗi thì hoàn tác
            } catch (SQLException ex) {
                ex.printStackTrace();
            }
            e.printStackTrace();
        } finally {
            try {
                connection.setAutoCommit(true);
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }

    public List<String> getImageByProductID(int productID) {
        List<String> list = new ArrayList<>();
        String sql = "select * from ProductImage where ProductID = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, productID);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                String imageUrl = rs.getString("ImagePath");
                list.add(imageUrl);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }

    public static void main(String[] args) {
        ProductDAO d = new ProductDAO();
        List<Product> l = d.getProductByPage(1, 5);
        Product p = new Product();
        p = d.getProductByID(1);
        List<String> li = p.getImage();
        for (String string : li) {
            System.out.println(li);
        }
    }
}
