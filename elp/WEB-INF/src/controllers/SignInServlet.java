package controllers;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import models.Status;
import models.User;
import utils.Utility;

@WebServlet("/signin.do")
public class SignInServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        
        // Get and clean inputs
        String email = req.getParameter("email").trim();
        String password = req.getParameter("password").trim();

        // System.out.println("Received Signin Attempt: Email = '" + email + "', Password = '" + password + "'");

        String respText = "false";

        // Check if email exists in DB
        if (Utility.isEmailExist(email)) {
            
            User user = new User(email, password);

            if (user.signin()) {
                if (user.isVerified()) {
                    // Valid credentials and verified
                    respText = "true";

                    // Optional: Update status to Active
                    user.changeStatus(new Status(1, "Active"));

                    // Store user in session
                    HttpSession session = req.getSession();
                    session.setAttribute("user", user);
                } else {
                    // Account exists but not verified
                    respText = "verify";
                }
            } else {
                // Email exists but password is wrong
                respText = "incorrect password";
            }

        } else {
            // Email not found
            respText = "email not exist";
        }

        resp.getWriter().write(respText);
    }
}
