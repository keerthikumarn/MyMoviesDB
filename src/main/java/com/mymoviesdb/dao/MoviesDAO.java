package com.mymoviesdb.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.mymoviesdb.dbconnection.ConnectionManager;
import com.mymoviesdb.model.Movie;

public class MoviesDAO {

	private String jdbcUrl;
	private String username;
	private String password;
	private Connection connection;

	private int noOfRecords = 0;

	public MoviesDAO(String jdbcUrl, String username, String password) {
		this.jdbcUrl = jdbcUrl;
		this.username = username;
		this.password = password;
	}

	private void connect() throws SQLException {
		System.out.println("Connecting to the db !");
		if (connection == null || connection.isClosed()) {
/*			try {
				Class.forName("com.mysql.jdbc.Driver");
			} catch (ClassNotFoundException e) {
				throw new SQLException(e);
			}
*/			connection = ConnectionManager.getDBConnection(jdbcUrl, username, password);
		}
	}

	private void disconnect() throws SQLException {
		if (connection != null && !connection.isClosed()) {
			connection.close();
		}
	}

	public void insertMovie(Movie movie) throws SQLException {
		String insertSql = "INSERT INTO movies (title, language, releaseYear, director) VALUES (?, ?, ?, ?)";
		connect();
		PreparedStatement statement = connection.prepareStatement(insertSql);
		statement.setString(1, movie.getTitle());
		statement.setString(2, movie.getLanguage());
		statement.setString(3, movie.getReleaseYear());
		statement.setString(4, movie.getDirector());
		boolean rowInserted = statement.executeUpdate() > 0;
		statement.close();
		disconnect();
	}

	public List<Movie> listAllMovies(int offset, int noOfRecords) throws SQLException {
		List<Movie> moviesList = new ArrayList<>();
		String sql = "SELECT SQL_CALC_FOUND_ROWS * FROM movies LIMIT "+ offset + ", " + noOfRecords;
		connect();
		Statement statement = connection.createStatement();
		ResultSet rs = statement.executeQuery(sql);

		while (rs.next()) {
			int id = rs.getInt("movieId");
			String title = rs.getString("title");
			String language = rs.getString("language");
			String releaseyear = rs.getString("releaseyear");
			String director = rs.getString("director");
			Movie movie = new Movie(id, title, language, releaseyear, director);
			moviesList.add(movie);
		}
		rs.close();
		
		rs = statement.executeQuery("SELECT FOUND_ROWS()");
		if(rs.next()){
			this.noOfRecords = rs.getInt(1);
		}
		
		statement.close();
		disconnect();
		return moviesList;
	}

	public void updateMovie(Movie movie) throws SQLException {
		String sql = "UPDATE movies SET title = ?, language = ?, releaseYear = ?, director = ?";
		sql += " WHERE movieId = ?";
		connect();

		PreparedStatement statement = connection.prepareStatement(sql);
		statement.setString(1, movie.getTitle());
		statement.setString(2, movie.getLanguage());
		statement.setString(3, movie.getReleaseYear());
		statement.setString(4, movie.getDirector());
		statement.setInt(5, movie.getId());

		boolean rowUpdated = statement.executeUpdate() > 0;
		statement.close();
		disconnect();
		// return rowUpdated;
	}

	public Movie getMovie(int id) throws SQLException {
		Movie movie = null;
		String sql = "SELECT * FROM movies WHERE movieId = ?";
		connect();
		PreparedStatement statement = connection.prepareStatement(sql);
		statement.setInt(1, id);
		ResultSet rs = statement.executeQuery();
		if (rs.next()) {
			String title = rs.getString("title");
			String language = rs.getString("language");
			String releaseYear = rs.getString("releaseYear");
			String director = rs.getString("director");
			movie = new Movie(id, title, language, releaseYear, director);
		}
		rs.close();
		statement.close();
		return movie;
	}

	public void deleteMovie(Movie movie) throws SQLException {
		String sql = "DELETE FROM movies where movieId = ?";
		connect();
		PreparedStatement statement = connection.prepareStatement(sql);
		statement.setInt(1, movie.getId());
		// boolean rowDeleted = statement.executeUpdate() > 0;
		statement.executeUpdate();
		statement.close();
		disconnect();
		// return rowDeleted;
	}

	public int getNoOfRecords() {
		return noOfRecords;
	}
}
