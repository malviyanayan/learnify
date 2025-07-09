package controllers;

import java.io.File;
import java.io.IOException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import models.Course;
import models.SubTopic;
import models.Trainer;
import models.User;

@WebServlet("/upload-lecture.do")
public class UploadLectureServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        Integer courseId = null;
        Integer topicId = null;
        Integer duration = null;
        String fileName = null;
        String title = null;
        FileItem uploadedFile = null;

        if (!ServletFileUpload.isMultipartContent(req)) {
            resp.sendError(HttpServletResponse.SC_BAD_REQUEST, "Content type must be multipart/form-data");
            return;
        }

        String respText = "false";

        HttpSession session = req.getSession();
        User user = (User) session.getAttribute("user");
        Trainer trainer = (Trainer) session.getAttribute("trainer");

        if (user != null && trainer != null) {
            DiskFileItemFactory factory = new DiskFileItemFactory();
            ServletFileUpload upload = new ServletFileUpload(factory);

            try {
                List<FileItem> items = upload.parseRequest(req);
                for (FileItem item : items) {
                    if (item.isFormField()) {
                        String fieldName = item.getFieldName();
                        switch (fieldName) {
                            case "topic-id":
                                topicId = Integer.parseInt(item.getString());
                                break;
                            case "course-id":
                                courseId = Integer.parseInt(item.getString());
                                break;
                            case "duration":
                                duration = (int) (Float.parseFloat(item.getString()));
                                break;
                            case "title":
                                title = item.getString();
                                break;
                        }
                    } else { 
                        fileName = item.getName();
                        uploadedFile = item;
                    }
                }

                if (uploadedFile != null && fileName != null) {
                    String uploadDir = getServletContext().getRealPath("/WEB-INF/uploads/" + user.getEmail() + "/lt_" + trainer.getTrainerId() + "/lc_" + courseId);
                    String tempName = "a"+Course.getTempName(courseId)+".mp4";
                    uploadedFile.write(new File(uploadDir,tempName));
                    SubTopic subtopic = new SubTopic(topicId, title, tempName, duration);
                    if(subtopic.save()){
                        respText = "true";
                    }else{
                        respText = "Not Saved...";
                    }
                }

            } catch (Exception e) {
                e.printStackTrace();
                respText = "Upload failed!";
            }
        } else {
            respText = "login";
        }

        resp.getWriter().write(respText);
    }
}
