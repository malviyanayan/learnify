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

@WebServlet("/view_lecture.do")
public class ViewLectureServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String play = req.getParameter("play");
        String nextPage = "index.do";
        
        
        if (play != null) {
            
            String[] playSplit = play.split(" ");
            
            if (playSplit.length == 3) {
                
                Integer courseId = null, topicId = null, subTopicId = null;
                
                try {
                    courseId = Integer.parseInt(playSplit[0]);
                    topicId = Integer.parseInt(playSplit[1]);
                    subTopicId = Integer.parseInt(playSplit[2]);
                } catch (NumberFormatException e) {
                    nextPage = "error.do";
                    e.printStackTrace();
                }
                
                if (courseId != null && topicId != null && subTopicId != null) {
                    
                    Trainer trainer = (Trainer) req.getSession().getAttribute("trainer");
                    
                    if (trainer == null) {
                        nextPage = "error.do";
                        
                    } else {
                        
                        Course course = new Course(courseId);
                        course.setTrainer(trainer);
                        
                        CourseTopic topic = new CourseTopic(topicId);
                        topic.setCourse(course);
                        
                        
                        
                        if (trainer.courseExists(courseId) && course.topicExists(topicId) && topic.subTopicExists(subTopicId)) {
                            
                            
                            course.fetchCourse();
                            req.setAttribute("course", course);
                            TreeMap<CourseTopic,ArrayList<SubTopic>> content = course.getContent();
                            req.setAttribute("content",content);
                            
                            SubTopic current = new SubTopic(subTopicId);
                            current.fetch();

                            topic.fetchTopic();
                            current.setTopic(topic);
                            
                            req.setAttribute("current", current);
                            nextPage = "WEB-INF/pages/view_lecture.jsp";
                            
                        } else {
                            
                            nextPage = "error.do";
                        }
                    }
                } else {
                    
                    nextPage = "error.do";
                }
            } else {
                
                nextPage = "error.do";
            }
        }
        

        req.getRequestDispatcher(nextPage).forward(req, resp); 
    }
}
