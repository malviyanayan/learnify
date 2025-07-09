package controllers;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import models.MyCourse;
import models.User;

@WebServlet("/dashboard.do")
public class DashboardServlet extends HttpServlet {
    public void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession();
        User user = (User) session.getAttribute("user");

        if (user != null) {
            ArrayList<MyCourse> myCourses = MyCourse.fetch(user);
            req.setAttribute("myCourses", myCourses);
        }

        req.setAttribute("target", "dash");
        req.getRequestDispatcher("WEB-INF/pages/dashboard.jsp").forward(req, resp);
    }
}