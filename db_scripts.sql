CREATE DATABASE moviesdb;
USE moviesdb;
 
CREATE TABLE movies (
  movieId int(11) NOT NULL AUTO_INCREMENT,
  title varchar(128) NOT NULL,
  language varchar(15) NOT NULL,
  releaseYear varchar(45) NOT NULL,
  director varchar(45) NOT NULL,
  PRIMARY KEY (movieId),
  UNIQUE KEY movieId_UNIQUE (movieId),
  UNIQUE KEY title_UNIQUE (title)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1