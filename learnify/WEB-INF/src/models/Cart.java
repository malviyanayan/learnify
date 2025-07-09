package models;


import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;

import utils.Database;


public class Cart {
    private Integer cartId ;
    private User user;
    private Boolean isPurchased;
    private Timestamp purchasedTime;
    private String transactionId;
    private Integer price;
    private Integer discount;
    private Integer taxes;

    // ###### Methods ######

    public void paymentConfirm() {
        // System.out.println(java.time.format.DateTimeFormatter.ofPattern("dd MMMM yyyy HH:mm:ss").format(purchasedTime.toLocalDateTime()));
        this.isPurchased = true;
        this.purchasedTime = new Timestamp(System.currentTimeMillis());

        Connection con = Database.getConnection();
        try {
            String query = "UPDATE carts SET is_purchased = ?, purchased_time = ? WHERE cart_id = ?";
            PreparedStatement ps = con.prepareStatement(query);
            ps.setBoolean(1, this.isPurchased);
            ps.setTimestamp(2, this.purchasedTime);
            ps.setInt(3, this.cartId);

            ps.executeUpdate();
            ps.close();
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

    public void updateAmounts() {

        Connection con = Database.getConnection();
        try {
            String query = "UPDATE carts SET price = ?, discount = ?, taxes = ? WHERE cart_id = ?";
            PreparedStatement ps = con.prepareStatement(query);
            ps.setInt(1, price);
            ps.setInt(2, discount);
            ps.setInt(3, taxes);
            
            ps.setInt(4, cartId);

            ps.executeUpdate();
            ps.close();
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

    public boolean saveTransectionId(){
        boolean flag = false;
        Connection con = Database.getConnection();

        try{
            String query = "UPDATE carts SET transaction_id = ? WHERE cart_id = ?";
            PreparedStatement ps = con.prepareStatement(query);
            ps.setString(1, transactionId);
            ps.setInt(2, cartId);

            if(ps.executeUpdate() != 0)flag = true;

        }catch(SQLException e){
            e.printStackTrace();
        }finally{
            try{con.close();}catch(SQLException e){e.printStackTrace();}
        }

        return flag;
    }

    public ArrayList<CartItem> getAllItems(){
        ArrayList<CartItem> items = new ArrayList<>();
        try {
            Connection con = Database.getConnection();
            String query = "SELECT * FROM cart_items WHERE cart_id = ?";
            PreparedStatement ps = con.prepareStatement(query);
            ps.setInt(1, this.cartId);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                CartItem item = new CartItem();
                item.setCartItemId(rs.getInt("cart_items_id"));
                item.setCart(this);
                item.setCourse(new Course(rs.getInt("course_id")));
                item.fetchCourse();
                items.add(item);
            }

            rs.close();
            ps.close();
            con.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return items;
    }

    public boolean fetch(){
        boolean flag = false;
        try {
            Connection con = Database.getConnection();
            String query = "SELECT * FROM carts WHERE cart_id = ? AND user_id = ?";
            PreparedStatement ps = con.prepareStatement(query);
            ps.setInt(1, this.cartId);
            ps.setInt(2, this.user.getUserId());
            ResultSet rs = ps.executeQuery();
            
            if (rs.next()) {
                this.isPurchased = rs.getBoolean("is_purchased");
                this.purchasedTime = rs.getTimestamp("purchased_time");
                this.transactionId = rs.getString("transaction_id");
                this.price = rs.getInt("price");
                this.discount = rs.getInt("discount");
                this.taxes = rs.getInt("taxes");
                flag = true;
            }
            
            rs.close();
            ps.close();
            con.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return flag;
    }


    // ###### Constructors ######
    public Cart() {
    }

    public Cart(Integer cartId){
        this.cartId = cartId;
    }

    public Cart(User user, Integer cartId){
        this.cartId = cartId;
    }

    // ###### Getters and Setters ######
    public Integer getCartId() {
        return cartId;
    }

    public void setCartId(Integer cartId) {
        this.cartId = cartId;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public Boolean getIsPurchased() {
        return isPurchased;
    }

    public void setIsPurchased(Boolean isPurchased) {
        this.isPurchased = isPurchased;
    }

    public String getTransactionId() {
        return transactionId;
    }

    public void setTransactionId(String transactionId) {
        this.transactionId = transactionId;
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

    public Integer getTaxes() {
        return taxes;
    }

    public void setTaxes(Integer taxes) {
        this.taxes = taxes;
    }

    public Timestamp getPurchasedTime() {
        return purchasedTime;
    }

    public void setPurchasedTime(Timestamp purchasedTime) {
        this.purchasedTime = purchasedTime;
    }


    

    
}