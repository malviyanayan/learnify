package controllers;

import java.io.IOException;
import java.util.TreeSet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import models.History;
import models.User;

@WebServlet("/activity.do")
public class ActivityServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setAttribute("target","act");
        User user = (User)req.getSession().getAttribute("user");
        
        if(user != null){
            TreeSet<History> histories = History.getHistoryByUser(user);
            req.setAttribute("histories", histories);
        }

        req.getRequestDispatcher("WEB-INF/pages/activity.jsp").forward(req, resp);
    }
}
