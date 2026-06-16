package lab6.com;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class MarathonDAO {
    
    // CREATE: Insert a new marathon registration
    public boolean insertMarathon(Marathon marathon) {
        String sql = "INSERT INTO marathon (fullname, email, phone, category, tshirt_size) VALUES (?, ?, ?, ?, ?)";
        
        try (Connection conn = DatabaseConnection.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
            
            pstmt.setString(1, marathon.getFullname());
            pstmt.setString(2, marathon.getEmail());
            pstmt.setString(3, marathon.getPhone());
            pstmt.setString(4, marathon.getCategory());
            pstmt.setString(5, marathon.getTshirtSize());
            
            int result = pstmt.executeUpdate();
            return result > 0;
            
        } catch (ClassNotFoundException | SQLException e) {
            System.err.println("Error inserting marathon record: " + e.getMessage());
            return false;
        }
    }
    
    // READ: Get all marathon registrations
    public List<Marathon> getAllMarathons() {
        List<Marathon> marathons = new ArrayList<>();
        String sql = "SELECT * FROM marathon ORDER BY registration_date DESC";
        
        try (Connection conn = DatabaseConnection.getConnection();
             Statement stmt = conn.createStatement();
             ResultSet rs = stmt.executeQuery(sql)) {
            
            while (rs.next()) {
                Marathon marathon = new Marathon();
                marathon.setId(rs.getInt("id"));
                marathon.setFullname(rs.getString("fullname"));
                marathon.setEmail(rs.getString("email"));
                marathon.setPhone(rs.getString("phone"));
                marathon.setCategory(rs.getString("category"));
                marathon.setTshirtSize(rs.getString("tshirt_size"));
                marathon.setRegistrationDate(rs.getTimestamp("registration_date"));
                marathons.add(marathon);
            }
            
        } catch (ClassNotFoundException | SQLException e) {
            System.err.println("Error retrieving marathon records: " + e.getMessage());
        }
        
        return marathons;
    }
    
    // READ: Get marathon registration by ID
    public Marathon getMarathonById(int id) {
        String sql = "SELECT * FROM marathon WHERE id = ?";
        
        try (Connection conn = DatabaseConnection.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
            
            pstmt.setInt(1, id);
            ResultSet rs = pstmt.executeQuery();
            
            if (rs.next()) {
                Marathon marathon = new Marathon();
                marathon.setId(rs.getInt("id"));
                marathon.setFullname(rs.getString("fullname"));
                marathon.setEmail(rs.getString("email"));
                marathon.setPhone(rs.getString("phone"));
                marathon.setCategory(rs.getString("category"));
                marathon.setTshirtSize(rs.getString("tshirt_size"));
                marathon.setRegistrationDate(rs.getTimestamp("registration_date"));
                return marathon;
            }
            
        } catch (ClassNotFoundException | SQLException e) {
            System.err.println("Error retrieving marathon record: " + e.getMessage());
        }
        
        return null;
    }
    
    // DELETE: Remove a marathon registration
    public boolean deleteMarathon(int id) {
        String sql = "DELETE FROM marathon WHERE id = ?";
        
        try (Connection conn = DatabaseConnection.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
            
            pstmt.setInt(1, id);
            int result = pstmt.executeUpdate();
            return result > 0;
            
        } catch (ClassNotFoundException | SQLException e) {
            System.err.println("Error deleting marathon record: " + e.getMessage());
            return false;
        }
    }
    
    // UPDATE: Modify a marathon registration
    public boolean updateMarathon(Marathon marathon) {
        String sql = "UPDATE marathon SET fullname = ?, email = ?, phone = ?, category = ?, tshirt_size = ? WHERE id = ?";
        
        try (Connection conn = DatabaseConnection.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
            
            pstmt.setString(1, marathon.getFullname());
            pstmt.setString(2, marathon.getEmail());
            pstmt.setString(3, marathon.getPhone());
            pstmt.setString(4, marathon.getCategory());
            pstmt.setString(5, marathon.getTshirtSize());
            pstmt.setInt(6, marathon.getId());
            
            int result = pstmt.executeUpdate();
            return result > 0;
            
        } catch (ClassNotFoundException | SQLException e) {
            System.err.println("Error updating marathon record: " + e.getMessage());
            return false;
        }
    }
    
    // Get total count of registrations
    public int getTotalRegistrations() {
        String sql = "SELECT COUNT(*) FROM marathon";
        
        try (Connection conn = DatabaseConnection.getConnection();
             Statement stmt = conn.createStatement();
             ResultSet rs = stmt.executeQuery(sql)) {
            
            if (rs.next()) {
                return rs.getInt(1);
            }
            
        } catch (ClassNotFoundException | SQLException e) {
            System.err.println("Error getting count: " + e.getMessage());
        }
        
        return 0;
    }
}