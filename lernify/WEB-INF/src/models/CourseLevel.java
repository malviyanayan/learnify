package models;

public class CourseLevel {
    private Integer courseLevelId;
    private String name;


    public CourseLevel(Integer courseLevelId,String name) {
        this.courseLevelId = courseLevelId;
        this.name = name;
    }

    public Integer getCourseLevelId() {
        return courseLevelId;
    }
    public void setCourseLevelId(Integer courseLevelId) {
        this.courseLevelId = courseLevelId;
    }
    public String getName() {
        return name;
    }
    public void setName(String name) {
        this.name = name;
    }
}
