package com.cognizant.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.cognizant.bean.ProfileBean;

public class ProfileDAO {
	public static Connection Connect() throws Exception {
		Connection conn = null;
		Class.forName("com.mysql.jdbc.Driver");
		String url = "jdbc:mysql://localhost:3306/test";
		conn = DriverManager.getConnection(url, "root", "root");
		return conn;

	}

	public int insert(ProfileBean pdt) throws Exception {
		Connection conn = Connect();
		String insertQuery = "insert into product(product_id,product_category,product_name,product_desc,product_price,admin_name) values(?,?,?,?,?,?)";
		PreparedStatement pstmt = conn.prepareStatement(insertQuery);

		pstmt.setInt(1, pdt.getProduct_id());
		pstmt.setString(2, pdt.getProduct_category());
		pstmt.setString(3, pdt.getProduct_name());
		pstmt.setString(4, pdt.getProduct_desc());
		pstmt.setInt(5, pdt.getProduct_price());
		pstmt.setString(6,pdt.getAdmin_name());
		int insertStatus = 0;
		insertStatus = pstmt.executeUpdate();

		return insertStatus;
	}

	public int delete(int product_id) throws Exception {
		Connection conn = Connect();
		String deleteQuery = "delete from product where product_id=" + product_id;
		int deleteStatus = 0;
		Statement stmt = conn.createStatement();
		deleteStatus = stmt.executeUpdate(deleteQuery);
		return deleteStatus;
	}

	public int update(ProfileBean pdt) throws Exception {
		Connection conn = Connect();
		String updateQuery = "update profile set product_category=?,product_name=?,product_desc=?,product_price where product_id=?";
		PreparedStatement pstmt = conn.prepareStatement(updateQuery);
		pstmt.setInt(1, pdt.getProduct_id());
		pstmt.setString(2, pdt.getProduct_category());
		pstmt.setString(3, pdt.getProduct_name());
		pstmt.setString(4, pdt.getProduct_desc());
		pstmt.setInt(5, pdt.getProduct_price());

		int updateStatus = 0;
		updateStatus = pstmt.executeUpdate();
		return updateStatus;
	}

	public ProfileBean read(String product_id) throws Exception {
		Connection conn = Connect();
		String readQuery = "select * from product where product_id= '" + product_id + "'";
		Statement stmt = conn.createStatement();
		ResultSet rs = stmt.executeQuery(readQuery);
		ProfileBean pdt = new ProfileBean();
		if (rs.next()) {
			pdt.setProduct_id(rs.getInt(1));
			pdt.setProduct_category(rs.getString(2));
			pdt.setProduct_name(rs.getString(3));
			pdt.setProduct_desc(rs.getString(4));
			pdt.setProduct_price(rs.getInt(5));
		}
		return pdt;
	}

	public List<ProfileBean> readAll() throws Exception {

		List<ProfileBean> pdtList = new ArrayList<ProfileBean>();
		Connection conn = Connect();
		String readQuery = "select * from product ";
		Statement stmt = conn.createStatement();
		ResultSet rs = stmt.executeQuery(readQuery);
		while (rs.next()) {
			ProfileBean pdt = new ProfileBean();

			pdt.setProduct_id(rs.getInt(1));
			pdt.setProduct_category(rs.getString(2));
			pdt.setProduct_name(rs.getString(3));
			pdt.setProduct_desc(rs.getString(4));
			pdt.setProduct_price(rs.getInt(5));
			pdtList.add(pdt);
		}
		return pdtList;
	}
}
