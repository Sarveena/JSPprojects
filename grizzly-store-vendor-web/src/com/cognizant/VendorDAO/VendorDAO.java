
package com.cognizant.VendorDAO;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.cognizant.VendorBean.*;

public class VendorDAO {
                
                public static Connection Connect() throws Exception {
                                Connection conn = null;
                                Class.forName("com.mysql.jdbc.Driver");
                                String url = "jdbc:mysql://localhost:3306/test";
                                conn = DriverManager.getConnection(url, "root", "root");
                                return conn;

                }

                public int insert(VendorBean profile) throws Exception {
                                Connection conn = Connect();
                                String insertQuery = "insert into vendor_profile values(?,?,?,?,?)";
                                PreparedStatement pstmt = conn.prepareStatement(insertQuery);

                                pstmt.setInt(1, profile.getVendor_id());
                                pstmt.setString(2, profile.getVendor_name());
                                pstmt.setInt(3, profile.getVendor_rating());
                                pstmt.setInt(4, profile.getVendor_contact());
                                pstmt.setString(5, profile.getVendor_adrs());
                                int insertStatus = 0;
                                insertStatus = pstmt.executeUpdate();

                                return insertStatus;
                }

                public int delete(int vendor_name) throws Exception {
                                Connection conn = Connect();
                                String deleteQuery = "delete from vendor_profile where vendor_name=" + vendor_name;
                                int deleteStatus = 0;
                                Statement stmt = conn.createStatement();
                                deleteStatus = stmt.executeUpdate(deleteQuery);
                                return deleteStatus;
                }

                public int update(VendorBean profile) throws Exception {
                                Connection conn = Connect();
                                String updateQuery = "update vendor_profile set vendor_id=?,vendor_rating=?,vendor_contact=?,vendor_address=? where vendor_name=?";
                                PreparedStatement pstmt = conn.prepareStatement(updateQuery);
                                pstmt.setInt(1, profile.getVendor_id());
                                pstmt.setDouble(2, profile.getVendor_rating());
                                pstmt.setInt(3, profile.getVendor_contact());
                                
                                pstmt.setString(4, profile.getVendor_adrs());
                                pstmt.setString(5, profile.getVendor_name());
                                
                                int updateStatus = 0;
                                updateStatus = pstmt.executeUpdate();
                                return updateStatus;
                }

                public VendorBean read(String vendor_name) throws Exception {
                                Connection conn = Connect();
                                String readQuery = "select * from vendor_profile where vendor_name= '" + vendor_name + "'";
                                Statement stmt = conn.createStatement();
                                ResultSet rs = stmt.executeQuery(readQuery);
                                VendorBean profile = new VendorBean();
                                if (rs.next()) {
                                                profile.setVendor_id(rs.getInt(1));
                                                profile.setVendor_name(rs.getString(2));
                                                profile.setVendor_rating(rs.getInt(3));
                                                profile.setVendor_contact(rs.getInt(4));
                                                profile.setVendor_adrs(rs.getString(5));
                                }
                                return profile;
                }

                public List<VendorBean> readAll() throws Exception {

                                List<VendorBean> profileList = new ArrayList<VendorBean>();
                                Connection conn = Connect();
                                String readQuery = "select * from vendor_profile ";
                                Statement stmt = conn.createStatement();
                                ResultSet rs = stmt.executeQuery(readQuery);
                                while (rs.next()) {
                                                VendorBean profile = new VendorBean();

                                                profile.setVendor_id(rs.getInt(1));
                                                profile.setVendor_name(rs.getString(2));
                                                profile.setVendor_rating(rs.getInt(3));
                                                profile.setVendor_contact(rs.getInt(4));
                                                profile.setVendor_adrs(rs.getString(5));
                                                profileList.add(profile);
                                }
                                return profileList;
                }

}


