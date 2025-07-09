package models;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;

import utils.Database;
import java.util.ArrayList;
import java.util.HashSet;

import com.google.gson.Gson;
import com.google.gson.reflect.TypeToken;

public class MyCourse{
    private Integer myCourseId;
    private User user;
    private Course course;
    private Timestamp validityTile;
    private Integer completed;
    private String progress;
    private Integer currentSubtopic;

    private HashSet<Integer> progressArray;

    private static Gson gson = new Gson();
    
    // ########## Methods ###########
    public boolean isCompleted(int lectureId) {
        if (progressArray == null) {
            progressArray = gson.fromJson(progress, new TypeToken<HashSet<Integer>>() {}.getType());
        }

        return progressArray != null && progressArray.contains(lectureId);
    }
    
    

    @SuppressWarnings("unchecked")
    public boolean markCompleted(boolean mark,Integer lectureId){
        boolean flag = false;
        if(progressArray == null){
            progressArray = gson.fromJson(progress, HashSet.class);
        }

        if(mark){
            progressArray.add(lectureId);
        }else{
            progressArray.remove(lectureId);
        }

        progress = gson.toJson(progressArray);

        int totalLectures = course.getTotalLectures();
        int completed = 0;
        if(progressArray != null){
            completed = (progressArray.size() * 100)/totalLectures;
        }

        Connection con = Database.getConnection();
        try {
            String query = "UPDATE my_courses SET progress = ? , completed = ? WHERE my_course_id = ?";
            PreparedStatement pstmt = con.prepareStatement(query);
            pstmt.setString(1, this.progress);
            pstmt.setInt(2, completed);
            pstmt.setInt(3, this.myCourseId);

            int rowsAffected = pstmt.executeUpdate();
            if (rowsAffected > 0) {
                flag = true;
            }

            pstmt.close();
            con.close();
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            try { con.close(); } catch (SQLException e) { e.printStackTrace(); }
        }

        return flag;
    }

    
    public static ArrayList<MyCourse> fetch(User user) {
        ArrayList<MyCourse> courses = new ArrayList<>();
        Connection con = Database.getConnection();
        try {
            String query = "SELECT * FROM my_courses WHERE user_id = ?";
            PreparedStatement pstmt = con.prepareStatement(query);
            pstmt.setInt(1, user.getUserId());

            ResultSet rs = pstmt.executeQuery();
            while (rs.next()) {
                MyCourse myCourse = new MyCourse();
                myCourse.setMyCourseId(rs.getInt("my_course_id"));
                myCourse.setUser(user);
                myCourse.setCourse(new Course(rs.getInt("course_id"))); // Assuming Course has a constructor that accepts courseId
                myCourse.setValidityTile(rs.getTimestamp("validity_till"));
                myCourse.setCompleted(rs.getInt("completed"));
                myCourse.setProgress(rs.getString("progress"));
                myCourse.setCurrentSubtopic(rs.getInt("current_subtopic"));
                myCourse.course.fetchCourseData();
                courses.add(myCourse);
            }

            rs.close();
            pstmt.close();
            con.close();
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            try { con.close(); } catch (SQLException e) { e.printStackTrace(); }
        }

        return courses;
    }

    public boolean update(){
        boolean flag = false;
        Connection con = Database.getConnection();
        try {
            String query = "UPDATE my_courses SET user_id = ?, course_id = ?, validity_till = ?, completed = ?, progress = ?, current_subtopic = ? WHERE my_course_id = ?";
            PreparedStatement pstmt = con.prepareStatement(query);
            pstmt.setInt(1, this.user.getUserId());
            pstmt.setInt(2, this.course.getCourseId());
            pstmt.setTimestamp(3, this.validityTile);
            pstmt.setInt(4, this.completed);
            pstmt.setString(5, this.progress);
            pstmt.setInt(6, this.currentSubtopic);
            pstmt.setInt(7, this.myCourseId);

            int rowsAffected = pstmt.executeUpdate();
            if (rowsAffected > 0) {
                flag = true;
            }

            pstmt.close();
            con.close();
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            try { con.close(); } catch (SQLException e) { e.printStackTrace(); }
        }
        
        return flag;
    }


    public boolean exist() {
        boolean flag = false;
        Connection con = Database.getConnection();
        try {
            String query = "SELECT * FROM my_courses WHERE user_id = ? AND course_id = ?";
            PreparedStatement pstmt = con.prepareStatement(query);
            pstmt.setInt(1, this.user.getUserId());
            pstmt.setInt(2, this.course.getCourseId());
            
            ResultSet rs = pstmt.executeQuery();
            if (rs.next()) {
                this.myCourseId = rs.getInt("my_course_id");
                this.validityTile = rs.getTimestamp("validity_till");
                this.completed = rs.getInt("completed");
                this.progress = rs.getString("progress");
                this.currentSubtopic = rs.getInt("current_subtopic");
                flag = true;
            }
            
            rs.close();
            pstmt.close();
            con.close();
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            try { con.close(); } catch (SQLException e) { e.printStackTrace(); }
        }
        
        return flag;
    }
    
    public boolean save(){
        boolean flag = false;
        Connection con = Database.getConnection();
        try{
            String query = "INSERT INTO my_courses (user_id, course_id, validity_till, completed, progress) VALUES (?, ?, ?, ?, ?)";
            PreparedStatement pstmt = con.prepareStatement(query);
            pstmt.setInt(1, this.user.getUserId());
            pstmt.setInt(2, this.course.getCourseId());
            pstmt.setTimestamp(3, this.validityTile);
            pstmt.setFloat(4, this.completed);
            pstmt.setString(5, this.progress);

            int rowsAffected = pstmt.executeUpdate();
            if (rowsAffected > 0) {
                flag = true;
            }

            pstmt.close();
            con.close();
        }catch(SQLException e){
            e.printStackTrace();
        }finally{
            try{con.close();}catch(SQLException e){e.printStackTrace();}
        }

        return flag;
    }

    // ########## Constructor ###########
    

    // ########## Getters and Setters ###########
    public Integer getMyCourseId() {
        return myCourseId;
    }

    public void setMyCourseId(Integer myCourseId) {
        this.myCourseId = myCourseId;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public Course getCourse() {
        return course;
    }

    public void setCourse(Course course) {
        this.course = course;
    }

    public Timestamp getValidityTile() {
        return validityTile;
    }

    public void setValidityTile(Timestamp validityTile) {
        this.validityTile = validityTile;
    }

    public Integer getCompleted() {
        return completed;
    }

    public void setCompleted(Integer completed) {
        this.completed = completed;
    }

    public String getProgress() {
        return progress;
    }

    public void setProgress(String progress) {
        this.progress = progress;
    }


    public Integer getCurrentSubtopic() {
        return currentSubtopic;
    }


    public void setCurrentSubtopic(Integer currentSubtopic) {
        this.currentSubtopic = currentSubtopic;
        Connection con = Database.getConnection();
        try {
            String query = "UPDATE my_courses SET current_subtopic = ? WHERE my_course_id = ?";
            PreparedStatement pstmt = con.prepareStatement(query);
            pstmt.setInt(1, currentSubtopic);
            pstmt.setInt(2, this.myCourseId);

            pstmt.executeUpdate();

            pstmt.close();
            con.close();
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            try { con.close(); } catch (SQLException e) { e.printStackTrace(); }
        }
        this.currentSubtopic = currentSubtopic;
    }
    


    
}