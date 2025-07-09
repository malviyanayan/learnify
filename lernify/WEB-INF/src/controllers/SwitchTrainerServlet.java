package controllers;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import models.Trainer;

@WebServlet("/switch_trainer.do")
public class SwitchTrainerServlet extends HttpServlet{
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        Trainer trainer = (Trainer) req.getSession().getAttribute("trainer");
        String newTrainer = req.getParameter("trainer");

        if(trainer != null){
            trainer.setActive(false);
            if(newTrainer != null){
                trainer.setActive(true,newTrainer);
            }
            req.getSession().removeAttribute("trainer");
        }

        resp.sendRedirect("trainer.do");
    }
}
