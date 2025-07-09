package models;

import java.sql.Date;

public class Subscription {
    private Integer subscriptionId;
    private User user;
    private Course course;
    private Date purchaseDate;
    private Integer price;
    private Integer validityTill; // in months 
    private Status status;

    // ########## Getters and Setters ##########
    public Integer getSubscriptionId() {
        return subscriptionId;
    }

    public void setSubscriptionId(Integer subscriptionId) {
        this.subscriptionId = subscriptionId;
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

    public Date getPurchaseDate() {
        return purchaseDate;
    }

    public void setPurchaseDate(Date purchaseDate) {
        this.purchaseDate = purchaseDate;
    }

    public Integer getPrice() {
        return price;
    }

    public void setPrice(Integer price) {
        this.price = price;
    }

    public Integer getValidityTill() {
        return validityTill;
    }

    public void setValidityTill(Integer validityTill) {
        this.validityTill = validityTill;
    }

    public Status getStatus() {
        return status;
    }

    public void setStatus(Status status) {
        this.status = status;
    }


    
}
