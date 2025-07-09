package controllers;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import models.Trainer;
import models.User;

@WebServlet("/edit_trainer.do")
public class EditTrainerServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String trainerName = req.getParameter("name");
        String trainerProfession = req.getParameter("profession");
        String trainerExperience = req.getParameter("experience");
        String trainerEducation = req.getParameter("education");
        String trainerSkills = req.getParameter("skills");
        System.out.println("Trainer Name: " + trainerName);
        System.out.println("Trainer Profession: " + trainerProfession);
        System.out.println("Trainer Experience: " + trainerExperience);
        System.out.println("Trainer Education: " + trainerEducation);
        System.out.println("Trainer Skills: " + trainerSkills);

        // Assuming you have a Trainer class and a TrainerService to handle the business logic
        Trainer trainer = (Trainer) req.getSession().getAttribute("trainer");
        User user = (User) req.getSession().getAttribute("user");
        String respText = "false";

        if(trainer != null && user != null) {
            if(trainerName != null && trainerProfession != null && trainerExperience != null && trainerEducation != null && trainerSkills != null) {
                Trainer tempTrainer = new Trainer(user);
                tempTrainer.setTrainerName(trainerName);
                tempTrainer.setProfession(trainerProfession);
                tempTrainer.setExperience(trainerExperience);
                tempTrainer.setEducation(trainerEducation);
                tempTrainer.setSkills(trainerSkills);
                tempTrainer.setTrainerId(trainer.getTrainerId());
                if(tempTrainer.editUpdate()){
                    System.out.println("Trainer details updated successfully.");
                    req.getSession().setAttribute("trainer", tempTrainer);
                    respText = "true";
                }else{
                    System.out.println("something went wrong wala");
                    respText = "Something went Wrong";
                }
            } 
        } else {
            respText = "login";
        }

        resp.getWriter().write(respText);
    }
}