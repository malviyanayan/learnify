package models;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import utils.Database;

public class CourseTopic implements Comparable<CourseTopic>{
    private Integer courseTopicId;
    private String topicName;
    private Course course;
    private Boolean preview;
    private Integer video;
    private Integer totalHours;

    // ####### Methods #############
    public void fetchTopic() {
        Connection con = Database.getConnection();
        try {
            String query = "SELECT * FROM course_topics WHERE course_topic_id = ?";
            PreparedStatement ps = con.prepareStatement(query);
            ps.setInt(1, this.courseTopicId);

            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                this.topicName = rs.getString("topic_name");
                this.course = new Course();
                this.course.setCourseId(rs.getInt("course_id"));
                this.preview = rs.getBoolean("preview");
                this.video = rs.getInt("videos");
                this.totalHours = rs.getInt("total_hours");
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            try {
                con.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }

    public boolean subTopicExists(int subTopicId) {
        boolean flag = false;
        Connection con = Database.getConnection();
        try {
            String query = "SELECT sub_topic_id FROM sub_topics WHERE course_topic_id = ? and sub_topic_id = ?";
            PreparedStatement ps = con.prepareStatement(query);
            ps.setInt(1, this.courseTopicId);
            ps.setInt(2, subTopicId);

            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                flag = true;
            }

        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            try {
                con.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        return flag;
    }


    @Override
    public int compareTo(CourseTopic other) {
        return this.courseTopicId.compareTo(other.courseTopicId);
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        CourseTopic that = (CourseTopic) o;

        return courseTopicId.equals(that.courseTopicId);
    }

    @Override
    public int hashCode() {
        return courseTopicId.hashCode();
    }

    
    public ArrayList<SubTopic> getSubTopics(){
        ArrayList<SubTopic> list = new ArrayList<>();
        Connection con = Database.getConnection();
        try{
            String query = "select * from sub_topics where course_topic_id = ?";
            PreparedStatement ps = con.prepareStatement(query);
            ps.setInt(1, courseTopicId);

            ResultSet rs = ps.executeQuery();
            while(rs.next()){
                SubTopic subTopic = new SubTopic(rs.getInt("sub_topic_id"), this, rs.getString("title"), rs.getBoolean("preview"), rs.getString("video"), rs.getInt("duration"));
                list.add(subTopic);
            }
        }catch(SQLException e){
            e.printStackTrace();
        }

        try{con.close();}catch(SQLException e){e.printStackTrace();}

        return list;
    }
    
    public boolean createTopic(){
        boolean flag = false;
        Connection con = Database.getConnection();
        try{
            String query = "insert into course_topics (topic_name,course_id) value (?, ?);";
            PreparedStatement ps = con.prepareStatement(query);
            ps.setString(1, topicName);
            ps.setInt(2, course.getCourseId());

            if(ps.executeUpdate() != 0)flag = true;
            
        }catch(SQLException e){
            e.printStackTrace();
        }

        try{con.close();}catch(SQLException e){e.printStackTrace();}

        return flag;
    }

    // #### Constructors ######
    public CourseTopic(Integer courseTopicId){
        this.courseTopicId = courseTopicId;
    }

    public CourseTopic(String name, Integer Id){
        this.topicName = name;
        course = new Course();
        course.setCourseId(Id);
    }

    

    public CourseTopic(Integer courseTopicId, String topicName, Course course, Boolean preview, Integer video,
            Integer totalHours) {
        this.courseTopicId = courseTopicId;
        this.topicName = topicName;
        this.course = course;
        this.preview = preview;
        this.video = video;
        this.totalHours = totalHours;
    }

    // #### Getters and Setters ######
    public Integer getCourseTopicId() {
        return courseTopicId;
    }

    public void setCourseTopicId(Integer courseTopicId) {
        this.courseTopicId = courseTopicId;
    }

    public String getTopicName() {
        return topicName;
    }

    public void setTopicName(String topicName) {
        this.topicName = topicName;
    }

    public Course getCourse() {
        return course;
    }

    public void setCourse(Course course) {
        this.course = course;
    }

    public Boolean getPreview() {
        return preview;
    }

    public void setPreview(Boolean preview) {
        this.preview = preview;
    }

    public Integer getVideo() {
        return video;
    }

    public void setVideo(Integer video) {
        this.video = video;
    }

    public Integer getTotalHours() {
        return totalHours;
    }

    public void setTotalHours(Integer totalHours) {
        this.totalHours = totalHours;
    }


    
}