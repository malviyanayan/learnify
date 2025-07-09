package controllers;

import static utils.Utility.isEmailExist;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import models.User;
import utils.EmailThread;

@WebServlet("/reverifyemail.do")
public class ReverifyEmailServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String email = req.getParameter("email");

        String respText = "false";
        if (isEmailExist(email)) {
            EmailThread thread = new EmailThread(User.getName(email),email);
            thread.start();
            respText = "true";
        }

        resp.getWriter().write(respText);
    }
}
