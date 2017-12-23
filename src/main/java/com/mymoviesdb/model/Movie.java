package com.mymoviesdb.model;

import java.io.Serializable;

public class Movie implements Serializable {

	private static final long serialVersionUID = 1L;

	private int id;
	private String title;
	private String language;
	private String releaseYear;
	private String director;

	public Movie() {

	}

	public Movie(int id) {
		this.id = id;
	}
	
	public Movie(String title, String language, String releaseYear, String director) {
		this.title = title;
		this.language = language;
		this.releaseYear = releaseYear;
		this.director = director;
	}

	public Movie(int id, String title, String language, String releaseYear, String director) {
		this.id = id;
		this.title = title;
		this.language = language;
		this.releaseYear = releaseYear;
		this.director = director;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}
	
	public String getLanguage() {
		return language;
	}

	public void setLanguage(String language) {
		this.language = language;
	}

	public String getReleaseYear() {
		return releaseYear;
	}

	public void setReleaseYear(String releaseYear) {
		this.releaseYear = releaseYear;
	}

	public String getDirector() {
		return director;
	}

	public void setDirector(String director) {
		this.director = director;
	}

}
