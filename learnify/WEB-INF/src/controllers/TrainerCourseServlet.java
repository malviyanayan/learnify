package controllers;

import java.io.IOException;
import java.util.ArrayList;
import java.util.TreeMap;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import models.Course;
import models.CourseTopic;
import models.SubTopic;
import models.Trainer;

@WebServlet("/trainer_course.do")
public class TrainerCourseServlet extends HttpServlet{
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        Integer courseId = Integer.parseInt(req.getParameter("course_id"));
        boolean flag = true;
        Trainer trainer = (Trainer)req.getSession().getAttribute("trainer");

        if(trainer != null && courseId != null){
            flag = false;
            Course course = new Course(trainer);
            course.setCourseId(courseId);
            if(course.fetchCourse()){
                req.setAttribute("course", course);
                ArrayList<CourseTopic> topics = course.getAllTopics();
                req.setAttribute("topics", topics);
                TreeMap<CourseTopic,ArrayList<SubTopic>> content  = course.getContent();
                req.setAttribute("content", content);
            }else{
                flag = true;
            }

        }

        if (flag) {
            resp.getWriter().write("Error 404");
        }else{
            req.getRequestDispatcher("WEB-INF/pages/trainer_course.jsp").forward(req, resp);;
        }

    }
}
