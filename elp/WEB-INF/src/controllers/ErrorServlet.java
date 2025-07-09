package controllers;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/error.do")
public class ErrorServlet extends HttpServlet {
  public void doGet(HttpServletRequest request, HttpServletResponse response)throws ServletException,IOException {
    response.setContentType("text/html");
    response.setStatus(HttpServletResponse.SC_NOT_FOUND);
    PrintWriter out = response.getWriter();
    out.println("<html><head><title>404 Not Found</title></head>");
    out.println("<body><h1>404 Not Found</h1></body></html>");
  }
    
}
