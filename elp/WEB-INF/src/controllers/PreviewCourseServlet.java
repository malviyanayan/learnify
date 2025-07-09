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

@WebServlet("/preview_course.do")
public class PreviewCourseServlet extends HttpServlet{
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        // course  id bas chahiye preview ke liye
        // yaha courseid lunga aur usko preview.jsp page forword ker dunga

        // verify kanre ki jarurat nhi hai bas course hai ya nhi ye dekhna padega

        String next = "index.do";
        Integer courseId = null;
        String topic = req.getParameter("subtopic");
        Integer topicId = null;

        try {
            courseId = Integer.parseInt(req.getParameter("course_id"));
        } catch (NumberFormatException e) {
            System.out.println("Course id not found");
        }  

        if(courseId != null){
            Course course = new Course(courseId);
            if(course.fetchCourse()){
                TreeMap<CourseTopic,ArrayList<SubTopic>> content = course.getContent();
                req.setAttribute("content", content);
                req.setAttribute("course", course);

                boolean flag = true;
                SubTopic current = null;

                if(topic != null && topic.equals("start")){
                    current = null;
                        if (content.firstEntry() != null && !content.firstEntry().getValue().isEmpty()) {
                            current = content.firstEntry().getValue().get(0);
                        }
                }else{
                    try{
                        topicId = Integer.parseInt(topic);
                    }catch(NumberFormatException e){
                        flag = false;
                    }

                    if(topicId != null){
                        for(CourseTopic ct : content.keySet()){
                            for(SubTopic st : content.get(ct)){
                                if(st.getSubTopicId() == topicId){
                                    current = st;
                                    break;
                                }
                            }
                        }
                    }
                }

                req.setAttribute("current", current);
                System.out.println("Current: "+current);
                
                if(flag){
                    next = "WEB-INF/pages/preview_course.jsp";
                }else{
                    next = "index.do";
                }
            }else{
                System.out.println("Course not found");
            }
        }

        req.getRequestDispatcher(next).forward(req, resp);

    }
}
