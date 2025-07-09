package models;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.TreeSet;

import utils.Database;

public class History implements Comparable<History>{
    // yaha per user object subtopic object timestamp and history id hoga
    private User user;
    private SubTopic subTopic;
    private Timestamp timestamp;
    private int historyId;

    // ############# Methods #############
    public String getTimeDifference() {
        Timestamp currentTimestamp = new Timestamp(System.currentTimeMillis());
        long milliseconds = currentTimestamp.getTime() - this.timestamp.getTime();
        
        long seconds = milliseconds / 1000;
        long minutes = seconds / 60;
        long hours = minutes / 60;
        long days = hours / 24;
        long months = days / 30;
        long years = days / 365;

        if (years > 0) {
            return years + " years ago";
        } else if (months > 0) {
            return months + " months ago";
        } else if (days > 0) {
            return days + " days ago";
        } else if (hours > 0) {
            return hours + " hours ago";
        } else if (minutes > 0) {
            return minutes + " minutes ago";
        } else {
            return seconds + " seconds ago";
        }
    }

    @Override
    public int compareTo(History o) {
        return o.timestamp.compareTo(this.timestamp);
    }

    public static TreeSet<History> getHistoryByUser(User user) {
        TreeSet<History> historySet = new TreeSet<>();
        Connection con = Database.getConnection();
        
        try {
            String query = "SELECT * FROM history WHERE user_id = ?";
            PreparedStatement pstmt = con.prepareStatement(query);
            pstmt.setInt(1, user.getUserId());
            ResultSet rs = pstmt.executeQuery();
            
            while (rs.next()) {
                int historyId = rs.getInt("history_id");
                int subTopicId = rs.getInt("sub_topic_id");
                Timestamp timestamp = rs.getTimestamp("time");
                
                SubTopic subTopic = new SubTopic(subTopicId);
                subTopic.fetch();
                subTopic.getTopic().fetchTopic();
                subTopic.getTopic().getCourse().fetchCourse();
                History history = new History(user, subTopic, timestamp, historyId);
                historySet.add(history);
            }
            
            rs.close();
            pstmt.close();
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            try {
                con.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        
        return historySet;
    }

    
    public boolean addHistory() {
        boolean flag = false;
        Connection con = Database.getConnection();
        
        try {
            // Insert new history entry
            String query = "INSERT INTO history (user_id, sub_topic_id) VALUES (?, ?)";
            PreparedStatement pstmt = con.prepareStatement(query);
            pstmt.setInt(1, user.getUserId());
            pstmt.setInt(2, subTopic.getSubTopicId());
            int rowsAffected = pstmt.executeUpdate();
            if (rowsAffected > 0) {
                flag = true;
            }
            pstmt.close();
    
            // Ensure max 20 history entries: Delete the oldest if count > 20
            String deleteQuery = """
                DELETE FROM history 
                WHERE user_id = ? 
                AND history_id NOT IN (
                    SELECT history_id FROM (
                        SELECT history_id FROM history 
                        WHERE user_id = ? 
                        ORDER BY time DESC 
                        LIMIT 21
                    ) AS subquery
                )
            """;
            PreparedStatement deleteStmt = con.prepareStatement(deleteQuery);
            deleteStmt.setInt(1, user.getUserId());
            deleteStmt.setInt(2, user.getUserId());
            deleteStmt.executeUpdate();
            deleteStmt.close();
    
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

    

    // ############# Constructors #############
    public History(User user, SubTopic subTopic, Timestamp timestamp, int historyId){
        this.user = user;
        this.subTopic = subTopic;
        this.timestamp = timestamp;
        this.historyId = historyId;
    }

    public History(){

    }

    // ############# Getters and Setters #############
    
    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public SubTopic getSubTopic() {
        return subTopic;
    }

    public void setSubTopic(SubTopic subTopic) {
        this.subTopic = subTopic;
    }

    public int getHistoryId() {
        return historyId;
    }

    public void setHistoryId(int historyId) {
        this.historyId = historyId;
    }

    public Timestamp getTimestamp() {
        return timestamp;
    }

    public void setTimestamp(Timestamp timestamp) {
        this.timestamp = timestamp;
    }
}