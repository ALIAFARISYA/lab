package lab6.com;

import java.io.Serializable;
import java.util.regex.Pattern;
import java.util.regex.Matcher;

public class Student implements Serializable {
    private String stuno;
    private String stuname;
    private String stuprogram;
    
    private static final String STUNO_PATTERN = "^[A-Z]{2}[0-9]+$";
    
    public Student() {}
    
    public String getStuno() {
        return stuno;
    }
    
    public void setStuno(String stuno) {
        // Validate using regular expression
        if (isValidStuno(stuno)) {
            this.stuno = stuno;
        } else {
            this.stuno = null;
        }
    }
    
    public String getStuname() {
        return stuname;
    }
    
    public void setStuname(String stuname) {
        this.stuname = stuname;
    }
    
    public String getStuprogram() {
        return stuprogram;
    }
    
    public void setStuprogram(String stuprogram) {
        this.stuprogram = stuprogram;
    }
    
    public boolean isValidStuno(String stuno) {
        if (stuno == null) return false;
        Pattern pattern = Pattern.compile(STUNO_PATTERN);
        Matcher matcher = pattern.matcher(stuno);
        return matcher.matches();
    }
    
    public boolean isValid() {
        return isValidStuno(this.stuno) && 
               stuname != null && !stuname.trim().isEmpty() &&
               stuprogram != null && !stuprogram.trim().isEmpty();
    }
}