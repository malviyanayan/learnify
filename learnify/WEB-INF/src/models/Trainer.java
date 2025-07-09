package models;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import utils.Database;


public class Trainer {
    private Integer trainerId;
    private String trainerName;
    private User user;
    private String experience;
    private String skills;
    private String education;
    private String profession;
    private Integer lauchedCourses;
    private Boolean isActive;
    private ArrayList<String> inactiveTrainers;

    // ########## Methods ###########
    public boolean courseExists(int courseId) {
        boolean flag = false;
        Connection con = Database.getConnection();
        try {
            String query = "SELECT course_id FROM courses WHERE trainer_id = ? and course_id = ?";
            PreparedStatement ps = con.prepareStatement(query);
            ps.setInt(1, this.trainerId);
            ps.setInt(2, courseId);

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

    public boolean setTrainer() {
        boolean flag = false;
        Connection con = Database.getConnection();
        try {
            String query = "SELECT * FROM trainers WHERE trainer_id = ?";
            PreparedStatement ps = con.prepareStatement(query);
            ps.setInt(1, this.trainerId);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                this.trainerName = rs.getString("trainer_name");
                this.experience = rs.getString("experience");
                this.skills = rs.getString("skills");
                this.education = rs.getString("education");
                this.profession = rs.getString("profession");
                this.lauchedCourses = rs.getInt("launched_courses");
                this.isActive = rs.getBoolean("is_active");
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

    public static Integer getUserId(Integer trainerId) {
        Integer userId = null;
        Connection con = Database.getConnection();
        try {
            String query = "SELECT user_id FROM trainers WHERE trainer_id = ?";
            PreparedStatement ps = con.prepareStatement(query);
            ps.setInt(1, trainerId);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                userId = rs.getInt("user_id");
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
        return userId;
    }



    public boolean editUpdate(){
        boolean flag = false;
        Connection con = Database.getConnection();
        try {
            String query = "UPDATE trainers SET trainer_name = ?, experience = ?, skills = ?, education = ?, profession = ? WHERE trainer_id = ?";
            System.out.println(query + "-----------");
            PreparedStatement ps = con.prepareStatement(query);
            ps.setString(1, this.trainerName);
            ps.setString(2, this.experience);
            ps.setString(3, this.skills);
            ps.setString(4, this.education);
            ps.setString(5, this.profession);
            ps.setInt(6, this.trainerId);
            int rowsAffected = ps.executeUpdate();
            if (rowsAffected > 0) {
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


    public boolean setTrainerId(){
        boolean flag = false;
        Connection con = Database.getConnection();
        try{
            String query = "SELECT trainer_id FROM trainers WHERE trainer_name = ?";
            PreparedStatement ps = con.prepareStatement(query);
            ps.setString(1, this.trainerName);
            ResultSet rs = ps.executeQuery();
            if(rs.next()){
                this.trainerId = rs.getInt("trainer_id");
                flag = true;
            }
        }catch(SQLException e){
            e.printStackTrace();
        }

        try{con.close();}catch(SQLException e){e.printStackTrace();}
        return flag;
    }

    public boolean setActive(boolean flag,String newTrainer){
        boolean temp = false;
        Connection con = Database.getConnection();
        try{
            String query = "UPDATE trainers SET is_active = ? WHERE trainer_name = ?";
            PreparedStatement ps = con.prepareStatement(query);
            ps.setBoolean(1, flag);
            ps.setString(2, newTrainer);
            int rowsAffected = ps.executeUpdate();
            if(rowsAffected > 0){
                temp = true;
            }
        }catch(SQLException e){
            e.printStackTrace();
        }

        try{con.close();}catch(SQLException e){e.printStackTrace();}
        return temp;
    }

    public boolean setActive(boolean flag){
        boolean temp = false;
        Connection con = Database.getConnection();
        try{
            String query = "UPDATE trainers SET is_active = ? WHERE trainer_id = ?";
            PreparedStatement ps = con.prepareStatement(query);
            ps.setBoolean(1, flag);
            ps.setInt(2, this.trainerId);
            int rowsAffected = ps.executeUpdate();
            if(rowsAffected > 0){
                temp = true;
            }
        }catch(SQLException e){
            e.printStackTrace();
        }

        try{con.close();}catch(SQLException e){e.printStackTrace();}
        return temp;
    }

    private boolean set(Trainer temp){
        this.trainerId = temp.getTrainerId();
        this.trainerName = temp.getTrainerName();
        this.user = temp.getUser();
        this.experience = temp.getExperience();
        this.skills = temp.getSkills();
        this.education = temp.getEducation();
        this.profession = temp.getProfession();
        this.lauchedCourses = temp.getLauchedCourses();
        this.isActive = temp.getIsActive();
        return true;
    }

    public boolean fetchTrainer(){
        boolean flag = false;
        Connection con = Database.getConnection();
        ArrayList<Trainer> trainers = new ArrayList<Trainer>();
        Trainer temp = null;

        try{
            String query = "SELECT * FROM trainers WHERE user_id = ?";
            PreparedStatement ps = con.prepareStatement(query);
            ps.setInt(1, this.user.getUserId());
            ResultSet rs = ps.executeQuery();
            
            while(rs.next()){
                boolean isActiveTemp = rs.getBoolean("is_active");

                Trainer trainer = new Trainer(
                    rs.getInt("trainer_id"),
                    rs.getString("trainer_name"),
                    this.user,
                    rs.getString("experience"),
                    rs.getString("skills"),
                    rs.getString("education"),
                    rs.getString("profession"),
                    rs.getInt("launched_courses"),
                    isActive
                );

                if(isActiveTemp)temp = trainer;
                trainers.add(trainer);
            }

            if(temp != null){
                trainers.remove(temp);
            }

            inactiveTrainers = new ArrayList<>();

            if(temp == null && trainers.size() != 0){
                temp = trainers.remove(0);
            }

            for(Trainer trainer : trainers){
                this.inactiveTrainers.add(trainer.getTrainerName());
            }

            if(temp != null){
                this.set(temp);
                flag = true;
            }

        }catch(SQLException e){
            e.printStackTrace();
        }

        try{con.close();}catch(SQLException e){e.printStackTrace();}
        return flag;
    }


    public boolean createTrainer() {
        boolean flag = false;
        Connection con = Database.getConnection();
        try {
            String query = "INSERT INTO trainers (user_id, trainer_name, experience, skills, profession, education) VALUES (?, ?, ?, ?, ?, ?)";
            PreparedStatement ps = con.prepareStatement(query);
            ps.setInt(1, this.user.getUserId());
            ps.setString(2, this.trainerName);
            ps.setString(3, this.experience);
            ps.setString(4, this.skills);
            ps.setString(5, this.profession);
            ps.setString(6, this.education);

            int rowsAffected = ps.executeUpdate();
            if (rowsAffected > 0) {
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

    public boolean exist() {
        boolean flag = false;
        Connection con = Database.getConnection();
        try{
            String query = "SELECT COUNT(*) FROM trainers WHERE trainer_name = ?";
            PreparedStatement ps = con.prepareStatement(query);
            ps.setString(1, this.trainerName);
            ResultSet rs = ps.executeQuery();
            if (rs.next() && rs.getInt(1) > 0) {
                flag = true;
            }
        }catch(SQLException e){
            e.printStackTrace();
        }

        try{con.close();}catch(SQLException e){e.printStackTrace();}
        return flag;
    }

    // ########## Constructors ###########
    public Trainer(){

    }
    
    public Trainer(Integer trainerId, String trainerName) {
        this.trainerId = trainerId;
        this.trainerName = trainerName;
    }

    public Trainer(String trainerName, String experience, String skills, String education, String profession) {
        this.trainerName = trainerName;
        this.experience = experience;
        this.skills = skills;
        this.education = education;
        this.profession = profession;
    }

    public Trainer(Integer trainerId, String trainerName, User user, String experience, String skills, String education,
        String profession, Integer lauchedCourses, Boolean isActive) {
        this.trainerId = trainerId;
        this.trainerName = trainerName;
        this.user = user;
        this.experience = experience;
        this.skills = skills;
        this.education = education;
        this.profession = profession;
        this.lauchedCourses = lauchedCourses;
        this.isActive = isActive;
    }


    public Trainer(User user, String trainerName, String experience, String skills, String education, String profession) {
        this.user = user;
        this.trainerName = trainerName;
        this.experience = experience;
        this.skills = skills;
        this.education = education;
        this.profession = profession;
    }

    public Trainer(User user){
        this.user = user;
    }

    // ########## Getters and Setters ###########
    
    
    public Integer getTrainerId() {
        return trainerId;
    }

    public void setTrainerId(Integer trainerId) {
        this.trainerId = trainerId;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public String getExperience() {
        return experience;
    }

    public void setExperience(String experience) {
        this.experience = experience;
    }

    public String getSkills() {
        return skills;
    }

    public void setSkills(String skills) {
        this.skills = skills;
    }

    public Integer getLauchedCourses() {
        return lauchedCourses;
    }

    public void setLauchedCourses(Integer lauchedCourses) {
        this.lauchedCourses = lauchedCourses;
    }

    public String getEducation() {
        return education;
    }

    public void setEducation(String education) {
        this.education = education;
    }

    public String getProfession() {
        return profession;
    }

    public void setProfession(String profession) {
        this.profession = profession;
    }

    public String getTrainerName() {
        return trainerName;
    }

    public void setTrainerName(String trainerName) {
        this.trainerName = trainerName;
    }

    public Boolean getIsActive() {
        return isActive;
    }

    public void setIsActive(Boolean isActive) {
        this.isActive = isActive;
    }

    public ArrayList<String> getInactiveTrainers() {
        return inactiveTrainers;
    }
    
}
