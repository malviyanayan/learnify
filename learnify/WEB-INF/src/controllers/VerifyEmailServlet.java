package controllers;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import models.User;

@WebServlet("/verifyemail.do")
public class VerifyEmailServlet extends HttpServlet{
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String email = req.getParameter("email");
        String code = req.getParameter("otp");

        String respText = "false";


        if(email != null & code != null){
            if(User.verifyEmail(email, code)) respText = "true";
        }else{
            respText = "Something Went Wrong";
        }

        resp.getWriter().write(respText);
    }
}
