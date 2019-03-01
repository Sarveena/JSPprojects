package com.cognizant.VendorProdDAO;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.cognizant.VendorProdBean.*;

public class ProductDAO {
	public static Connection Connect() throws Exception {
		Connection conn = null;
		Class.forName("com.mysql.jdbc.Driver");
		String url = "jdbc:mysql://localhost:3306/test";
		conn = DriverManager.getConnection(url, "root", "root");
		return conn;

	}

	public int insert(ProductBean product) throws Exception {
		Connection conn = Connect();
		String insertQuery = "insert into product values(?,?,?,?,?,?)";
		PreparedStatement pstmt = conn.prepareStatement(insertQuery);

		pstmt.setInt(1, product.getProduct_id());
		pstmt.setString(2, product.getProduct_category());
		pstmt.setString(3, product.getProduct_name());
		pstmt.setString(4, product.getProduct_desc());
		pstmt.setInt(5, product.getProduct_price());
		pstmt.setString(6, product.getAdmin_name());
		int insertStatus = 0;
		insertStatus = pstmt.executeUpdate();

		return insertStatus;
	}

	public int delete(int product_id) throws Exception {
		Connection conn = Connect();
		String deleteQuery = "delete from product where product_id=" + product_id;
		//System.out.println(product_id);
		int deleteStatus = 0;
		Statement stmt = conn.createStatement();
		deleteStatus = stmt.executeUpdate(deleteQuery);
//		String deleteQuery1 = "delete from vendor_profile where product_id=" + product_id;
//		deleteStatus = stmt.executeUpdate(deleteQuery1);
		return deleteStatus;
	}

	public int update(ProductBean product) throws Exception {
		Connection conn = Connect();
		String updateQuery = "update product set product_category=?,product_name=?,product_des=?,product_price=? where product_id=?";
		PreparedStatement pstmt = conn.prepareStatement(updateQuery);
		pstmt.setInt(5, product.getProduct_id());
		pstmt.setString(1, product.getProduct_category());
		pstmt.setString(2, product.getProduct_name());
		pstmt.setString(3, product.getProduct_desc());
		pstmt.setInt(4, product.getProduct_price());

		int updateStatus = 0;
		updateStatus = pstmt.executeUpdate();
		return updateStatus;
	}

	public ProductBean read(int product_id) throws Exception {
		Connection conn = Connect();
		String readQuery = "select * from product where product_id= " + product_id;
		Statement stmt = conn.createStatement();
		ResultSet rs = stmt.executeQuery(readQuery);
		ProductBean product = new ProductBean();
		if (rs.next()) {
			product.setProduct_id(rs.getInt(1));
			product.setProduct_category(rs.getString(2));
			product.setProduct_name(rs.getString(3));
			product.setProduct_desc(rs.getString(4));
			product.setProduct_price(rs.getInt(5));
		}
		return product;
	}

	public List<ProductBean> readAll() throws Exception {

		List<ProductBean> productList = new ArrayList<ProductBean>();
		Connection conn = Connect();
		String readQuery = "select * from product ";
		Statement stmt = conn.createStatement();
		ResultSet rs = stmt.executeQuery(readQuery);
		while (rs.next()) {
			ProductBean product = new ProductBean();

			product.setProduct_id(rs.getInt(1));
			product.setProduct_category(rs.getString(2));
			product.setProduct_name(rs.getString(3));
			product.setProduct_desc(rs.getString(4));
			product.setProduct_price(rs.getInt(5));
			productList.add(product);
		}
		return productList;
	}

}
