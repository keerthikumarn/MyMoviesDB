package com.mymoviesdb.dbconnection;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class ConnectionManager {

	private static Connection conn;
	

	public static Connection getDBConnection(String jdbcUrl, String username, String password) throws SQLException {
		try {
			Class.forName("com.mysql.jdbc.Driver");
		} catch (ClassNotFoundException e) {
			throw new SQLException(e);
		}
		conn = DriverManager.getConnection(jdbcUrl, username, password);
		return conn;
	}
}
