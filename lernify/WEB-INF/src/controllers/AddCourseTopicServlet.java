package controllers;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import models.CourseTopic;
import models.Trainer;
import models.User;

@WebServlet("/add_topic.do")
public class AddCourseTopicServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String topic = req.getParameter("topic");
        int courseId = Integer.parseInt(req.getParameter("course_id"));

        HttpSession session = req.getSession();
        Trainer trainer = (Trainer)session.getAttribute("trainer");
        User user = (User)session.getAttribute("user");

        String respText = "false";

        if(trainer != null && user != null){
            CourseTopic courseTopic = new CourseTopic(topic, courseId);

            if(courseTopic.createTopic() && !topic.equals("")){
                respText = "true";
            }else{
                respText = "not stored";
            }
        }else {
            respText = "login";
        }

        resp.getWriter().write(respText);
    }
}
