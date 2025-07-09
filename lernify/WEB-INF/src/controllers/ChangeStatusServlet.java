package controllers;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import models.Course;
import models.Trainer;
import models.User;

@WebServlet("/change_status.do")
public class ChangeStatusServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String target = req.getParameter("target");
        Integer statusId = Integer.parseInt(req.getParameter("status-id").strip());
        Integer courseId = Integer.parseInt(req.getParameter("course-id").strip());

        HttpSession session = req.getSession();
        User user = (User)session.getAttribute("user");
        Trainer trainer = (Trainer)session.getAttribute("trainer");
        String respText = "false";

        if(trainer != null && user != null) {
            if(target != null && statusId != null && courseId != null) {
                if(target.equals("course")){
                    Course.changeStatus(courseId,statusId);
                    respText = "true";
                }else{
                    respText = "Invalid Target";
                }
            } else {
                respText = "missing_parameters";
            }
        } else {
            respText = "login";
        }
        
        resp.getWriter().write(respText);
        
    }
}
