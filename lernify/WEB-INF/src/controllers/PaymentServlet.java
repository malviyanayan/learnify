package controllers;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import models.Cart;
import models.User;
import models.CartItem;

import java.util.ArrayList;

@WebServlet("/payment.do")
public class PaymentServlet extends HttpServlet{
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        Integer cartId = null;
        try{
            cartId = Integer.parseInt(req.getParameter("cart"));
        }catch(NumberFormatException e){
            e.printStackTrace();
        }

        String nextPage = "index.do";

        User user = (User)req.getSession().getAttribute("user");

        if(user != null){
            if(cartId != null){
                Cart cart = new Cart(cartId);
                cart.setUser(user);

                cart.fetch();
                if(!cart.getIsPurchased()){
                    // continue ..........
                    int price = 0;
                    int discount = 0;

                    ArrayList<CartItem> cartItems = cart.getAllItems();
                    for(CartItem item : cartItems){
                        price += item.getCourse().getPrice();
                        discount += item.getCourse().getDiscount();
                    }

                    float totalPrice = price - discount;
                    req.setAttribute("amount", totalPrice);

                    String transectionId = cart.getTransactionId();
                    if(transectionId == null){
                        transectionId = utils.Utility.generateTransectionId();
                        cart.setTransactionId(transectionId);
                        cart.saveTransectionId();
                    }

                    cart.setPrice((int)totalPrice);
                    cart.setDiscount(0);
                    cart.setTaxes(0);
                    cart.updateAmounts();

                    req.setAttribute("cartId", cart.getCartId());
                    req.setAttribute("transectionId", transectionId);
                    nextPage = "WEB-INF/pages/payment.jsp";
                }
            }
        }


        req.getRequestDispatcher(nextPage).forward(req, resp);
    }
}