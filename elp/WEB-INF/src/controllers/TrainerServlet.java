package controllers;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import models.Course;
import models.Trainer;
import models.User;

@WebServlet("/trainer.do")
public class TrainerServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        User user = (User) req.getSession().getAttribute("user");
        if(user != null){
            Trainer trainer = new Trainer(user);
            if(trainer.fetchTrainer()){
                trainer.setActive(true);
                req.getSession().setAttribute("trainer", trainer);
                ArrayList<Course> courses = Course.getCourses(trainer);
                req.setAttribute("courses", courses);
                System.out.println(courses);
                // System.out.println(trainer.getTrainerName());
                // System.out.println(trainer.getExperience());
                // System.out.println("------------------");
                // System.out.println(trainer.getInactiveTrainers());
            }

        }

        req.setAttribute("target", "trnr");
        req.getRequestDispatcher("WEB-INF/pages/trainer.jsp").forward(req, resp);
    }
}
