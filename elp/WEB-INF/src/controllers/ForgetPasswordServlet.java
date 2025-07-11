package controllers;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import models.User;
import utils.ForgetEmailThread;

@WebServlet("/forget_password.do")
public class ForgetPasswordServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String respText = "invalid";

        String email = req.getParameter("email");
        if(email != null){
            String name = User.getName(email);
            if(name != null){
                ForgetEmailThread thread = new ForgetEmailThread(name, email);
                thread.start();
                respText = "true";
            }
        }

        resp.getWriter().write(respText);
    }
}
