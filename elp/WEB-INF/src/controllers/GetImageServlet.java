package controllers;

import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import models.Course;
import models.Trainer;
import models.User;

@WebServlet("/get_image.do")
public class GetImageServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        // System.out.println("Enter...");
        Integer courseId = Integer.parseInt(req.getParameter("course"));
        String type = req.getParameter("type");
        String img = req.getParameter("img");
        // System.out.println(type + ", " + img + ", " + courseId);

        if (type != null) {
            if (type.equals("thumbnail") && courseId != null && img != null) {
                ServletContext context = getServletContext();
                OutputStream os = resp.getOutputStream();
                InputStream is = null;

                if(img.equals("www_lernify_thumb_com.png")){
                    is = context.getResourceAsStream("static/media/images/course/thumbnail.png");
                }else {
                    Integer trainerId = Course.getTrainerId(courseId);
                    if(trainerId != null){
                        Integer userId = Trainer.getUserId(trainerId);
                        String email = User.getEmail(userId);
                        // System.out.println(userId)
                        is = context.getResourceAsStream("WEB-INF/uploads/" + email + "/lt_" + trainerId + "/lc_" + courseId + "/" + img);
                    }
                }


                byte[] arr = new byte[256];

                while (is.read(arr) != -1) {
                    os.write(arr);
                }

                os.flush();
                os.close();
            }
        }
    }
}