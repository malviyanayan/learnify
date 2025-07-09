package models;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import utils.Database;

public class Country {
    private Integer countryId;
    private String name;
    private String flag;
    private Integer countryCode;

    // ########### Get All Countries
    public static ArrayList<Country> getAllCountries(){
        ArrayList<Country> countries = new ArrayList<>();
        Connection con = Database.getConnection();
        try{
            String query = "select * from countries";
            PreparedStatement ps = con.prepareStatement(query);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                Country country = new Country(
                    rs.getInt("country_id"),
                    rs.getString("name"),
                    rs.getString("flag"),
                    rs.getInt("country_code")
                );
                countries.add(country);
            }

        }catch(SQLException e){
            e.printStackTrace();
        }

        try{con.close();}catch(SQLException e){e.printStackTrace();}

        return countries;
    }
    
    //  ###### Construtor ######

    

    Country(int countryId,String name){
        this.countryId = countryId;
        this.name = name;
    }



    public Country(Integer countryId, String name, String flag, Integer countryCode) {
        this.countryId = countryId;
        this.name = name;
        this.flag = flag;
        this.countryCode = countryCode;
    }

    //  ###### Getters and Setters ######
    public Integer getCountryId() {
        return countryId;
    }

    public void setCountryId(Integer countryId) {
        this.countryId = countryId;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getFlag() {
        return flag;
    }

    public void setFlag(String flag) {
        this.flag = flag;
    }

    public Integer getCountryCode() {
        return countryCode;
    }

    public void setCountryCode(Integer countryCode) {
        this.countryCode = countryCode;
    }


    
}
