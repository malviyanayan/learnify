package controllers;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import models.Status;
import models.User;
import utils.Utility;

@WebServlet("/signin.do")
public class SignInServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String email = req.getParameter("email");
        String password = req.getParameter("password");

        String respText = "false";

        if(Utility.isEmailExist(email)){
            email = email.strip();
            password = password.strip();
            User user = new User(email, password);
            if(user.signin()){
                if(user.isVerified()){
                    respText = "true";
                    user.changeStatus(new Status(1,"Active"));
                    HttpSession session = req.getSession();
                    session.setAttribute("user", user);
                }else{
                    respText = "verify";
                }
            }
        }

        resp.getWriter().write(respText);
    }
}

