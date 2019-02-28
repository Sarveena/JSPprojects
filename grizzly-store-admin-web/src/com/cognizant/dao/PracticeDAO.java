package com.cognizant.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.cognizant.bean.PracticeBean;

public class PracticeDAO {
	public static Connection Connect() throws Exception {
		Connection conn = null;
		Class.forName("com.mysql.jdbc.Driver");
		String url = "jdbc:mysql://localhost:3306/test";
		conn = DriverManager.getConnection(url, "root", "root");
		return conn;

	}

	public int insert(PracticeBean profile) throws Exception {
		Connection conn = Connect();
		String insertQuery = "insert into profile values(?,?,?,?)";
		PreparedStatement pstmt = conn.prepareStatement(insertQuery);

		pstmt.setInt(1, profile.getId());
		pstmt.setString(2, profile.getName());
		pstmt.setString(3, profile.getDesignation());
		pstmt.setString(4, profile.getOffice());
		int insertStatus = 0;
		insertStatus = pstmt.executeUpdate();

		return insertStatus;
	}

	public int delete(int admin_name) throws Exception {
		Connection conn = Connect();
		String deleteQuery = "delete from profile where admin_name=" + admin_name;
		int deleteStatus = 0;
		Statement stmt = conn.createStatement();
		deleteStatus = stmt.executeUpdate(deleteQuery);
		return deleteStatus;
	}

	public int update(PracticeBean profile) throws Exception {
		Connection conn = Connect();
		String updateQuery = "update profile set admin_id=?,admin_desig=?,admin_office=? where admin_name=?";
		PreparedStatement pstmt = conn.prepareStatement(updateQuery);
		pstmt.setInt(1, profile.getId());
		pstmt.setString(2, profile.getDesignation());
		pstmt.setString(3, profile.getOffice());
		pstmt.setString(4, profile.getName());
		
		int updateStatus = 0;
		updateStatus = pstmt.executeUpdate();
		return updateStatus;
	}

	public PracticeBean read(String admin_name) throws Exception {
		Connection conn = Connect();
		String readQuery = "select * from profile where admin_name= '" + admin_name + "'";
		Statement stmt = conn.createStatement();
		ResultSet rs = stmt.executeQuery(readQuery);
		PracticeBean profile = new PracticeBean();
		if (rs.next()) {
			profile.setId(rs.getInt(1));
			profile.setName(rs.getString(2));
			profile.setDesignation(rs.getString(3));
			profile.setOffice(rs.getString(4));
		}
		return profile;
	}

	public List<PracticeBean> readAll() throws Exception {

		List<PracticeBean> profileList = new ArrayList<PracticeBean>();
		Connection conn = Connect();
		String readQuery = "select * from profile ";
		Statement stmt = conn.createStatement();
		ResultSet rs = stmt.executeQuery(readQuery);
		while (rs.next()) {
			PracticeBean profile = new PracticeBean();

			profile.setId(rs.getInt(1));
			profile.setName(rs.getString(2));
			profile.setDesignation(rs.getString(3));
			profile.setOffice(rs.getString(4));
			profileList.add(profile);
		}
		return profileList;
	}

}
