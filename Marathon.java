package lab6.com;

import java.io.Serializable;
import java.sql.Timestamp;

public class Marathon implements Serializable {
    private int id;
    private String fullname;
    private String email;
    private String phone;
    private String category;
    private String tshirtSize;
    private Timestamp registrationDate;
    
    public Marathon() {
        // Default constructor
    }
    
    // Constructor without ID (for new registrations)
    public Marathon(String fullname, String email, String phone, 
                    String category, String tshirtSize) {
        this.fullname = fullname;
        this.email = email;
        this.phone = phone;
        this.category = category;
        this.tshirtSize = tshirtSize;
    }
    
    // Getters and Setters
    public int getId() {
        return id;
    }
    
    public void setId(int id) {
        this.id = id;
    }
    
    public String getFullname() {
        return fullname;
    }
    
    public void setFullname(String fullname) {
        this.fullname = fullname;
    }
    
    public String getEmail() {
        return email;
    }
    
    public void setEmail(String email) {
        this.email = email;
    }
    
    public String getPhone() {
        return phone;
    }
    
    public void setPhone(String phone) {
        this.phone = phone;
    }
    
    public String getCategory() {
        return category;
    }
    
    public void setCategory(String category) {
        this.category = category;
    }
    
    public String getTshirtSize() {
        return tshirtSize;
    }
    
    public void setTshirtSize(String tshirtSize) {
        this.tshirtSize = tshirtSize;
    }
    
    public Timestamp getRegistrationDate() {
        return registrationDate;
    }
    
    public void setRegistrationDate(Timestamp registrationDate) {
        this.registrationDate = registrationDate;
    }
    
    public double getFee() {
        switch(category) {
            case "5km Fun Run": return 30.00;
            case "10km Competitive": return 50.00;
            case "21km Half Marathon": return 80.00;
            case "42km Full Marathon": return 120.00;
            default: return 0.00;
        }
    }
    
    @Override
    public String toString() {
        return "Marathon{" + "id=" + id + ", fullname=" + fullname + 
               ", email=" + email + ", category=" + category + '}';
    }
}