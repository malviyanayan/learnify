package controllers;

import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
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
import models.MyCourse;
import models.SubTopic;
import models.Trainer;

@WebServlet("/get_video.do")
public class GetVideoServlet extends HttpServlet {

    
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String videoFor = req.getParameter("for");
        Integer lecture = null;
        Integer courseId = null;

        if (videoFor.equals("study")) {
            // verify user
            HttpSession session = req.getSession();
            MyCourse course = (MyCourse)session.getAttribute("playCourse");
            if(course == null){
                resp.sendRedirect("index.do");
                return;
            }else{
                try{
                    lecture = Integer.parseInt(req.getParameter("lecture").strip());
                }catch(NumberFormatException e){
                    e.printStackTrace();
                    resp.sendRedirect("index.do");
                    return;
                }

                if(lecture != null){

                    SubTopic sbt = null;

                    @SuppressWarnings("unchecked")
                    TreeMap<CourseTopic,ArrayList<SubTopic>> content = (TreeMap<CourseTopic,ArrayList<SubTopic>>)session.getAttribute("playContent");
                    for(CourseTopic topic : content.keySet()){
                        ArrayList<SubTopic> temp = content.get(topic);
                        boolean flag = false;

                        for(SubTopic temp1 : temp){
                            if(temp1.getSubTopicId() == lecture){
                                temp1.setTopic(topic);
                                sbt = temp1;
                                flag = true;
                                break;
                            }
                        }

                        if(flag)break;
                    }

                    if(sbt == null){
                        resp.sendRedirect("index.do");
                        return;
                    }else{
                        // continue .....
                        MyCourse myCourse = (MyCourse)session.getAttribute("playCourse");
                        String folderPath = myCourse.getCourse().getFolderPath();
                        String video = sbt.getVideo();
                        if (video != null && folderPath != null) {
                            InputStream inp = getServletContext()
                                    .getResourceAsStream("/WEB-INF/uploads/" + folderPath + "/" + video);

                            OutputStream op = resp.getOutputStream();

                            byte[] arr = new byte[4056];

                            while (inp.read(arr) != -1) {
                                op.write(arr);
                            }

                            op.flush();
                            op.close();
                        }
                    }
                }
                
            }

        } else {
            try {
                String[] temp = req.getParameter("lecture").split(" ");
                if (temp.length == 2) {
                    courseId = Integer.parseInt(temp[0]);
                    lecture = Integer.parseInt(temp[1]);
                }
            } catch (NumberFormatException e) {
                e.printStackTrace();
            }

            if (lecture != null && courseId != null && videoFor != null) {
                SubTopic subTopic = new SubTopic(lecture);
                Course course = new Course(courseId);
                subTopic.fetch();

                if (videoFor.equals("trainer")) {
                    Trainer trainer = (Trainer) req.getSession().getAttribute("trainer");

                    if (trainer != null) {
                        // yaha lecture ko validate karna hai

                        // continue .....
                        String folderPath = course.getFolderPath();
                        String video = subTopic.getVideo();
                        if (video != null && folderPath != null) {
                            InputStream inp = getServletContext()
                                    .getResourceAsStream("/WEB-INF/uploads/" + folderPath + "/" + video);

                            OutputStream op = resp.getOutputStream();

                            byte[] arr = new byte[4056];

                            while (inp.read(arr) != -1) {
                                op.write(arr);
                            }

                            op.flush();
                            op.close();
                        }
                    }
                } else if (videoFor.equals("preview")) {
                    // yaha lecture ko validate karna hai
                    if (subTopic.getPreview()) {
                        // continue .....

                        String folderPath = course.getFolderPath();
                        String video = subTopic.getVideo();

                        if (video != null && folderPath != null) {
                            InputStream inp = getServletContext()
                                    .getResourceAsStream("/WEB-INF/uploads/" + folderPath + "/" + video);

                            OutputStream op = resp.getOutputStream();

                            byte[] arr = new byte[4056];

                            while (inp.read(arr) != -1) {
                                op.write(arr);
                            }

                            op.flush();
                            op.close();
                        }
                    }

                }
            }

        }

    }
}
