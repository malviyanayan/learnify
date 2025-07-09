package controllers;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import models.User;
import utils.EmailThread;

@WebServlet("/resendotp.do")
public class ResendOTPServlet extends HttpServlet{
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String email = req.getParameter("email");
        String respText = "false";
        System.out.println(email + "-----------------");
        
        if(email != null){
            String name = User.getName(email);
            System.out.println(name + "-----------------");
            if(name != null){
                EmailThread thread = new EmailThread(name, email);
                thread.run();
                respText = "true";
            }
        }

        resp.getWriter().write(respText);
    }
}
