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

@WebServlet("/create_course.do")
public class CreateCourseServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        // First Check user and trainer is exists or not if not exists responde another
        // page or error
        HttpSession session = req.getSession();
        User user = (User) session.getAttribute("user");
        Trainer trainer = (Trainer) session.getAttribute("trainer");

        String respText = "false";
        // conditions for response
        // session expired (login)
        // Trainer not exist (reload)
        // if course name already exist (name_exist)
        // if course created (true)
        // if not multipart request (not multipart request)
        // if course not created (something went wrong) 
        //default false

        if (user != null) {
            if (trainer != null) {
                // Trainer and User both are exist
                Course course = new Course(trainer);
                course.setMandetoryDefaults();

                String validityTime = null;
                String validityType = null;

                FileItem thumbnail = null;
                FileItem pdf = null;

                if (ServletFileUpload.isMultipartContent(req)) {
                    try {
                        List<FileItem> items = new ServletFileUpload(new DiskFileItemFactory()).parseRequest(req);

                        for (FileItem item : items) {
                            if (item.isFormField()) {
                                String fieldName = item.getFieldName();
                                switch (fieldName) {
                                    case "course-name":
                                        course.setCourseName(item.getString());
                                        break;
                                
                                    case "description":
                                        course.setDescription(item.getString());
                                        break;
                                
                                    case "features":
                                        course.setKeyFeatures(item.getString());
                                        break;
                                
                                    case "topics":
                                        course.setCourseTopics(item.getString());
                                        break;
                                
                                    case "outcomes":
                                        course.setLearningOutcomes(item.getString());
                                        break;
                                
                                    case "prerequisites":
                                        course.setPrerequisites(item.getString());
                                        break;
                                
                                    case "certification":
                                        course.setCertification(item.getString());
                                        break;

                                    case "refund-policy":
                                        course.setRefundPolicy(item.getString());
                                        break;
                                
                                    case "level":
                                        course.setLevel(Integer.parseInt(item.getString()));
                                        break;
                                
                                    case "time":
                                        validityTime = item.getString();
                                        break;
                                
                                    case "time-type":
                                        validityType = item.getString();
                                        break;
                                
                                    case "price":
                                        try{
                                            course.setPrice(Integer.parseInt(item.getString()));
                                        }catch(Exception e){
                                            course.setPrice(0);
                                            System.out.println("Price set Null");
                                        }
                                        break;
                                
                                    default:
                                        break;
                                }
                            } else {
                                String file = item.getFieldName();
                                
                                switch (file) {
                                    case "thumbnail":
                                        thumbnail = item;
                                        break;
                                
                                    case "pdf":
                                        pdf = item;
                                        break;
                                
                                    default:
                                        break;
                                }
                            }
                        }

                        // check course name is already exist or not
                        if (course.isCourseNameExist()) {
                            respText = "name_exist";
                        } else {
                            if(validityTime != null && validityType != null) {
                                course.setValidity(validityTime + " " + validityType);
                            }

                            // ------------------------------------
                            // ------------------------------------
                            // if course name not exist then create course
                            // course.printAll();
                            if(thumbnail != null) {
                                course.setThumbnail(thumbnail.getName());
                            }

                            String newPdfName = utils.Utility.generateHashCode() + ".pdf";

                            if(pdf != null) {
                                String ctType = pdf.getContentType();
                                if(ctType.equals("application/pdf")) {
                                    course.setPdf(newPdfName);
                                }
                            }

                            if (course.createCourse()) {
                                // course created successfully
                                // now upload thumbnail and pdf
                                String path = getServletContext().getRealPath("/WEB-INF/uploads/" + user.getEmail() + "/" + "lt_" + trainer.getTrainerId());
                                File file = new File(path,"lc_" + course.getCourseId());
                                file.mkdirs();

                                if(thumbnail != null){
                                    try{
                                        thumbnail.write(new File(file, thumbnail.getName()));
                                    }catch(Exception e){
                                        e.printStackTrace();
                                    } 
                                }

                                if(pdf != null){
                                    try{
                                        pdf.write(new File(file, newPdfName));
                                    }catch(Exception e){
                                        e.printStackTrace();
                                    } 
                                }

                                respText = "true";
                            } else {
                                // course not created
                                respText = "SomeThing went wrong";
                            }

                            // ------------------------------------
                            // ------------------------------------

                        }

                    } catch (FileUploadException e) {
                        e.printStackTrace();
                    }
                } else {
                    System.out.println("Not a multipart request");
                }

            } else {
                respText = "reload";
            }
        } else {
            respText = "login";
        }

        resp.getWriter().write(respText);

    }
}
