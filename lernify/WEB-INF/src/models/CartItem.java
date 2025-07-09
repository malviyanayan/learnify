package models;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import utils.Database;

public class CartItem {
    private Integer cartItemId;
    private Cart cart;
    private Course course;

    // ########### Methods ###########
    public boolean fetchCourse(){
        boolean flag = false;
        if(this.course != null){
            return course.fetchCourseData();
        }
        return flag;
    }

    public Boolean add() {
        boolean flag = false;
        Connection con = Database.getConnection();
        try {
            String query = "INSERT INTO cart_items (cart_id, course_id) VALUES (?, ?)";
            PreparedStatement ps = con.prepareStatement(query);
            ps.setInt(1, this.cart.getCartId());
            ps.setInt(2, this.course.getCourseId());

            if (ps.executeUpdate() > 0) {
                flag = true;
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return flag;
    }

    public boolean remove() {
        boolean flag = false;
        Connection con = Database.getConnection();
        try {
            String query = "DELETE FROM cart_items WHERE cart_id = ? AND course_id = ?";
            PreparedStatement ps = con.prepareStatement(query);
            ps.setInt(1, this.cart.getCartId());
            ps.setInt(2, this.course.getCourseId());

            if (ps.executeUpdate() > 0) {
                flag = true;
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return flag;
    }

    // ########### Constructors ###########
    public CartItem(Cart cart, Course course) {
        this.cart = cart;
        this.course = course;
    }

    public CartItem(){

    }

    // ########### Getters and Setters ###########
    public Integer getCartItemId() {
        return cartItemId;
    }

    public void setCartItemId(Integer cartItemId) {
        this.cartItemId = cartItemId;
    }

    public Cart getCart() {
        return cart;
    }

    public void setCart(Cart cart) {
        this.cart = cart;
    }

    public Course getCourse() {
        return course;
    }

    public void setCourse(Course course) {
        this.course = course;
    }

}
