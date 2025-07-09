package controllers;

import java.io.IOException;
import java.sql.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import utils.Utility;
import models.User;

@WebServlet("/edit.do")
public class EditUserServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String change = req.getParameter("change");
        
        String respText = "Kuchhh to gadbad hai...daya";
        
        User user = (User) req.getSession().getAttribute("user");
        
        if (user != null) {
            if (change.equals("name")) {
                String name = req.getParameter("name");
                if (utils.Utility.isValidName(name)) {
                    if(user.updateName(name)){
                        user.setName(name);
                        respText = "true";
                    }
                } else {
                    respText = "false";
                }
            }else if(change.equals("aboutme")){
                String aboutMe = req.getParameter("aboutme");
                aboutMe = Utility.refine(aboutMe);

                if(Utility.isValidAbout(aboutMe)){
                    if(user.updateAboutMe(aboutMe)){
                        user.setAboutMe(aboutMe);
                        respText = "true";
                    }else{
                        respText = "Internal Issue...";
                    }
                }else{
                    respText = "false";
                }
            }else if(change.equals("dob")){
                String dobStr = req.getParameter("dob");
                if(dobStr != null){
                    Date dob = Date.valueOf(dobStr);
                    if(user.updateDob(dob)){
                        user.setDob(dob);
                        respText = "true";
                    }
                }else{
                    respText = "false";
                }  
            }else if(change.equals("gender")){
                String gtemp = req.getParameter("gender");
                if(gtemp != null){
                    gtemp = gtemp.toUpperCase();
                    Character gender = gtemp.charAt(0);
                    if(Utility.isValidGender(gender)){
                        if(user.updateGender(gender)){
                            user.setGender(gender);
                            respText = "true";
                        }
                    }else {
                        respText = "invalid gender";
                    }
                }else respText = "false";
            }else if (change.equals("country")) {
                try{
                    Integer countryId = Integer.parseInt(req.getParameter("country"));
                    if(Utility.isValidCountry(countryId)){
                        if (user.updateCountry(countryId)) {
                            user.setCountry(countryId);
                            respText = "true";
                        }else respText = "false";
                    }else {
                        respText = "invalid Country";
                    }
                }catch(Exception e){
                    respText = "false";
                }
            }
        }else{
            respText = "signin";
        }

        resp.getWriter().write(respText);
    }
}
