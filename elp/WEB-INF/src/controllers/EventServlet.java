package controllers;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import models.CartItem;
import models.Course;
import models.MyCourse;
import models.SubTopic;
import models.User;
import models.WishList;

@WebServlet("/event.do")
public class EventServlet extends HttpServlet {

    @Override
    public void doPost(HttpServletRequest req, HttpServletResponse resp) throws IOException, ServletException {
        HttpSession session = req.getSession();
        User user = (User) session.getAttribute("user");

        String respText = "false";

        // "target=course&course-id=" + courseId + "&act-on=wishlist&task=add";
        if (user != null) {
            String target = req.getParameter("target").strip();
            if (target.equals("course")) {
                Integer courseId = null;
                try {
                    courseId = Integer.parseInt(req.getParameter("course-id").strip());
                } catch (NumberFormatException e) {
                    e.printStackTrace();
                }
                if (courseId != null) {
                    String actOn = req.getParameter("act-on").strip();
                    if (actOn.equals("wishlist")) {
                        String task = req.getParameter("task").strip();
                        if (task.equals("add")) {
                            WishList wish = new WishList(user, new Course(courseId));
                            if (!wish.exists()) {
                                if (wish.addWish()) {
                                    respText = "true";
                                    user.getWishlist().add(wish);
                                } else {
                                    respText = "not added";
                                }
                            } else {
                                respText = "already exist";
                            }
                        } else if (task.equals("remove")) {
                            WishList wish = new WishList(user, new Course(courseId));

                            if(wish.exists()){
                                if (wish.removeWish()) {
                                    user.getWishlist().remove(wish);
                                    respText = "true";
                                } else {
                                    respText = "not removed";
                                }
                            }else{
                                respText = "not exists";
                            }

                        } else {
                            respText = "Invalid Task";
                        }
                    }else if(actOn.equals("carts")){
                        String task = req.getParameter("task").strip();
                        CartItem cartItem = new CartItem(user.getDefaultCart(), new Course(courseId));

                        if (task.equals("add")) {
                            if(cartItem.add()){
                                respText = "true";
                            }else{
                                respText = "not added";
                            }
                        } else if (task.equals("remove")) {
                            if(cartItem.remove()){
                                respText = "true";
                            }else{
                                respText = "not removed";
                            }
                        } else {
                            respText = "Invalid Task";
                        }
                        
                    } else {
                        respText = "Invalid Act";
                    }
                } else {
                    respText = "Invalid Course Id";
                }
            }else if(target.equals("study")){
                Integer myCourseId = null;

                try{
                    myCourseId = Integer.parseInt(req.getParameter("course"));
                }catch(NumberFormatException e){
                    respText = "MyCourseId is null";
                }

                if(myCourseId != null){
                    Integer lectureId = null;

                    try{
                        lectureId = Integer.parseInt(req.getParameter("lecture"));
                    }catch(NumberFormatException e){
                        respText = "Lecture Id is Null";
                    }

                    if(lectureId != null){
                        Boolean mark = null;

                        try{
                            mark = Boolean.parseBoolean(req.getParameter("mark"));
                        }catch(Exception e){
                            respText = "Invalid Mark";
                        }

                        if(mark != null){
                            SubTopic lecture = (SubTopic)session.getAttribute("playCurrent");

                            if(lecture != null){
                                if(lecture.getSubTopicId() == lectureId){
                                    MyCourse myCourse = (MyCourse)session.getAttribute("playCourse");
                                    if(myCourse != null && myCourse.getMyCourseId() == myCourseId){
                                        if(myCourse.markCompleted(mark,lectureId)){
                                            respText = "true";
                                        }else{
                                            respText = "false";
                                        }
                                    }else{
                                        respText = "signin";
                                    }
                                }else{
                                    respText = "signin";
                                }
                            }else{
                                respText = "Lecture is Invalid";
                            }
                        }
                    }
                }
            } else {
                respText = "Invalid Target";
            }

        } else {
            respText = "signin";
        }

        resp.getWriter().write(respText);
    }
}