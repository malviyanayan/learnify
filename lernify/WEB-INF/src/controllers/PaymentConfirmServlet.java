package controllers;

import java.io.IOException;
import java.sql.Timestamp;
import java.time.LocalDateTime;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import models.Cart;
import models.CartItem;
import models.MyCourse;
import models.User;

@WebServlet("/payment_confirm.do")
public class PaymentConfirmServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String nextPage = "WEB-INF/pages/payment_confirmation.jsp";
        Integer cartId = null;
        try {
            cartId = Integer.parseInt(req.getParameter("cart-id"));
        } catch (NumberFormatException e) {
            e.printStackTrace();
        }

        User user = (User) req.getSession().getAttribute("user");

        if (cartId == null && user == null) {
            resp.getWriter().write("Something went wrong ... in your cart....");
            return;
        }

        // is cart ki payment confirm hui
        Cart cart = new Cart(cartId);
        cart.setUser(user);
        cart.fetch();
        cart.paymentConfirm();

        // jo jo courses purchased ho gye hai unhe my courses me set karo
        ArrayList<CartItem> cartItems = cart.getAllItems();
        for (CartItem item : cartItems) {
            MyCourse myCourse = new MyCourse();
            myCourse.setCourse(item.getCourse());
            myCourse.setUser(user);

            String validity = item.getCourse().getValidity().trim();
            LocalDateTime validityDate = LocalDateTime.now();
            boolean flag = false;

            if (myCourse.exist()) {
                validityDate = myCourse.getValidityTile().toLocalDateTime();
                flag = true;
            } else {
                myCourse.setCompleted(0);
                myCourse.setProgress(new Gson().toJson(new ArrayList<Integer>()));
            }

            if (validity.endsWith("days") || validity.endsWith("Days")) {
                int days = Integer.parseInt(validity.split(" ")[0]);
                validityDate = validityDate.plusDays(days);
            } else if (validity.endsWith("years") || validity.endsWith("Years")) {
                int years = Integer.parseInt(validity.split(" ")[0]);
                validityDate = validityDate.plusYears(years);
            } else if (validity.endsWith("months") || validity.endsWith("Months")) {
                int months = Integer.parseInt(validity.split(" ")[0]);
                validityDate = validityDate.plusMonths(months);
            }

            myCourse.setValidityTile(Timestamp.valueOf(validityDate));
            if(flag){
                myCourse.update();
            }else{
                myCourse.save();
            }
        }
        
        // yadi ye cart user ka default cart hai to use null karna hai
        user.updateIfDefault(cart.getCartId());

        // payment kee information dikhana hai
        String time = cart.getPurchasedTime().toString();
        req.setAttribute("transectionId", cart.getTransactionId());
        req.setAttribute("time", time);
        req.setAttribute("amount", cart.getPrice());

        req.getRequestDispatcher(nextPage).forward(req, resp);
    }
}
