package models;

public class Status {
    private Integer statusId;
    private String name;


    public Status(String name){
        this.name = name;
    }

    public Status(Integer statusId, String name) {
        this.statusId = statusId;
        this.name = name;
    }

    // ####### Getters and Setters #######
    public Integer getStatusId() {
        return statusId;
    }

    public void setStatusId(Integer statusId) {
        this.statusId = statusId;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }


    
}
