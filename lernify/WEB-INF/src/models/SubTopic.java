package models;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import utils.Database;

public class SubTopic {
    private Integer subTopicId;
    private CourseTopic topic;
    private String title;
    private Boolean preview;
    private String video;
    private Integer duration; // in seconds

    // ########### Upload Lecture ###########
    public boolean updatePreview(Boolean preview) {
        boolean flag = false;
        Connection con = Database.getConnection();
        try {
            String query = "UPDATE sub_topics SET preview = ? WHERE sub_topic_id = ?";
            PreparedStatement ps = con.prepareStatement(query);
            ps.setBoolean(1, preview);
            ps.setInt(2, subTopicId);
            if (ps.executeUpdate() != 0) {
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


    public boolean fetch(){
        boolean flag = false;

        Connection con = Database.getConnection();
        try {
            String query = "SELECT * FROM sub_topics WHERE sub_topic_id = ?";
            PreparedStatement ps = con.prepareStatement(query);
            ps.setInt(1, subTopicId);
            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                this.topic = new CourseTopic(rs.getInt("course_topic_id"));
                this.title = rs.getString("title");
                this.preview = rs.getBoolean("preview");
                this.video = rs.getString("video");
                this.duration = rs.getInt("duration");
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
    
    public String formattedTime() {
        int hours = duration / 3600;
        int minutes = (duration % 3600) / 60;
        int sec = duration % 60;
    
        if (hours > 0) {
            return String.format("%02d:%02d:%02d", hours, minutes, sec);
        } else {
            return String.format("%02d:%02d", minutes, sec);
        }
    }
    

    public boolean save(){
        boolean flag = false;

        Connection con = Database.getConnection();
        try{
            String query = "insert into sub_topics (course_topic_id,title,video,duration) value (?, ?, ?, ?)";
            PreparedStatement ps = con.prepareStatement(query);
            ps.setInt(1, topic.getCourseTopicId());
            ps.setString(2, title);
            ps.setString(3, video);
            ps.setInt(4,duration);

            if(ps.executeUpdate() != 0)flag = true;
        }catch(SQLException e){
            e.printStackTrace();
        }

        try{con.close();}catch(SQLException e){e.printStackTrace();}

        return flag;
    }

    // ########## Constructors ############
    public SubTopic(Integer topicId,String title,String video,Integer duration){
        this.topic = new CourseTopic(topicId);
        this.title = title;
        this.video = video;
        this.duration = duration;
    }

    

    public SubTopic(Integer subTopicId, CourseTopic topic, String title, Boolean preview, String video,
            Integer duration) {
        this.subTopicId = subTopicId;
        this.topic = topic;
        this.title = title;
        this.preview = preview;
        this.video = video;
        this.duration = duration;
    }

    public SubTopic(){
        
    }

    public SubTopic(Integer subTopicId){
        this.subTopicId = subTopicId;
    }

    // ##### Getters and Setters ######
    public Integer getSubTopicId() {
        return subTopicId;
    }

    public void setSubTopicId(Integer subTopicId) {
        this.subTopicId = subTopicId;
    }

    public CourseTopic getTopic() {
        return topic;
    }

    public void setTopic(CourseTopic topic) {
        this.topic = topic;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public Boolean getPreview() {
        return preview;
    }

    public void setPreview(Boolean preview) {
        this.preview = preview;
    }

    public String getVideo() {
        return video;
    }

    public void setVideo(String video) {
        this.video = video;
    }

    public Integer getDuration() {
        return duration;
    }

    public void setDuration(Integer duration) {
        this.duration = duration;
    }

}
