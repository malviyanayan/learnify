package controllers;

import java.io.File;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import models.Trainer;
import models.User;

@WebServlet("/create_trainer.do")
public class CreateTrainerServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String trainerName = req.getParameter("name");
        String trainerProfession = req.getParameter("profession");
        String trainerExperience = req.getParameter("experience");
        String trainerEducation = req.getParameter("education");
        String trainerSkills = req.getParameter("skills");
    
        String respText = "false";
        User user = (User)req.getSession().getAttribute("user");

        Trainer trainer = new Trainer(user, trainerName, trainerExperience, trainerSkills, trainerEducation, trainerProfession);
        if (user != null) {
            if(!trainer.exist()){
                if(trainer.createTrainer()){
                    trainer.setTrainerId();
                    // create trainer folder in user folder

                    File file = new File(getServletContext().getRealPath("/WEB-INF/uploads/" + user.getEmail()), "lt_" + trainer.getTrainerId());
                    file.mkdirs();
                    respText = "true";
                }else{
                    respText = "false";
                }
            }else{
                respText = "exist";
            }
        }else{
            respText = "login";
        }

        resp.getWriter().write(respText);
    }
}