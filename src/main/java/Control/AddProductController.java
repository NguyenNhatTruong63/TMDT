package Control;

import Dao.ProductDao;
import Entity.Product;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.sql.SQLException;

@WebServlet(name = "AddProductController", value = "/AddProduct")
public class AddProductController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String id = request.getParameter("id");
        ProductDao dao = new ProductDao();
        try {
            Product product = dao.getProduct(id);
            request.setAttribute("product", product);
            request.getRequestDispatcher("AddProductDetail.jsp").forward(request, response);
        } catch (SQLException | ClassNotFoundException e) {
            throw new RuntimeException(e);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}