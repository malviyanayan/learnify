package controllers;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import models.Course;
import models.CourseTopic;
import models.Trainer;
import models.User;

@WebServlet("/set_upload_type.do")
public class SetUploadTypeServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        Integer type = Integer.parseInt(req.getParameter("type"));
        Integer courseId = Integer.parseInt(req.getParameter("course_id"));

        String respText = "false";

        User user = (User)req.getSession().getAttribute("user");
        Trainer trainer = (Trainer)req.getSession().getAttribute("trainer");
        if(user != null && trainer != null){
            if(courseId != null && type != null){
                if(Course.updateUploadType(courseId,type)){
                    if(type == 1){
                        String name = "lnf_dflt_99";
                        CourseTopic courseTopic = new CourseTopic(name,courseId);
                        courseTopic.createTopic();
                    }
                }
                respText = "true";
            }
        }else{
            respText = "login";
        }
        
        resp.getWriter().write(respText);
    }
}
