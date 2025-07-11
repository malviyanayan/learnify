package controllers;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import models.User;

@WebServlet("/verify_forget_otp.do")
public class VerifyForgetOtpServlet extends HttpServlet{
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String otp = req.getParameter("otp");
        String newPassword = req.getParameter("new_password");
        String email = req.getParameter("email");

        String resptext = "false";

        if(email != null && otp != null && newPassword != null && User.verifyEmail(email, otp)){
            System.out.println(email  + " , " + otp + " , " + newPassword);
            User.setNewPassword(email, newPassword);
            resptext = "true";
        }

        resp.getWriter().write(resptext);
    }
}