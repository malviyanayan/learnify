package controllers;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;

import java.io.File;
import java.io.IOException;
import java.util.Iterator;
import java.util.List;

import org.apache.commons.fileupload.servlet.ServletFileUpload;

import models.User;

import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUploadException;

@WebServlet("/upload_profile_pic.do")
public class UpdateProfilePicServlet extends HttpServlet {
    public void doPost(HttpServletRequest req, HttpServletResponse resp) throws IOException, ServletException {

        User user = (User) req.getSession().getAttribute("user");
        String respText = "false";

        if (user != null) {
            if (ServletFileUpload.isMultipartContent(req)) {
                DiskFileItemFactory dfif = new DiskFileItemFactory();
                ServletFileUpload sfu = new ServletFileUpload(dfif);

                try {
                    List<FileItem> fileitems = sfu.parseRequest(req);

                    Iterator<FileItem> iterator = fileitems.iterator();

                    String uploadPath = getServletContext().getRealPath("/WEB-INF/uploads/" + user.getEmail());
                    if (iterator.hasNext()) {
                        FileItem item = iterator.next();


                        String clientFileName = item.getName();
                        if(user.updateProfilePic(clientFileName)){
                            String currentPic = user.getProfilePic();
                            if(!currentPic.equals("prof_pic_def_123.png")){
                                File file1 = new File(uploadPath,currentPic);
                                file1.delete();
                            }
                            user.setProfilePic(clientFileName);
                            File file = new File(uploadPath, clientFileName);
                            item.write(file);
                            respText = "true";
                        }
                    }
                } catch (FileUploadException e) {
                    e.printStackTrace();
                } catch (Exception e) {
                    e.printStackTrace();
                }

            }

        } else {
            respText = "signin";
        }


        resp.getWriter().write(respText);
    }
}