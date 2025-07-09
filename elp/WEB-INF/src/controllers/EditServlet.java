package controllers;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import models.Course;
import models.SubTopic;
import models.Trainer;
import models.User;

@WebServlet("/edit_all.do")
public class EditServlet extends HttpServlet{
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String type = req.getParameter("type");
        String target = req.getParameter("target");
        
        String respText = "false";
        
        HttpSession session = req.getSession();
        User user = (User)session.getAttribute("user");
        Trainer trainer = (Trainer)session.getAttribute("trainer");
        
        

        if(user != null && trainer != null){
            if(target != null && type != null){
                if(type.equals("course")){
                    Integer courseId = null;
                    try {
                        courseId = Integer.parseInt(req.getParameter("course-id").strip());
                    } catch (NumberFormatException e) {
                        respText = "Invalid Course Id";
                    }
                    if(courseId != null){
                        if(target.equals("discount")){
                            Integer discount = null;
                            try {
                                discount = Integer.parseInt(req.getParameter("discount"));
                            } catch (NumberFormatException e) {
                                respText = "Invalid Discount";
                            }
                            if(discount != null){
                                if(Course.updateDiscount(courseId, discount)){
                                    respText = "true";
                                }else{
                                    respText = "Update Failed";
                                }
                            }else{
                                respText = "discount is null";
                            }
                        }else if(target.equals("certification")){
                            String certification = req.getParameter("certification");
                            if(certification != null){
                                if(Course.updateCertification(courseId,certification)){
                                    respText = "true";
                                }else{
                                    respText = "Not Updated";
                                }
                            }else{
                                respText = "certification text not found";
                            }
                        }else if(target.equals("price")){
                            Integer price = null;
                            try{
                                price = Integer.parseInt(req.getParameter("price").strip());
                            }catch(Exception e){
                                respText = "Invalid Price";
                            }
                            if(price != null){
                                if(Course.updatePrice(courseId,price)){
                                    Course.updateDiscount(courseId, 0);
                                    respText = "true";
                                }else{
                                    respText = "Not Updated";
                                }
                            }else{
                                respText = "Price not found";
                            }
                        }else if(target.equals("level")){
                            Integer levelId = null;
                            try{
                                levelId = Integer.parseInt(req.getParameter("level-id").strip());
                            }catch(Exception e){
                                respText = "Invalid or Not found";
                            }
                            if(levelId != null && (levelId>=1 || levelId <= 7)){
                                if(Course.updateLevel(courseId,levelId)){
                                    respText = "true";
                                }else{
                                    respText = "Not Updated";
                                }
                            }else{
                                respText = "level not found or Invalid";
                            }
                        }else if(target.equals("covered-topics")){
                            String topics = req.getParameter("topics").strip();
                            if(topics != null){
                                if(Course.updateTopics(courseId,topics)){
                                    respText = "true";
                                }else{
                                    respText = "Not Updated";
                                }
                            }else{
                                respText = "Invalid Topics or not found";
                            }
                        }else if(target.equals("description")){
                            String description = req.getParameter("description").strip();
                            if(description != null){
                                if(Course.updateDescription(courseId,description)){
                                    respText = "true";
                                }else{
                                    respText = "Not Updated";
                                }
                            }else{
                                respText = "Invalid description or not found";
                            }
                        }else if(target.equals("features")){
                            String features = req.getParameter("features");
                            if(features != null){
                                if(Course.updateFeatures(courseId,features)){
                                    respText = "true";
                                }else{
                                    respText = "Not Updated";
                                }
                            }else{
                                respText = "Invalid Feature Items or not found";
                            }
                        }else if(target.equals("learning-outcomes")){
                            String outcomes = req.getParameter("learning-outcomes");
                            if(outcomes != null){
                                if(Course.updateLearningOutcomes(courseId,outcomes)){
                                    respText = "true";
                                }else{
                                    respText = "Not Updated";
                                }
                            }else{
                                respText = "Invalid Learning Outcomes or not found";
                            }
                        }else if(target.equals("prerequisites")){
                            String prerequisites = req.getParameter("prerequisites");
                            if(prerequisites != null){
                                if(Course.updatePrerequisites(courseId,prerequisites)){
                                    respText = "true";
                                }else{
                                    respText = "Not Updated";
                                }
                            }else{
                                respText = "Invalid prerequisites or not found";
                            }
                        }else if(target.equals("validity")){
                            String duration = req.getParameter("duration").strip();
                            String unit = req.getParameter("unit").strip();
                            if(duration != null && unit != null){
                                if(Course.updateValidity(courseId,duration + " " + unit)){
                                    respText = "true";
                                }else{
                                    respText = "Not Updated";
                                }
                            }else{
                                respText = "Invalid validity or not found";
                            }
                        }else if(target.equals("refund-policy")){
                            String refundPolicy = req.getParameter("refund-policy").strip();
                            
                            if(refundPolicy != null){
                                if(Course.updateRefundPolicy(courseId,refundPolicy)){
                                    respText = "true";
                                }else{
                                    respText = "Not Updated";
                                }
                            }else{
                                respText = "Invalid Texts or not found";
                            }
                        }else if(target.equals("title")){
                            String courseName = req.getParameter("title").strip();

                            if(courseName != null){
                                if(Course.updateCourseName(courseId,courseName)){
                                    respText = "true";
                                }else{
                                    respText = "Not Updated";
                                }
                            }else{
                                respText = "Invalid course name or not found";
                            }
                        }
                    }else {
                        respText = "No Course Id";
                    }
                }else if(type.equals("subtopics")){
                    String to = req.getParameter("to");
                    Integer topicId = null;
                    Integer subtopicId = null;

                    SubTopic subtopic = null;

                    String[] temp = to.split(" ");
                    if(temp.length == 2){
                        try {
                            topicId = Integer.parseInt(temp[0]);
                            subtopicId = Integer.parseInt(temp[1]);
                        } catch (NumberFormatException e) {
                            respText = "Invalid Course Id or Subtopic Id";
                        }

                        if(topicId != null && subtopicId != null){

                            subtopic = new SubTopic(subtopicId);
                            if(target.equals("preview")){
                                Boolean preview = null;

                                try{
                                    preview = Boolean.parseBoolean(req.getParameter("set"));
                                }catch(Exception e){
                                    respText = "Invalid Preview";
                                }

                                if(preview != null){
                                    if(subtopic.updatePreview(preview)){
                                        subtopic.setPreview(preview);
                                        respText = "true";
                                    }else{
                                        respText = "Not Updated";
                                    }
                                }else{
                                    respText = "Invalid Preview";
                                }
                            }else{
                                respText = "Invalid Target";
                            }
                        }
                    }else{
                        respText = "Invalid Course Id or Subtopic Id";
                    }
                }
            }else{
                respText = "invalid params";
            }
        }else {
            respText = "login";
        }

        resp.getWriter().write(respText);
    }
}