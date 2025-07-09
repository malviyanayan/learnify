package controllers;

import java.io.IOException;
import java.util.HashSet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import models.Course;

@WebServlet("/get_courses.do")
public class GetCoursesServlet extends HttpServlet{
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        // get_courses.do?type=popular&target=course&search="+searchText
        String type = req.getParameter("type");
        String search = req.getParameter("search");
        String target = "course";

        HashSet<Course> courses = new HashSet<>();

        if(target.equals("course")){
            if(type.equals("popular")){
                if(search == null){
                    if(type.equals("popular")){
                        courses = Course.getPopularCourses();
                    }
                }else{
                    // yadi search null nhi hai to
                    search = search.trim();
                    courses = Course.getPopularCourses(search);
                }
            }

            // for latest

            // top rated

        }else{

        }

        Gson gson = new Gson();
        String responce = gson.toJson(courses);

        resp.setContentType("application/json");
        resp.getWriter().write(responce);
    }
}