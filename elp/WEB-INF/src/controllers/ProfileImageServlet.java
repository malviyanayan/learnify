package controllers;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import models.User;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;

import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;

@WebServlet("/profile_pic.do")
public class ProfileImageServlet extends HttpServlet {
    public void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        resp.setContentType("image/*");

        HttpSession session = req.getSession();
        User user = (User) session.getAttribute("user");

        if (user == null) {  
            resp.sendRedirect("getstarted.jsp");
        } else {
            OutputStream os = resp.getOutputStream();
            ServletContext context = getServletContext();
            String pic = user.getProfilePic();
            InputStream is = null;
            if (pic.contains("prof_pic_def_123.png")) {
                is = context.getResourceAsStream("static/media/images/user.jpg");
            }else{
                is = context.getResourceAsStream("WEB-INF/uploads/" + user.getEmail() + "/" + pic);
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