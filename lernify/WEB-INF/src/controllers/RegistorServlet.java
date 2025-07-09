package controllers;

import java.io.File;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import models.User;
import utils.EmailThread;

import static utils.Utility.*;

@WebServlet("/registor.do")
public class RegistorServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String name = req.getParameter("firstname") + " " + req.getParameter("lastname");
        String email = req.getParameter("email");
        String password = req.getParameter("password");

        email = email.strip();
        password = password.strip();
        User user = new User(name, email, password);
        String responseText = "false";

        // String validity = checkValidity(User);

        if (!isEmailExist(email)) {
            // yaha saari validity chack karna hai User ki
            if (user.signUp()) {
                responseText = "true";
                File file = new File(getServletContext().getRealPath("/WEB-INF/uploads"),email);
                file.mkdir();
                EmailThread thread = new EmailThread(name,email);
                thread.start();
            }
        } else {
            responseText = "Email is Already Exist";
        }

        resp.getWriter().write(responseText);
    }
}
