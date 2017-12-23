package com.mymoviesdb.servlet;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang3.StringUtils;

import com.mymoviesdb.dao.MoviesDAO;
import com.mymoviesdb.model.Movie;

public class MyMoviesDBServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	private MoviesDAO moviesDao;

	@Override
	public void init() throws ServletException {
		String jdbcUrl = getServletContext().getInitParameter("jdbcUrl");
		String username = getServletContext().getInitParameter("username");
		String password = getServletContext().getInitParameter("password");
		moviesDao = new MoviesDAO(jdbcUrl, username, password);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String actionType = request.getServletPath();
		try {
			switch (actionType) {
			case "/login":
				openLoginPage(request, response);
				break;
			case "/doLogin":
				doLogin(request, response);
				break;
			case "/addMovie":
				insertMovie(request, response);
				break;
			case "/deleteMovie":
				deleteMovie(request, response);
				break;
			case "/editMovie":
				displayEditForm(request, response);
				break;
			case "/updateMovie":
				updateMovie(request, response);
				break;
			case "/new":
				displayNewForm(request, response);
				break;
			default:
				listMovies(request, response);
				break;
			}
		} catch (ServletException | SQLException e) {

		}
	}

	private void doLogin(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		if (StringUtils.isBlank(username) && StringUtils.isBlank(password)) {
			request.setAttribute("message", "Invalid username/password !!");
			response.sendRedirect("Login.jsp");
			return;
		} else if (username.equals("keerthi") && password.equals("keerthi")) {
			response.sendRedirect("MovieForm.jsp");
			return;
		} else {
			request.setAttribute("errorMessage", "Invalid username/password !!");
			RequestDispatcher view = request.getRequestDispatcher("Login.jsp");
			view.forward(request, response);
		}
	}

	/**
	 * Login process
	 * 
	 * @param request
	 * @param response
	 * @throws IOException
	 * @throws ServletException
	 */
	private void openLoginPage(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		RequestDispatcher view = request.getRequestDispatcher("Login.jsp");
		view.forward(request, response);
	}

	/** With Pagination **/
	private void listMovies(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException, SQLException {
		int page = 1;
		int recordsPerPage = 5;
		if (request.getParameter("page") != null) {
			page = Integer.parseInt(request.getParameter("page"));
		}
		List<Movie> moviesList = moviesDao.listAllMovies((page - 1) * recordsPerPage, recordsPerPage);
		int noOfRecords = moviesDao.getNoOfRecords();
		int noOfPages = (int) Math.ceil(noOfRecords * 1.0 / recordsPerPage);
		request.setAttribute("moviesList", moviesList);
		request.setAttribute("noOfPages", noOfPages);
		request.setAttribute("currentPage", page);
		RequestDispatcher dispatcher = request.getRequestDispatcher("MoviesList.jsp");
		dispatcher.forward(request, response);
	}

	private void displayNewForm(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		RequestDispatcher dispatcher = request.getRequestDispatcher("MovieForm.jsp");
		dispatcher.forward(request, response);
	}

	private void updateMovie(HttpServletRequest request, HttpServletResponse response)
			throws SQLException, IOException {
		int id = Integer.parseInt(request.getParameter("id"));
		String title = request.getParameter("title");
		String language = request.getParameter("language");
		String releaseYear = request.getParameter("releaseYear");
		String director = request.getParameter("director");
		Movie movie = new Movie(id, title, language, releaseYear, director);
		moviesDao.updateMovie(movie);
		response.sendRedirect("list");
	}

	private void displayEditForm(HttpServletRequest request, HttpServletResponse response)
			throws SQLException, ServletException, IOException {
		int id = Integer.parseInt(request.getParameter("id"));
		Movie currentMovie = moviesDao.getMovie(id);
		RequestDispatcher dispatcher = request.getRequestDispatcher("MovieForm.jsp");
		request.setAttribute("movie", currentMovie);
		dispatcher.forward(request, response);
	}

	private void deleteMovie(HttpServletRequest request, HttpServletResponse response)
			throws SQLException, IOException {
		int id = Integer.parseInt(request.getParameter("id"));
		Movie movie = new Movie(id);
		moviesDao.deleteMovie(movie);
		response.sendRedirect("list");
	}

	private void insertMovie(HttpServletRequest request, HttpServletResponse response)
			throws IOException, SQLException {
		String title = request.getParameter("title");
		String language = request.getParameter("language");
		String releaseYear = request.getParameter("releaseYear");
		String director = request.getParameter("director");
		Movie movie = new Movie(title, language, releaseYear, director);
		moviesDao.insertMovie(movie);
		response.sendRedirect("list");
	}

}
