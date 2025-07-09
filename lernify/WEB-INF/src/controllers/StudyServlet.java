package controllers;

import java.io.IOException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.TreeMap;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import models.Course;
import models.CourseTopic;
import models.History;
import models.MyCourse;
import models.SubTopic;
import models.User;

@WebServlet("/study.do")
public class StudyServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession();
        User user = (User) session.getAttribute("user");
        String nextPage = "index.do";

        
        if (user != null) {
            Integer courseId = null;
            Integer play = null;
            
            try {
                courseId = Integer.parseInt(req.getParameter("course"));
            } catch (NumberFormatException e) {
                e.printStackTrace();
            }

            try{
                play = Integer.parseInt(req.getParameter("current"));
            }catch(NumberFormatException e){
                play = null;
            }
            
            if (courseId != null) {
                // check karo mycourse me exist karta hai ya nhi aur validity hai ya nahi
                MyCourse myCourse = new MyCourse();
                myCourse.setUser(user);
                myCourse.setCourse(new Course(courseId));

                if (myCourse.exist()) {
                    myCourse.getCourse().fetchCourse();
                    TreeMap<CourseTopic, ArrayList<SubTopic>> playContent = myCourse.getCourse().getContent();
                    SubTopic playCurrent = null;
                    
                    Timestamp mycourTimestamp = myCourse.getValidityTile();
                    Timestamp currentTimestamp = new Timestamp(System.currentTimeMillis());
                    if (currentTimestamp.before(mycourTimestamp)) {
                        if (play != null) {
                            for (CourseTopic topic : playContent.keySet()) {
                                ArrayList<SubTopic> temp = playContent.get(topic);
                                boolean flag = false;
                                for (SubTopic temp1 : temp) {
                                    if (temp1.getSubTopicId() == play) {
                                        playCurrent = temp1;
                                        myCourse.setCurrentSubtopic(play);
                                        flag = true;
                                        break;
                                    }
                                }
                                
                                if (flag)
                                break;
                            }
                        } else {
                            if (myCourse.getCurrentSubtopic() != -1) {
                                for (CourseTopic topic : playContent.keySet()) {
                                    ArrayList<SubTopic> temp = playContent.get(topic);
                                    boolean flag = false;
                                    for (SubTopic temp1 : temp) {
                                        if (temp1.getSubTopicId() == myCourse.getCurrentSubtopic()) {
                                            playCurrent = temp1;
                                            flag = true;
                                            break;
                                        }
                                    }

                                    if (flag)
                                        break;
                                }
                            }
                        }

                        if (playCurrent == null) {
                            for (CourseTopic topic : playContent.keySet()) {
                                ArrayList<SubTopic> temp = playContent.get(topic);
                                boolean flag = false;
                                for (SubTopic temp1 : temp) {
                                    playCurrent = temp1;
                                    flag = true;
                                    break;

                                }

                                if (flag)
                                    break;
                            }
                        }

                        if(playCurrent != null){
                            History history = new History();
                            history.setUser(user);
                            history.setSubTopic(playCurrent);
                            history.addHistory();
                        }
                        
                        session.setAttribute("playCourse", myCourse);
                        session.setAttribute("playContent", playContent);
                        session.setAttribute("playCurrent", playCurrent);
                        nextPage = "WEB-INF/pages/study.jsp";
                    } else {
                        // Add your logic here if the course validity time has expired
                        resp.getWriter().write("<h1>Course Validity is Expired</h1><hr>");
                        resp.getWriter().write("<h3>Please Repurchase this Course if you want to study Continue...</h3>");
                        return;
                    }
                }else{
                    System.out.println("This Course Is not Exist...");
                }

            }
        }

        req.getRequestDispatcher(nextPage).forward(req, resp);

    }
}
