<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
	<title>Movies Database Application</title>
<style>
.button {
	background: #4e9caf none repeat scroll 0 0;
	border-radius: 5px;
	color: initial;
	display: block;
	font-size: 16px;
	font-weight: bold;
	height: 25px;
	padding: 10px;
	text-align: center;
	width: 153px;
}
</style>
  
</head>
<body>
	<center>
		<h1>Movie Database Management</h1>
         <h2> 
        	 <a href="new">Add New Movie</a>&nbsp;&nbsp;&nbsp;
        	 <a href="list">List All Movies</a><br><br>
         </h2> 
	</center>
    <div align="center">
		<c:if test="${movie != null}">
			<form action="updateMovie" method="post">
        </c:if>
        <c:if test="${movie == null}">
			<form action="addMovie" method="post">
        </c:if>
        <table border="1" cellpadding="5">
            <caption>
            	<h2>
            		<c:if test="${movie != null}">
            			Edit Movie
            		</c:if>
            		<c:if test="${movie == null}">
            			Add New Movie
            		</c:if>
            	</h2>
            </caption>
        		<c:if test="${movie != null}">
        			<input type="hidden" name="id" value="<c:out value='${movie.id}' />" />
        		</c:if>            
            <tr>
                <th>Title: </th>
                <td>
                	<input type="text" name="title" size="45" value="<c:out value='${movie.title}' />"/>
                </td>
            </tr>
            <tr>
                <th>Language: </th>
                <td>
                	<select name="language">
                		<option value="unknown">---------</option>
						<option value="Kannada">Kannada</option>
						<option value="Kannada">English</option>
						<option value="Hindi">Hindi</option>
						<option value="Telugu">Telugu</option>
						<option value="Malayalam">Malayalam</option>
						<option value="Tamil">Tamil</option>
				</select>
				</td>
            </tr>
            <tr>
                <th>Release Year: </th>
                <td>
                	<input type="text" name="releaseYear" size="5" maxlength="4" value="<c:out value='${movie.releaseYear}' />"
                	/>
                </td>
            </tr>
            <tr>
                <th>Director: </th>
                <td>
                	<input type="text" name="director" size="45" value="<c:out value='${movie.director}' />"
                	/>
                </td>
            </tr>
            <tr>
                <th>Rating: </th>
                <td>
                	<span class="rating">
					  <input id="rating5" type="radio" name="rating" value="5">
					  <input id="rating4" type="radio" name="rating" value="4">
					  <input id="rating3" type="radio" name="rating" value="3">
					  <input id="rating2" type="radio" name="rating" value="2">
					  <input id="rating1" type="radio" name="rating" value="1">
					</span>
                </td>
            </tr>
            <tr>
            	<td colspan="2" align="center">
            		<input type="submit" value="Save" />
            	</td>
            </tr>
        </table>
        <!-- </form> -->
    </div>	
</body>
</html>
