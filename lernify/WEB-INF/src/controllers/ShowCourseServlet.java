package controllers;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import models.Course;
import models.Trainer;

@WebServlet("/show_course.do")
public class ShowCourseServlet extends HttpServlet{
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        Integer courseId = null;
        try{courseId = Integer.parseInt(req.getParameter("course"));}catch(NumberFormatException e){e.printStackTrace();}

        if(courseId != null){
            Course course = new Course(courseId);
            if (course.fetchCourse()) {
                // course.setTrainer(Course.getTrainer(course.getCourseId()));;
                Integer trainerId = Course.getTrainerId(courseId);
                Trainer trainer = new Trainer();
                trainer.setTrainerId(trainerId);
                trainer.setTrainer();
                course.setTrainer(trainer);

                req.setAttribute("course", course);
                course.clickCourse();
            }
        }
        req.getRequestDispatcher("WEB-INF/pages/show_course.jsp").forward(req, resp);
    }
}