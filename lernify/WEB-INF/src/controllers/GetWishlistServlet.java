package controllers;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import models.User;
import models.WishList;

@WebServlet("/my_wishlist.do")
public class GetWishlistServlet extends HttpServlet{
    
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        
        User user = (User)req.getSession().getAttribute("user");
        String respText = "[]";

        if(user != null){
            List<WishList> wishItems = WishList.wishItems(user.getUserId());
            Gson gson = new Gson();
            respText = gson.toJson(wishItems);
        }

        resp.getWriter().write(respText);
    }
}