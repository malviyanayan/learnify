package models;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.TreeSet;

import org.jasypt.util.password.StrongPasswordEncryptor;

import utils.Database;

public class User {
    private Integer userId;
    private String name;
    private String email;
    private String aboutMe;
    private String password;
    private String profilePic;
    private String phone;
    private Date dob;
    private Character gender;
    private Status status;
    private Date createdOn;
    private Country country;
    private boolean isVerified;
    private Cart defaultCart;

    // WishList
    TreeSet<WishList> wishlist = null;

    static StrongPasswordEncryptor spe = new StrongPasswordEncryptor();

    // ############ methods #############
    public void updateIfDefault(int cartId) {
        Connection con = Database.getConnection();
        try {
            String query = "SELECT default_cart_id FROM users WHERE user_id = ?";
            PreparedStatement ps = con.prepareStatement(query);
            ps.setInt(1, this.userId);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                int defaultCartId = rs.getInt("default_cart_id");
                if (defaultCartId == cartId) {
                    query = "UPDATE users SET default_cart_id = NULL WHERE user_id = ?";
                    ps = con.prepareStatement(query);
                    ps.setInt(1, this.userId);
                    ps.executeUpdate();
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
    }


    public ArrayList<Cart> getAllCarts() {
        ArrayList<Cart> carts = new ArrayList<>();
        Connection con = Database.getConnection();
        try {
            Cart defCart = getDefaultCart();
            defCart.setUser(this);
            defCart.fetch();
            carts.add(defCart);          

            String query = "SELECT * FROM carts WHERE user_id = ? AND NOT cart_id = ?";
            PreparedStatement ps = con.prepareStatement(query);
            ps.setInt(1, this.userId);
            ps.setInt(2, defCart.getCartId());

            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                int cartId = rs.getInt("cart_id");
                Cart cart = new Cart(this, cartId);
                
                // set other properties to this cart
                cart.setIsPurchased(rs.getBoolean("is_purchased"));
                cart.setTransactionId(rs.getString("transaction_id"));
                cart.setPrice(rs.getInt("price"));
                cart.setDiscount(rs.getInt("discount"));
                cart.setDiscount(rs.getInt("taxes"));
                cart.setPurchasedTime(rs.getTimestamp("purchased_time"));
                carts.add(cart);
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
        return carts;
    }

    public boolean isInCart(Course course) {
        boolean isInCart = false;
        Connection con = Database.getConnection();
        try {
            String query = "select cart_id from carts where user_id = ? and is_purchased = false";
            PreparedStatement ps = con.prepareStatement(query);
            ps.setInt(1, this.userId);

            ArrayList<Integer> cartIds = new ArrayList<>();
            
            ResultSet rs = ps.executeQuery();
            while(rs.next()){
                cartIds.add(rs.getInt("cart_id"));
            }

            for(int i=0;i<cartIds.size();i++){
                query = "select course_id from cart_items where cart_id = ?";
                ps = con.prepareStatement(query);
                ps.setInt(1, cartIds.get(i));

                rs = ps.executeQuery();

                while(rs.next()){
                    if(rs.getInt("course_id") == course.getCourseId()){
                        isInCart = true;
                        break;
                    }
                }

                if(isInCart)break;
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
        return isInCart;
    }

    public Cart createNewDefaultCart() {
        Cart cart = null;
        Connection con = Database.getConnection();
        try {
            // Insert a new cart for the user
            String query = "INSERT INTO carts (user_id) VALUES (?)";
            PreparedStatement ps = con.prepareStatement(query, PreparedStatement.RETURN_GENERATED_KEYS);
            ps.setInt(1, this.userId);
            ps.executeUpdate();
            
            // Retrieve the generated cart ID
            ResultSet rs = ps.getGeneratedKeys();
            if (rs.next()) {
                int cartId = rs.getInt(1);
                cart = new Cart(this, cartId);
                
                // Update the user's default cart ID
                query = "UPDATE users SET default_cart_id = ? WHERE user_id = ?";
                ps = con.prepareStatement(query);
                ps.setInt(1, cartId);
                ps.setInt(2, this.userId);
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
        return cart;
    }

    public Cart fetchDefaultCart() {
        Cart cart = null;
        Connection con = Database.getConnection();
        try {
            // Fetch default cart id from users table
            String query = "SELECT default_cart_id FROM users WHERE user_id = ?";
            PreparedStatement ps = con.prepareStatement(query);
            ps.setInt(1, this.userId);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                Integer defaultCartId = rs.getInt("default_cart_id");
                if (defaultCartId != 0) {
                    cart = new Cart(this, defaultCartId);
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
        return cart;
    }
    
    
    public ArrayList<WishList> wishlistArray(){
        ArrayList<WishList> list = new ArrayList<>();

        Iterator<WishList> itr = wishlist.iterator();
        while(itr.hasNext()){
            list.add(itr.next());
        }

        return list;
    } 

    public void fetchWishlist(){
        this.wishlist = new TreeSet<>();
        Connection con = Database.getConnection();

        try{
            String query = "select * from wishlist where user_id = ?";
            PreparedStatement ps = con.prepareStatement(query);

            ps.setInt(1, userId);

            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                WishList temp = new WishList();

                temp.setUser(this);
                Course t1 = new Course(rs.getInt("course_id"));
                t1.fetchCourseData();
                temp.setCourse(t1);

                temp.setTime(rs.getTimestamp("time"));
                temp.setWishlistId(rs.getInt("wishlist_id"));

                wishlist.add(temp);
            }
        }catch(SQLException e){
            e.printStackTrace();
        }
    }

    public static String getEmail(Integer userId) {
        String email = null;
        Connection con = Database.getConnection();
        try {
            String query = "select email from users where user_id = ?;";
            PreparedStatement ps = con.prepareStatement(query);
            ps.setInt(1, userId);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                email = rs.getString("email");
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
        return email;
    }

    public boolean setCountry(Integer countryId) {
        boolean flag = false;
        Connection con = Database.getConnection();
        try {
            PreparedStatement ps = con.prepareStatement("select * from countries where country_id = ?;");
            ps.setInt(1, countryId);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                country = new Country(
                    rs.getInt("country_id"),
                    rs.getString("name"),
                    rs.getString("flag"),
                    rs.getInt("country_code")
                );
                flag = true;
            }
            
        } catch (SQLException e) {
            e.printStackTrace();
        }
        try{con.close();}catch(SQLException e){e.printStackTrace();}
        return flag;
    }

    public boolean updateCountry(Integer countryId) {
        boolean flag = false;
        Connection con = Database.getConnection();
        try {
            String query = "UPDATE users SET country_id = ? WHERE email = ?";
            PreparedStatement ps = con.prepareStatement(query);
            ps.setInt(1, countryId);
            ps.setString(2, email);
            if (ps.executeUpdate() != 0)
                flag = true;
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            if (con != null) {
                try {
                    con.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
        }

        return flag;
    }

    public boolean updateGender(Character gender) {
        return update("gender", gender + "");
    }

    public boolean updateDob(Date dob) {
        boolean flag = false;
        Connection con = Database.getConnection();

        try {
            String query = "update users set dob = ? where email = ?";
            PreparedStatement ps = con.prepareStatement(query);
            ps.setDate(1, dob);
            ps.setString(2, email);

            if (ps.executeUpdate() != 0)
                flag = true;
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

    public boolean updateAboutMe(String aboutMe) {
        return update("about_me", aboutMe);
    }

    public boolean updateName(String name) {
        return update("name", name);
    }

    public boolean update(String db_atrb, String newValue) {
        boolean flag = false;
        Connection con = Database.getConnection();
        try {
            String query = "update users set " + db_atrb + " = ? where email = ?";
            PreparedStatement ps = con.prepareStatement(query);
            ps.setString(1, newValue);
            ps.setString(2, email);

            if (ps.executeUpdate() != 0) {
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

    public boolean updateProfilePic(String pic) {
        boolean flag = false;

        Connection con = Database.getConnection();
        try {
            String query = "update users set profile_pic = ? where email = ? ;";
            PreparedStatement ps = con.prepareStatement(query);
            ps.setString(1, pic);
            ps.setString(2, email);

            if (ps.executeUpdate() != 0)
                flag = true;
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

    public boolean changeStatus(Status status) {
        boolean flag = false;
        Connection con = Database.getConnection();
        try {
            String query = "UPDATE users SET status_id=? WHERE email = ?";
            PreparedStatement ps = con.prepareStatement(query);
            ps.setInt(1, status.getStatusId());
            ps.setString(2, email);

            if (ps.executeUpdate() != 0) {
                this.status = status;
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

    public boolean signin() {
        boolean isAuthenticated = false;
        Connection con = Database.getConnection();
        try {
            
            String query = "select u.* , s.name as status from users u inner join status s on u.status_id = s.status_id where email = ? ;";
            PreparedStatement ps = con.prepareStatement(query);
            ps.setString(1, this.email);
            ResultSet rs = ps.executeQuery();

            // System.out.println(rs + "-" + "-" + this.password);
            if (rs.next()) {
                String encryptedPassword = rs.getString("password");
                // System.out.println(this.password + "-" + encryptedPassword);
                // System.out.println(spe.checkPassword(this.password, encryptedPassword));
                if (spe.checkPassword(this.password, encryptedPassword)) {
                    // System.out.println("password is matched -----");
                    this.userId = rs.getInt("user_id");
                    this.name = rs.getString("name");
                    this.email = rs.getString("email");
                    this.aboutMe = rs.getString("about_me");
                    this.profilePic = rs.getString("profile_pic");
                    this.phone = rs.getString("phone");
                    this.dob = rs.getDate("dob");
                    String g = rs.getString("gender");
                    if (g != null)
                        this.gender = g.charAt(0);
                    this.status = new Status(rs.getInt("status_id"), rs.getString("status"));
                    this.createdOn = rs.getDate("created_on");
                    this.isVerified = rs.getBoolean("is_verified");
                    Integer countryId = rs.getInt("country_id");

                    if (countryId != 0) {
                        setCountry(countryId);
                    }
                    isAuthenticated = true;


                    // Collect WishList
                    this.fetchWishlist();
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
        return isAuthenticated;
    }

    public static String getName(String email) {
        String name = null;
        Connection con = Database.getConnection();
        try {
            String query = "select name from users where email = ? ;";
            PreparedStatement ps = con.prepareStatement(query);
            ps.setString(1, email);

            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                name = rs.getString("name");
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        try {
            con.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return name;
    }

    public static boolean setNewPassword(String email, String newPassword) {
        Connection con = Database.getConnection();
        try {
            String encryptedPassword = spe.encryptPassword(newPassword);
            String query = "UPDATE users SET password = ? WHERE email = ?";
            PreparedStatement ps = con.prepareStatement(query);
            ps.setString(1, encryptedPassword);
            ps.setString(2, email);

            if (ps.executeUpdate() != 0) {
                return true;
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                con.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        return false;
    }

    public static boolean verifyEmail(String email, String code) {
        Connection con = Database.getConnection();
        try {
            String query = "select code from users where email = ?";

            PreparedStatement ps = con.prepareStatement(query);
            ps.setString(1, email);
            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                String current = rs.getString("code");
                if (current.equals(code)) {
                    String query1 = "UPDATE users SET code = NULL, is_verified = ? WHERE email = ?";
                    PreparedStatement ps1 = con.prepareStatement(query1);
                    ps1.setBoolean(1, true);
                    ps1.setString(2, email);
                    ps1.executeUpdate();
                    return true;
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }

    public static boolean setVerificationCodeDb(String code, String email) {
        Connection con = Database.getConnection();
        try {
            //
            String query = "UPDATE users SET code = ? WHERE email = ?";
            PreparedStatement ps = con.prepareStatement(query);
            ps.setString(1, code);
            ps.setString(2, email);
            if (ps.executeUpdate() != 0)
                return true;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }

    public boolean signUp() {
        boolean flag = false;
        Connection con = Database.getConnection();
        try {
            String query = "insert into users (name,email,password) value (?, ?, ?)";
            PreparedStatement ps = con.prepareStatement(query);
            ps.setString(1, name);
            ps.setString(2, email);
            ps.setString(3, spe.encryptPassword(password));

            if (ps.executeUpdate() != 0)
                flag = true;

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

    public String parseGender() {
        String temp = null;
        if (gender != null) {
            if (gender == 'M')
                temp = "Male";
            else if (gender == 'F')
                temp = "Female";
            else
                temp = "Other";
        }

        return temp;
    }

    // ############ Constructors #############
    public User(String email, String password) {
        this.email = email;
        this.password = password;
    }

    public User(String name, String email, String password) {
        this(email, password);
        this.name = name;
    }

    public User() {
        // Generally User Create Karne ke liye
    }

    // ######## Getters and Setters #######

    public TreeSet<WishList> getWishlist(){
        return this.wishlist;
    }

    public Country getCountry() {
        return country;
    }

    public void setCountry(Country country) {
        this.country = country;
    }

    private UserType userType;

    public Integer getUserId() {
        return userId;
    }

    public void setUserId(Integer userId) {
        this.userId = userId;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getProfilePic() {
        return profilePic;
    }

    public void setProfilePic(String profilePic) {
        this.profilePic = profilePic;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public Date getDob() {
        return dob;
    }

    public void setDob(Date dob) {
        this.dob = dob;
    }

    public Character getGender() {
        return gender;
    }

    public void setGender(Character gender) {
        this.gender = gender;
    }

    public Status getStatus() {
        return status;
    }

    public void setStatus(Status status) {
        this.status = status;
    }

    public Date getCreatedOn() {
        return createdOn;
    }

    public void setCreatedOn(Date createdOn) {
        this.createdOn = createdOn;
    }

    public UserType getUserType() {
        return userType;
    }

    public void setUserType(UserType userType) {
        this.userType = userType;
    }

    public boolean isVerified() {
        return isVerified;
    }

    public void setVerified(boolean isVerified) {
        this.isVerified = isVerified;
    }

    public String getAboutMe() {
        return aboutMe;
    }

    public void setAboutMe(String aboutMe) {
        this.aboutMe = aboutMe;
    }

    public static StrongPasswordEncryptor getSpe() {
        return spe;
    }

    public static void setSpe(StrongPasswordEncryptor spe) {
        User.spe = spe;
    }

    public Cart getDefaultCart() {
        if(this.defaultCart != null)return this.defaultCart;
        else if(this.userId != null){
            Cart temp = this.fetchDefaultCart();
            if(temp != null) return temp;
        }

        return createNewDefaultCart();
    }

    public void setDefaultCart(Cart defaultCart) {
        this.defaultCart = defaultCart;
    }

    public void setWishlist(TreeSet<WishList> wishlist) {
        this.wishlist = wishlist;
    }

    

}