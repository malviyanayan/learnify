package models;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;
import java.util.Objects;

import utils.Database;

public class WishList implements Comparable<WishList> {
    private Integer wishlistId;
    private User user;
    private Course course;
    private Timestamp time;

    // ####### Methods #######
    public static List<WishList> wishItems(int userId) {
        List<WishList> wishItems = new ArrayList<>();
        Connection con = Database.getConnection();

        try {
            String query = "select * from wishlist where user_id = ?";
            PreparedStatement ps = con.prepareStatement(query);
            ps.setInt(1, userId);

            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                WishList wish = new WishList();
                wish.setWishlistId(rs.getInt("wishlist_id"));

                User user = new User();
                user.setUserId(userId);
                wish.setUser(user);

                Course course = new Course();
                course.setCourseId(rs.getInt("course_id"));
                wish.setCourse(course);

                wishItems.add(wish);
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

        return wishItems;
    }

    @Override
    public boolean equals(Object obj) {
        if (this == obj) return true;
        if (obj == null || getClass() != obj.getClass()) return false;
        
        WishList wish = (WishList) obj;
        return user.getUserId().equals(wish.getUser().getUserId()) &&
               course.getCourseId().equals(wish.getCourse().getCourseId());
    }


    @Override
    public int hashCode() {
        return Objects.hash(user.getUserId(), course.getCourseId());
    }

    @Override
    public int compareTo(WishList other) {
        int userCompare = this.user.getUserId().compareTo(other.user.getUserId());
        return (userCompare != 0) ? userCompare : this.course.getCourseId().compareTo(other.course.getCourseId());
    }

    public boolean exists() {
        boolean flag = false;
        Connection con = Database.getConnection();
        try {
            String query = "select wishlist_id from wishlist where user_id = ? and course_id = ?";
            PreparedStatement ps = con.prepareStatement(query);
            ps.setInt(1, user.getUserId());
            ps.setInt(2, course.getCourseId());

            ResultSet rs = ps.executeQuery();

            if (rs.next())
                flag = true;
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

    public boolean removeWish() {
        boolean flag = false;
        Connection con = Database.getConnection();

        try {
            String query = "delete from wishlist where user_id = ? and course_id = ?";
            PreparedStatement ps = con.prepareStatement(query);

            ps.setInt(1, user.getUserId());
            ps.setInt(2, course.getCourseId());

            int result = ps.executeUpdate();
            if (result != 0)
                flag = true;
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

    public boolean addWish() {
        boolean flag = false;
        Connection con = Database.getConnection();

        try {
            String query = "insert into wishlist (user_id, course_id) value (?, ?)";
            PreparedStatement ps = con.prepareStatement(query);
            ps.setInt(1, user.getUserId());
            ps.setInt(2, course.getCourseId());

            int affectedrow = ps.executeUpdate();

            if (affectedrow != 0) {
                String query1 = "select wishlist_id,time from wishlist where user_id=? and course_id = ?";
                PreparedStatement ps1 = con.prepareStatement(query1);
                ps1.setInt(1, user.getUserId());
                ps1.setInt(2, course.getCourseId());

                ResultSet rs = ps1.executeQuery();
                if (rs.next()) {
                    this.wishlistId = rs.getInt("wishlist_id");
                    this.time = rs.getTimestamp("time");
                    this.course.fetchCourseData();
                    flag = true;
                }
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

    // ####### Constructors #######
    public WishList(User user, Course course) {
        this.user = user;
        this.course = course;
    }

    public WishList() {

    }

    // ####### Getters and Setters #######
    public Integer getWishlistId() {
        return wishlistId;
    }

    public void setWishlistId(Integer wishlistId) {
        this.wishlistId = wishlistId;
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

    public Timestamp getTime() {
        return time;
    }

    public void setTime(Timestamp time) {
        this.time = time;
    }

}
