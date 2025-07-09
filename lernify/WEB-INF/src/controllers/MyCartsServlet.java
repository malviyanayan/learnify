package controllers;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import models.Cart;
import models.User;

@WebServlet("/mycarts.do")
public class MyCartsServlet extends HttpServlet{
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String nextPage = "get_started.do";

        User user = (User)req.getSession().getAttribute("user");

        if(user != null){
            ArrayList<Cart> carts = user.getAllCarts();
            req.getSession().setAttribute("carts", carts);
            nextPage = "WEB-INF/pages/mycarts.jsp";
        }

        req.getRequestDispatcher(nextPage).forward(req, resp);
    }
}
