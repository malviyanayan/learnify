package controllers;

import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import models.Course;

@WebServlet("/get_pdf.do")
public class GetPdfServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        Integer courseId;

        try {
            courseId = Integer.parseInt(req.getParameter("course-id"));
        } catch (NumberFormatException e) {
            resp.sendError(HttpServletResponse.SC_BAD_REQUEST, "Invalid Course ID");
            return;
        }

        Course course = new Course(courseId);
        String folderPath = course.getFolderPath();
        String pdf = course.getCoursePdf();

        if (pdf != null && !pdf.equals("pdf_9_9_9_9_no_pdf.pdf") && folderPath != null) {
            InputStream input = getServletContext().getResourceAsStream("WEB-INF/uploads/" + folderPath + "/" + pdf);

            if (input != null) {
                // Set response headers
                resp.setContentType("application/pdf");
                resp.setHeader("Content-Disposition", "inline; filename=\"" + pdf + "\"");

                OutputStream os = resp.getOutputStream();
                byte[] buffer = new byte[4096];
                int bytesRead;

                while ((bytesRead = input.read(buffer)) != -1) {
                    os.write(buffer, 0, bytesRead);
                }

                os.flush();
                input.close();
                os.close();
            } else {
                resp.sendError(HttpServletResponse.SC_NOT_FOUND, "PDF file not found");
            }
        } else {
            resp.sendError(HttpServletResponse.SC_NOT_FOUND, "PDF not available for this course");
        }
    }
}
