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
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import models.Course;
import models.Trainer;
import models.User;

@WebServlet("/update_file.do")
public class UpdateFileServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession();
        String respText = "false";

        User user = (User) session.getAttribute("user");
        if (user != null) {
            Trainer trainer = (Trainer) session.getAttribute("trainer");
            if (trainer != null) {

                // Multipart Request Check
                if (!ServletFileUpload.isMultipartContent(req)) {
                    resp.getWriter().write("invalid request");
                    return;
                }

                String target = null;
                Integer courseId = null;
                String actOn = null;
                String task = null;
                FileItem fileItem = null;

                try {
                    List<FileItem> fileItems = new ServletFileUpload(new DiskFileItemFactory()).parseRequest(req);

                    for (FileItem item : fileItems) {
                        if (item.isFormField()) {
                            // Handling form fields
                            String fieldName = item.getFieldName();
                            String fieldValue = item.getString();

                            switch (fieldName) {
                                case "target":
                                    target = fieldValue;
                                    break;
                                case "course-id":
                                    try {
                                        courseId = Integer.parseInt(fieldValue);
                                    } catch (NumberFormatException e) {
                                        respText = "invalid course id";
                                    }
                                    break;
                                case "act-on":
                                    actOn = fieldValue;
                                    break;
                                case "task":
                                    task = fieldValue;
                                    break;
                            }
                        } else {
                            // Handling file
                            if (item.getFieldName().equals("file"))
                                fileItem = item;
                        }
                    }

                } catch (FileUploadException e) {
                    e.printStackTrace();
                    respText = "error";
                }

                // Validating inputs
                if (target != null && courseId != null && actOn != null && task != null && fileItem != null) {
                    if (target.equals("course")) {
                        Course course = new Course(courseId);
                        if (actOn.equals("thumbnail")) {
                            if (task.equals("change")) {
                                if (fileItem != null) {
                                    // Validate MIME type (image)
                                    String contentType = fileItem.getContentType();
                                    if (contentType != null && contentType.startsWith("image/")) {

                                        // Extract valid file extension
                                        String extension = "unknown";
                                        if (contentType.contains("/")) {
                                            extension = contentType.split("/")[1].split("\\+")[0]; // Handle
                                                                                                   // 'image/svg+xml'
                                        }

                                        String oldThumbnail = course.getCourseThumbnail();
                                        String folderPath = course.getFolderPath();
                                        String courseDir = getServletContext().getRealPath("WEB-INF/uploads/" + folderPath);

                                        if (!oldThumbnail.equals("www_lernify_thumb_com.png")) {
                                            File oldFile = new File(courseDir, oldThumbnail);
                                            oldFile.delete();
                                        }

                                        String newThumbnail = null;
                                        if(oldThumbnail.equals("www_lernify_thumb_com.png")){
                                            newThumbnail = utils.Utility.generateHashCode() + "." + extension;
                                        }else{
                                            newThumbnail = oldThumbnail;
                                        }

                                        try {
                                            fileItem.write(new File(courseDir, newThumbnail));
                                            course.setCourseThumbnail(newThumbnail);
                                            respText = "true";
                                        } catch (Exception e) {
                                            e.printStackTrace();
                                        }
                                        // String fileName = Course.getTempName(courseId) + "." + extension;

                                        // if (course.changeThumbnail(fileName)) {
                                        //     respText = "true";

                                        //     // File saving path
                                        //     String path = getServletContext().getRealPath(
                                        //             "WEB-INF/uploads/" + user.getEmail() + "/lt_"
                                        //                     + trainer.getTrainerId() + "/lc_" + courseId);

                                        //     File dir = new File(path);

                                        //     File file = new File(dir, fileName);

                                        //     try {
                                        //         fileItem.write(file);
                                        //     } catch (Exception e) {
                                        //         e.printStackTrace();
                                        //         respText = "file upload failed";
                                        //     }
                                        // } else {
                                        //     respText = "not saved";
                                        // }
                                    } else {
                                        respText = "invalid file type";
                                    }
                                }
                            }
                        }else if(actOn.equals("pdf")){
                            if(task.equals("change")){
                                if(fileItem != null){
                                    // Validate MIME type (pdf)
                                    String contentType = fileItem.getContentType();
                                    if (contentType != null && contentType.equals("application/pdf")) {
                                        // Extract valid file extension

                                        String oldPdf = course.getCoursePdf();
                                        String folderPath = course.getFolderPath();
                                        String courseDir = getServletContext().getRealPath("WEB-INF/uploads/" + folderPath);
                                        if (!oldPdf.equals("pdf_9_9_9_9_no_pdf.pdf")) {
                                            File oldFile = new File(courseDir , oldPdf);
                                            oldFile.delete();
                                        }

                                        String newpdf = null;

                                        if(oldPdf.equals("pdf_9_9_9_9_no_pdf.pdf")){
                                            newpdf =  utils.Utility.generateHashCode() + ".pdf";
                                        }else{
                                            newpdf = oldPdf;
                                        }

                                        try{
                                            fileItem.write(new File(courseDir, newpdf));
                                            course.setCoursePdf(newpdf);
                                            respText = "true";
                                        }catch(Exception e){
                                            e.printStackTrace();
                                        }


                                    } else {
                                        respText = "invalid file type";
                                    }
                                }
                            }
                        }
                    }
                } else {
                    respText = "invalid arguments";
                }

            } else {
                respText = "no trainer";
            }
        } else {
            respText = "login";
        }

        resp.getWriter().write(respText);
    }

}