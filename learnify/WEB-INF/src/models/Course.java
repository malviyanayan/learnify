package models;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.TreeMap;

import com.google.gson.Gson;

import utils.Database;

public class Course {
    private Integer courseId;
    private Trainer trainer;
    private String courseName;
    private String thumbnail;
    private String learningOutcomes;
    private String description;
    private String courseTopics;
    private String keyFeatures;
    private String pdf;
    private String certification;
    private String prerequisites;
    private String validity;
    private String refundPolicy;
    private Integer price;
    private Integer discount;
    private Integer subscribers;
    private Integer totalClicks;
    private Integer starRank;
    private Status status;
    private Integer totalVideos;
    private Integer totalHours;
    private CourseLevel level;
    private Integer uploadType;

    private static Gson gson = new Gson();

    

    // ############### Methods ###############
    public boolean clickCourse() {
        boolean flag = false;
        Connection con = Database.getConnection();
        try {
            String query = "UPDATE courses SET total_clicks = total_clicks + 1 WHERE course_id = ?";
            PreparedStatement ps = con.prepareStatement(query);
            ps.setInt(1, this.courseId);

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

    public int getTotalLectures() {
        int totalLectures = 0;
        Connection con = Database.getConnection();
        try {
            String query = "SELECT COUNT(*) AS total_lectures " +
                           "FROM sub_topics st " +
                           "INNER JOIN course_topics ct ON st.course_topic_id = ct.course_topic_id " +
                           "WHERE ct.course_id = ?";
            PreparedStatement ps = con.prepareStatement(query);
            ps.setInt(1, this.courseId);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                totalLectures = rs.getInt("total_lectures");
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
        return totalLectures;
    }


    public boolean topicExists(int topicId) {
        boolean flag = false;
        Connection con = Database.getConnection();
        try {
            String query = "SELECT course_id FROM course_topics WHERE course_topic_id = ? and course_id = ?";
            PreparedStatement ps = con.prepareStatement(query);
            ps.setInt(1, topicId);
            ps.setInt(2, this.courseId);

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



    public boolean setCourseThumbnail(String newThumbnail) {
        boolean flag = false;
        Connection con = Database.getConnection();
        try {
            String query = "UPDATE courses SET thumbnail = ? WHERE course_id = ?";
            PreparedStatement ps = con.prepareStatement(query);
            ps.setString(1, newThumbnail);
            ps.setInt(2, this.courseId);

            if (ps.executeUpdate() != 0) {
                this.thumbnail = newThumbnail;
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

    public String getCourseThumbnail() {
        String thumbnail = null;

        Connection con = Database.getConnection();
        try {
            String query = "SELECT thumbnail FROM courses WHERE course_id = ?";
            PreparedStatement ps = con.prepareStatement(query);
            ps.setInt(1, this.courseId);

            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                thumbnail = rs.getString("thumbnail");
                this.thumbnail = thumbnail;
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

        return thumbnail;
    }

    public boolean setCoursePdf(String pdf) {
        boolean flag = false;

        Connection con = Database.getConnection();
        try {
            String query = "UPDATE courses SET pdf = ? WHERE course_id = ?";
            PreparedStatement ps = con.prepareStatement(query);
            ps.setString(1, pdf);
            ps.setInt(2, this.courseId);

            if (ps.executeUpdate() != 0) {
                this.pdf = pdf;
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

    public String getCoursePdf(){
        String pdf = null;

        Connection con = Database.getConnection();
        try{
            String query = "select pdf from courses where course_id = ?";
            PreparedStatement ps = con.prepareStatement(query);
            ps.setInt(1, courseId);

            ResultSet rs = ps.executeQuery();
            if(rs.next()){
                pdf = rs.getString("pdf");
                this.pdf = pdf;
            }

        }catch(SQLException e){
            e.printStackTrace();
        }finally{
            try{con.close();}catch(SQLException e){e.printStackTrace();}
        }

        return pdf;
    }

    public String getFolderPath(){
        String path = null;

        if(courseId == null)return null;

        Connection con = Database.getConnection();
        try{
            String q1 = "select trainer_id from courses where course_id = ?;";
            PreparedStatement ps1 = con.prepareStatement(q1);
            ps1.setInt(1, courseId);

            ResultSet r1 = ps1.executeQuery();
            
            if(r1.next()){
                Integer trainerId = r1.getInt("trainer_id");
                if(trainerId != null){
                    Integer userId = Trainer.getUserId(trainerId);
                    if(userId != null){
                        String email = User.getEmail(userId);
                        path = email + "/lt_" + trainerId + "/lc_" + courseId;
                    }
                }
            }
        }catch(SQLException e){
            e.printStackTrace();
        }finally{
            try{con.close();}catch(SQLException e){e.printStackTrace();}
        }

        return path;
    }

    public boolean changeThumbnail(String newThumbnail) {
        boolean flag = false;
        Connection con = Database.getConnection();
        try {
            String query = "UPDATE courses SET thumbnail = ? WHERE course_id = ?";
            PreparedStatement ps = con.prepareStatement(query);
            ps.setString(1, newThumbnail);
            ps.setInt(2, this.courseId);

            if (ps.executeUpdate() != 0) {
                this.thumbnail = newThumbnail;
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
    
    public static Integer getTrainerId(Integer courseId) {
        Integer trainerId = null;
        Connection con = Database.getConnection();
        try {
            String query = "SELECT trainer_id FROM courses WHERE course_id = ?";
            PreparedStatement ps = con.prepareStatement(query);
            ps.setInt(1, courseId);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                trainerId = rs.getInt("trainer_id");
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
        return trainerId;
    }

    public static HashSet<Course> getPopularCourses(String search){
        HashSet<Course> courses = new HashSet<>();
        Connection con = Database.getConnection();

        try {
            String query = "SELECT " +
               "c.course_id,c.validity, " +
               "c.course_name, " +
               "c.thumbnail, " +
               "c.price, " +
               "c.discount, " +
               "c.star_rank, " +
               "c.total_hours, " +
               "c.total_clicks, " +
               "t.trainer_id, " +
               "t.trainer_name, " +
               "s.status_id, " +
               "s.name AS status_name " +
               "FROM courses c " +
               "INNER JOIN trainers t ON c.trainer_id = t.trainer_id " +
               "INNER JOIN status s ON c.status_id = s.status_id " +
               "WHERE (c.status_id IN (10, 13)) " +
               "AND (c.course_name LIKE '%" + search + "%' OR c.description LIKE '%" + search + "%') " +
               "ORDER BY c.star_rank DESC, c.total_clicks DESC " +
               "LIMIT 40";

            PreparedStatement ps = con.prepareStatement(query);

            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Course course = new Course(rs.getInt("course_id"));
                course.setCourseName(rs.getString("course_name"));
                course.setThumbnail(rs.getString("thumbnail"));
                course.setPrice(rs.getInt("price"));
                course.setDiscount(rs.getInt("discount"));
                course.setStarRank(rs.getInt("star_rank"));
                course.setTotalHours(rs.getInt("total_hours"));
                course.setTotalClicks(rs.getInt("total_clicks"));
                course.setValidity(rs.getNString("validity"));
                Trainer trainer = new Trainer();
                trainer.setTrainerId(rs.getInt("trainer_id"));
                trainer.setTrainerName(rs.getString("trainer_name"));
                course.setTrainer(trainer);
                Status status = new Status(rs.getInt("status_id"), rs.getString("status_name"));
                course.setStatus(status);
                courses.add(course);
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
        return courses;
    }

    public static HashSet<Course> getPopularCourses() {
        HashSet<Course> courses = new HashSet<>();
        Connection con = Database.getConnection();
        try {
            String query = "SELECT " +
                           "c.course_id,c.validity," +
                           "c.course_name, " +
                           "c.thumbnail, " +
                           "c.price, " +
                           "c.discount, " +
                           "c.star_rank, " +
                           "c.total_hours, " +
                           "c.total_clicks, " +
                           "t.trainer_id, " +
                           "t.trainer_name, " +
                           "s.status_id, " +
                           "s.name AS status_name " +
                           "FROM courses c " +
                           "INNER JOIN trainers t ON c.trainer_id = t.trainer_id " +
                           "INNER JOIN status s ON c.status_id = s.status_id " +
                           "WHERE c.status_id IN (10, 13) " +
                           "ORDER BY c.star_rank DESC, c.total_clicks DESC " +
                           "LIMIT 40";
            PreparedStatement ps = con.prepareStatement(query);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Course course = new Course(rs.getInt("course_id"));
                course.setCourseName(rs.getString("course_name"));
                course.setThumbnail(rs.getString("thumbnail"));
                course.setPrice(rs.getInt("price"));
                course.setDiscount(rs.getInt("discount"));
                course.setStarRank(rs.getInt("star_rank"));
                course.setTotalHours(rs.getInt("total_hours"));
                course.setValidity(rs.getNString("validity"));
                course.setTotalClicks(rs.getInt("total_clicks"));
                Trainer trainer = new Trainer();
                trainer.setTrainerId(rs.getInt("trainer_id"));
                trainer.setTrainerName(rs.getString("trainer_name"));
                course.setTrainer(trainer);
                Status status = new Status(rs.getInt("status_id"), rs.getString("status_name"));
                course.setStatus(status);
                courses.add(course);
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
        return courses;
    }


    public static boolean updateCourseName(Integer courseId, String courseName) {
        boolean flag = false;
        Connection con = Database.getConnection();
        try {
            String query = "UPDATE courses SET course_name = ? WHERE course_id = ?";
            PreparedStatement ps = con.prepareStatement(query);
            ps.setString(1, courseName);
            ps.setInt(2, courseId);

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


    public static boolean updateRefundPolicy(Integer courseId, String refundPolicy) {
        boolean flag = false;
        Connection con = Database.getConnection();
        try {
            String query = "UPDATE courses SET refund_policy = ? WHERE course_id = ?";
            PreparedStatement ps = con.prepareStatement(query);
            ps.setString(1, refundPolicy);
            ps.setInt(2, courseId);

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

    public static boolean updateValidity(Integer courseId, String validity) {
        boolean flag = false;
        Connection con = Database.getConnection();
        try {
            String query = "UPDATE courses SET validity = ? WHERE course_id = ?";
            PreparedStatement ps = con.prepareStatement(query);
            ps.setString(1, validity);
            ps.setInt(2, courseId);

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

    public static boolean updatePrerequisites(Integer courseId, String prerequisites) {
        boolean flag = false;
        Connection con = Database.getConnection();
        try {
            String query = "UPDATE courses SET prerequisites = ? WHERE course_id = ?";
            PreparedStatement ps = con.prepareStatement(query);
            ps.setString(1, prerequisites);
            ps.setInt(2, courseId);

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

    public static boolean updateLearningOutcomes(Integer courseId, String outcomes) {
        boolean flag = false;
        Connection con = Database.getConnection();
        try {
            String query = "UPDATE courses SET learning_outcomes = ? WHERE course_id = ?";
            PreparedStatement ps = con.prepareStatement(query);
            ps.setString(1, outcomes);
            ps.setInt(2, courseId);

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

    public static boolean updateFeatures(Integer courseId, String features) {
        boolean flag = false;
        Connection con = Database.getConnection();
        try {
            String query = "UPDATE courses SET key_features = ? WHERE course_id = ?";
            PreparedStatement ps = con.prepareStatement(query);
            ps.setString(1, features);
            ps.setInt(2, courseId);

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

    public static boolean updateDescription(Integer courseId, String description) {
        boolean flag = false;
        Connection con = Database.getConnection();
        try {
            String query = "UPDATE courses SET description = ? WHERE course_id = ?";
            PreparedStatement ps = con.prepareStatement(query);
            ps.setString(1, description);
            ps.setInt(2, courseId);

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

    public static boolean updateTopics(Integer courseId, String topics) {
        boolean flag = false;
        Connection con = Database.getConnection();
        try {
            String query = "UPDATE courses SET course_topics = ? WHERE course_id = ?";
            PreparedStatement ps = con.prepareStatement(query);
            ps.setString(1, topics);
            ps.setInt(2, courseId);

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

    public static boolean updateLevel(Integer courseId, Integer levelId) {
        boolean flag = false;
        Connection con = Database.getConnection();
        try {
            String query = "UPDATE courses SET level_id = ? WHERE course_id = ?";
            PreparedStatement ps = con.prepareStatement(query);
            ps.setInt(1, levelId);
            ps.setInt(2, courseId);

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

    public static boolean updatePrice(Integer courseId, Integer price) {
        boolean flag = false;
        Connection con = Database.getConnection();
        try {
            String query = "UPDATE courses SET price = ? WHERE course_id = ?";
            PreparedStatement ps = con.prepareStatement(query);
            ps.setInt(1, price);
            ps.setInt(2, courseId);

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

    public static boolean updateCertification(Integer courseId, String certification) {
        boolean flag = false;
        Connection con = Database.getConnection();
        try {
            String query = "UPDATE courses SET certification = ? WHERE course_id = ?";
            PreparedStatement ps = con.prepareStatement(query);
            ps.setString(1, certification);
            ps.setInt(2, courseId);

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

    public static boolean updateDiscount(Integer courseId, Integer discount) {
        boolean flag = false;
        Connection con = Database.getConnection();
        try {
            String query = "UPDATE courses SET discount = ? WHERE course_id = ?";
            PreparedStatement ps = con.prepareStatement(query);
            ps.setInt(1, discount);
            ps.setInt(2, courseId);

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

    public String[] getFeaturesArray(){
        String[] array = gson.fromJson(keyFeatures,String[].class);
        return array;
    }

    public String[] getCoveredTopicsArray(){
        String[] array = gson.fromJson(courseTopics,String[].class);
        return array;
    }

    public String[] getLerningOutcomeArray(){
        String[] array = gson.fromJson(learningOutcomes,String[].class);
        return array;
    }

    public String[] getPrerequisitesArray(){
        String[] array = gson.fromJson(prerequisites,String[].class);
        return array;
    }

    public static boolean changeStatus(Integer courseId,Integer statusId){
        boolean flag = false;
        Connection con = Database.getConnection();
        try {
            String query = "UPDATE courses SET status_id = ? WHERE course_id = ?";
            PreparedStatement ps = con.prepareStatement(query);
            ps.setInt(1, statusId);
            ps.setInt(2, courseId);

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

    public ArrayList<Status> allStatus(){
        ArrayList<Status> list = new ArrayList<>();
        list.add(new Status(9 , "UnPublished"));
        list.add(new Status(10 , "Published"));
        list.add(new Status(11 , "Restricted"));
        list.add(new Status(12 , "Access Only"));
        list.add(new Status(13,"Not For Sell"));

        int temp = -1;
        for(int i=0;i<list.size();i++){
            if(list.get(i).getStatusId() == status.getStatusId()){
                temp = i;
                break;
            }
        }

        if(temp != -1){
            list.remove(temp);
        }

        return list;
    }

    public static int getTempName(int id) {
        Connection con = Database.getConnection();
        int tempName = -1;
        try {
            // Step 1: Fetch `tnm`
            String query = "SELECT tnm FROM courses WHERE course_id = ?";
            PreparedStatement ps = con.prepareStatement(query);
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
    
            if (rs.next()) {
                tempName = rs.getInt("tnm");
            }
    
            // Step 2: Increment `tnm` by 1
            if (tempName != -1) {
                query = "UPDATE courses SET tnm = tnm + 1 WHERE course_id = ?";
                ps = con.prepareStatement(query);
                ps.setInt(1, id);
                ps.executeUpdate();
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
        return tempName;
    }
    

    public TreeMap<CourseTopic,ArrayList<SubTopic>> getContent(){
        TreeMap<CourseTopic,ArrayList<SubTopic>> content = new TreeMap<>();
        Connection con = Database.getConnection();
        try{
            String query = "select * from course_topics where course_id = ?";
            PreparedStatement ps = con.prepareStatement(query);
            ps.setInt(1, courseId);

            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                CourseTopic topic = new CourseTopic(rs.getInt("course_topic_id"), rs.getString("topic_name"), this, rs.getBoolean("preview"), rs.getInt("videos"), rs.getInt("total_hours"));
                ArrayList<SubTopic> subtopics = topic.getSubTopics();
                content.put(topic, subtopics);
            }
        }catch(SQLException e){
            e.printStackTrace();
        }

        return content;
    }

    public ArrayList<CourseTopic> getAllTopics(){
        ArrayList<CourseTopic> topics = new ArrayList<>();
        Connection con = Database.getConnection();
        try{
            String query = "select * from course_topics where course_id = ?";
            PreparedStatement ps = con.prepareStatement(query);
            ps.setInt(1, courseId);

            ResultSet rs = ps.executeQuery();
            if(rs.next()){
                CourseTopic topic = new CourseTopic(rs.getInt("course_topic_id"),rs.getString("topic_name"),this,rs.getBoolean("preview"),rs.getInt("videos"),rs.getInt("total_hours"));
                topics.add(topic);
            }
        }catch(SQLException e){e.printStackTrace();}

        try{con.close();}catch(SQLException e){e.printStackTrace();}

        return topics;
    }

    public Integer getDefaultTopic(){
        Integer temp = -1;
        Connection con = Database.getConnection();
        try{
            String query = "select course_topic_id from course_topics where course_id = ? and topic_name = 'lnf_dflt_99'";
            PreparedStatement ps = con.prepareStatement(query);
            ps.setInt(1, courseId);

            ResultSet rs = ps.executeQuery();
            if(rs.next()){
                temp = rs.getInt("course_topic_id");
            }
        }catch(SQLException e){e.printStackTrace();}

        try{con.close();}catch(SQLException e){e.printStackTrace();}

        return temp;
    }

    public static boolean updateUploadType(Integer id,Integer type){
        boolean flag = false;
        Connection con = Database.getConnection();
        try{
            String query = "update courses set upload_type = ? where course_id = ?";
            PreparedStatement ps = con.prepareStatement(query);

            ps.setInt(1, type);
            ps.setInt(2, id);
            
            if(ps.executeUpdate() != 0)flag = true;
        }catch(SQLException e){
            e.printStackTrace();
        }

        try{con.close();}catch(SQLException e){e.printStackTrace();}

        return flag;
    }

    public boolean fetchCourseData() {
        boolean flag = false;

        Connection con = Database.getConnection();
        try {
            String query = "SELECT c.*, s.name as status, l.name as level, t.trainer_id, t.trainer_name " +
                           "FROM courses c " +
                           "INNER JOIN status s ON c.status_id = s.status_id " +
                           "INNER JOIN courses_level l ON c.level_id = l.courses_level_id " +
                           "INNER JOIN trainers t ON c.trainer_id = t.trainer_id " +
                           "WHERE c.course_id = ?";
                           
            PreparedStatement ps = con.prepareStatement(query);
            ps.setInt(1, courseId);

            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                this.courseName = rs.getString("course_name");
                this.thumbnail = rs.getString("thumbnail");
                this.learningOutcomes = rs.getString("learning_outcomes");
                this.description = rs.getString("description");
                this.courseTopics = rs.getString("course_topics");
                this.keyFeatures = rs.getString("key_features");
                this.pdf = rs.getString("pdf");
                this.certification = rs.getString("certification");
                this.prerequisites = rs.getString("prerequisites");
                this.validity = rs.getString("validity");
                this.refundPolicy = rs.getString("refund_policy");
                this.price = rs.getInt("price");
                this.discount = rs.getInt("discount");
                this.subscribers = rs.getInt("subscribers");
                this.totalClicks = rs.getInt("total_clicks");
                this.starRank = rs.getInt("star_rank");
                this.status = new Status(rs.getInt("status_id"), rs.getString("status"));
                this.totalVideos = rs.getInt("videos");
                this.totalHours = rs.getInt("total_hours");
                this.level = new CourseLevel(rs.getInt("level_id"), rs.getString("level"));
                this.uploadType = rs.getInt("upload_type");
                this.trainer = new Trainer(rs.getInt("trainer_id"), rs.getString("trainer_name"));
                flag = true;
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        try {
            con.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return flag;
    }

    public boolean fetchCourse(){
        boolean flag = false;

        Connection con = Database.getConnection();
        try{
            String query = "SELECT c.*, s.name as status, l.name as level " +
                           "FROM courses c " +
                           "INNER JOIN status s ON c.status_id = s.status_id " +
                           "INNER JOIN courses_level l ON c.level_id = l.courses_level_id " +
                           "WHERE c.course_id = ?";
                           
            PreparedStatement ps = con.prepareStatement(query);
            ps.setInt(1, courseId);

            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                this.courseName = rs.getString("course_name");
                this.thumbnail = rs.getString("thumbnail");
                this.learningOutcomes = rs.getString("learning_outcomes");
                this.description = rs.getString("description");
                this.courseTopics = rs.getString("course_topics");
                this.keyFeatures = rs.getString("key_features");
                this.pdf = rs.getString("pdf");
                this.certification = rs.getString("certification");
                this.prerequisites = rs.getString("prerequisites");
                this.validity = rs.getString("validity");
                this.refundPolicy = rs.getString("refund_policy");
                this.price = rs.getInt("price");
                this.discount = rs.getInt("discount");
                this.subscribers = rs.getInt("subscribers");
                this.totalClicks = rs.getInt("total_clicks");
                this.starRank = rs.getInt("star_rank");
                this.status = new Status(rs.getInt("status_id"), rs.getString("status"));
                this.totalVideos = rs.getInt("videos");
                this.totalHours = rs.getInt("total_hours");
                this.level = new CourseLevel(rs.getInt("level_id"), rs.getString("level"));
                this.uploadType = rs.getInt("upload_type");
                flag = true;
            }

        }catch(SQLException e){
            e.printStackTrace();
        }

        try{con.close();}catch(SQLException e){e.printStackTrace();}

        return flag;
    }


    public static ArrayList<Course> getCourses(Trainer trainer){
        ArrayList<Course> courses = new ArrayList<>();

        Connection con = Database.getConnection();
        try{
            String query = "SELECT c.*, s.name as status, l.name as level " +
                           "FROM courses c " +
                           "INNER JOIN status s ON c.status_id = s.status_id " +
                           "INNER JOIN courses_level l ON c.level_id = l.courses_level_id " +
                           "WHERE c.trainer_id = ?";
                           
            PreparedStatement ps = con.prepareStatement(query);
            ps.setInt(1, trainer.getTrainerId());

            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                Course course = new Course();
                course.setCourseId(rs.getInt("course_id"));
                course.setTrainer(trainer);
                course.setCourseName(rs.getString("course_name"));
                course.setThumbnail(rs.getString("thumbnail"));
                course.setLearningOutcomes(rs.getString("learning_outcomes"));
                course.setDescription(rs.getString("description"));
                course.setCourseTopics(rs.getString("course_topics"));
                course.setKeyFeatures(rs.getString("key_features"));
                course.setPdf(rs.getString("pdf"));
                course.setCertification(rs.getString("certification"));
                course.setPrerequisites(rs.getString("prerequisites"));
                course.setValidity(rs.getString("validity"));
                course.setRefundPolicy(rs.getString("refund_policy"));
                course.setPrice(rs.getInt("price"));
                course.setDiscount(rs.getInt("discount"));
                course.setSubscribers(rs.getInt("subscribers"));
                course.setTotalClicks(rs.getInt("total_clicks"));
                course.setStarRank(rs.getInt("star_rank"));
                course.setStatus(new Status(rs.getInt("status_id"), rs.getString("status")));
                course.setTotalVideos(rs.getInt("videos"));
                course.setTotalHours(rs.getInt("total_hours"));
                course.setLevel(new CourseLevel(rs.getInt("level_id"), rs.getString("level")));
                course.setUploadType(rs.getInt("upload_type"));
                courses.add(course);
            }

        }catch(SQLException e){
            e.printStackTrace();
        }

        try{con.close();}catch(SQLException e){e.printStackTrace();}



        return courses;
    }


    public void printAll(){
        System.out.println("Course ID: " + courseId);
        System.out.println("Trainer: " + (trainer != null ? trainer.getTrainerId() + trainer.getTrainerName() : "null"));
        System.out.println("Course Name: " + courseName);
        System.out.println("Thumbnail: " + thumbnail);
        System.out.println("Learning Outcomes: " + learningOutcomes);
        System.out.println("Description: " + description);
        System.out.println("Course Topics: " + courseTopics);
        System.out.println("Key Features: " + keyFeatures);
        System.out.println("PDF: " + pdf);
        System.out.println("Certification: " + certification);
        System.out.println("Prerequisites: " + prerequisites);
        System.out.println("Validity: " + validity);
        System.out.println("Refund Policy: " + refundPolicy);
        System.out.println("Price: " + price);
        System.out.println("level: " + level.getCourseLevelId() + ",name : " + level.getName());
    }


    public boolean createCourse() {
        boolean flag = false;
        Connection con = Database.getConnection();

        try {
            String query = "INSERT INTO courses (trainer_id, course_name, thumbnail, learning_outcomes, description, " +
                    "course_topics, key_features, pdf, certification, prerequisites, validity, refund_policy, price, level_id) "
                    +
                    "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";

            PreparedStatement ps = con.prepareStatement(query, Statement.RETURN_GENERATED_KEYS);
            ps.setInt(1, this.trainer.getTrainerId());
            ps.setString(2, this.courseName);
            ps.setString(3, this.thumbnail);
            ps.setString(4, this.learningOutcomes);
            ps.setString(5, this.description);
            ps.setString(6, this.courseTopics);
            ps.setString(7, this.keyFeatures);
            ps.setString(8, this.pdf);
            ps.setString(9, this.certification);
            ps.setString(10, this.prerequisites);
            ps.setString(11, this.validity);
            ps.setString(12, this.refundPolicy);
            ps.setInt(13, this.price);
            ps.setInt(14, this.level.getCourseLevelId());

            int rowsAffected = ps.executeUpdate();

            if (rowsAffected > 0) {
                // Get the last inserted course_id
                ResultSet rs = ps.getGeneratedKeys();
                if (rs.next()) {
                    this.courseId = rs.getInt(1); // Set the auto-incremented course ID
                }
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

    public boolean isCourseNameExist() {
        boolean flag = false;

        Connection con = Database.getConnection();
        try {
            String query = "SELECT * FROM courses WHERE course_name = ?";
            PreparedStatement ps = con.prepareStatement(query);
            ps.setString(1, this.courseName);

            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                flag = true;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        try {
            con.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return flag;
    }

    public ArrayList<CourseLevel> getAvailableLevels() {
        ArrayList<CourseLevel> levels = new ArrayList<>();
        
        levels.add(new CourseLevel(1, "Not selected"));
        levels.add(new CourseLevel(2, "Basic"));
        levels.add(new CourseLevel(3, "Intermediate"));
        levels.add(new CourseLevel(4, "Advanced"));
        levels.add(new CourseLevel(5, "Basic to Intermediate"));
        levels.add(new CourseLevel(6, "Basic to Advanced"));
        levels.add(new CourseLevel(7, "Intermediate to Advanced"));
    
        // Remove the current level from the list
        levels.removeIf(level -> level.getCourseLevelId().equals(this.level.getCourseLevelId()));
    
        return levels;
    }
    

    public boolean setLevel(Integer levelId) {
        boolean flag = false;
        switch (levelId) {
            case 1:
                this.level = new CourseLevel(1, "Not selected");
                flag = true;
                break;
            case 2:
                this.level = new CourseLevel(2, "Basic");
                flag = true;
                break;
            case 3:
                this.level = new CourseLevel(3, "Intermediate");
                flag = true;
                break;
            case 4:
                this.level = new CourseLevel(4, "Advanced");
                flag = true;
                break;
            case 5:
                this.level = new CourseLevel(5, "Basic to Intermediate");
                flag = true;
                break;
            case 6:
                this.level = new CourseLevel(6, "Basic to Advanced");
                flag = true;
                break;
            case 7:
                this.level = new CourseLevel(7, "Intermediate to Advanced");
                flag = true;
                break;
            default:
                flag = false;
                break;
        }
        return flag;
    }


    public boolean setMandetoryDefaults() {
        this.courseName = "";
        this.description = "";
        this.thumbnail = "www_lernify_thumb_com.png";
        this.learningOutcomes = "[]";
        this.courseTopics = "[]";
        this.keyFeatures = "[]";
        this.pdf = "pdf_9_9_9_9_no_pdf.pdf";
        this.certification = "no_9_9_no certification";
        this.prerequisites = "[]";
        this.validity = "0 days";
        this.refundPolicy = "9_9_9_9_no";
        this.price = 0;
        this.level = new CourseLevel(1, "Basic");
        this.uploadType = 0;

        // not mendatory
        this.discount = 0;
        this.subscribers = 0;
        this.totalClicks = 0;
        this.starRank = 0;
        this.status = new Status(9, "Unreleased");
        this.totalVideos = 0;
        this.totalHours = 0;
        return true;
    }

    // ######## Cunstructores ############

    public Course(){
        setMandetoryDefaults();
    }

    public Course(Integer courseId, Trainer trainer, String courseName, String thumbnail, String learningOutcomes,
            String description, String courseTopics, String keyFeatures, String pdf, String certification,
            String prerequisites, String validity, String refundPolicy, Integer price, Integer discount,
            Integer subscribers, Integer totalClicks, Integer starRank, Status status, Integer totalVideos,
            Integer totalHours, CourseLevel level) {
        this.courseId = courseId;
        this.trainer = trainer;
        this.courseName = courseName;
        this.thumbnail = thumbnail;
        this.learningOutcomes = learningOutcomes;
        this.description = description;
        this.courseTopics = courseTopics;
        this.keyFeatures = keyFeatures;
        this.pdf = pdf;
        this.certification = certification;
        this.prerequisites = prerequisites;
        this.validity = validity;
        this.refundPolicy = refundPolicy;
        this.price = price;
        this.discount = discount;
        this.subscribers = subscribers;
        this.totalClicks = totalClicks;
        this.starRank = starRank;
        this.status = status;
        this.totalVideos = totalVideos;
        this.totalHours = totalHours;
        this.level = level;
    }

    public Course(Integer courseId){
        this.courseId = courseId;
    }

    public Course(Trainer trainer) {
        this.trainer = trainer;
    }

    // ######## Getters and Setters ############

    

    public Integer getCourseId() {
        return courseId;
    }

    public void setCourseId(Integer courseId) {
        this.courseId = courseId;
    }

    public Trainer getTrainer() {
        return trainer;
    }

    public void setTrainer(Trainer trainer) {
        this.trainer = trainer;
    }

    public String getCourseName() {
        return courseName;
    }

    public void setCourseName(String courseName) {
        this.courseName = courseName;
    }

    public String getThumbnail() {
        return thumbnail;
    }

    public void setThumbnail(String thumbnail) {
        this.thumbnail = thumbnail;
    }

    public String getLearningOutcomes() {
        return learningOutcomes;
    }

    public void setLearningOutcomes(String learningOutcomes) {
        this.learningOutcomes = learningOutcomes;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getCourseTopics() {
        return courseTopics;
    }

    public void setCourseTopics(String courseTopics) {
        this.courseTopics = courseTopics;
    }

    public String getKeyFeatures() {
        return keyFeatures;
    }

    public void setKeyFeatures(String keyFeatures) {
        this.keyFeatures = keyFeatures;
    }

    public String getPdf() {
        return pdf;
    }

    public void setPdf(String pdf) {
        this.pdf = pdf;
    }

    public String getCertification() {
        return certification;
    }

    public void setCertification(String certification) {
        this.certification = certification;
    }

    public String getPrerequisites() {
        return prerequisites;
    }

    public void setPrerequisites(String prerequisites) {
        this.prerequisites = prerequisites;
    }

    public String getRefundPolicy() {
        return refundPolicy;
    }

    public void setRefundPolicy(String refundPolicy) {
        this.refundPolicy = refundPolicy;
    }

    public Integer getPrice() {
        return price;
    }

    public void setPrice(Integer price) {
        this.price = price;
    }

    public Integer getDiscount() {
        return discount;
    }

    public void setDiscount(Integer discount) {
        this.discount = discount;
    }

    public Integer getSubscribers() {
        return subscribers;
    }

    public void setSubscribers(Integer subscribers) {
        this.subscribers = subscribers;
    }

    public Integer getTotalClicks() {
        return totalClicks;
    }

    public void setTotalClicks(Integer totalClicks) {
        this.totalClicks = totalClicks;
    }

    public Integer getStarRank() {
        return starRank;
    }

    public void setStarRank(Integer starRank) {
        this.starRank = starRank;
    }

    public Status getStatus() {
        return status;
    }

    public void setStatus(Status status) {
        this.status = status;
    }

    public Integer getTotalVideos() {
        return totalVideos;
    }

    public void setTotalVideos(Integer totalVideos) {
        this.totalVideos = totalVideos;
    }

    public Integer getTotalHours() {
        return totalHours;
    }

    public void setTotalHours(Integer totalHours) {
        this.totalHours = totalHours;
    }

    public String getValidity() {
        return validity;
    }

    public void setValidity(String validity) {
        this.validity = validity;
    }

    public CourseLevel getLevel() {
        return level;
    }

    public void setLevel(CourseLevel level) {
        this.level = level;
    }


    public Integer getUploadType() {
        return uploadType;
    }


    public void setUploadType(Integer uploadType) {
        this.uploadType = uploadType;
    }

}
