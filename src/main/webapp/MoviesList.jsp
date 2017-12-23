<%-- <%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> --%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
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
		<h1>Movies Database Management</h1>
		<h2>
	      	<a href="new">Add New Movie</a>&nbsp;&nbsp;&nbsp;
		    <a href="list">List All Movies</a> <br><br>
		</h2>
	</center>
	
	<center>
    <div align="center">
        <table border="3" cellpadding="5" cellspacing="5" bordercolor="red">
            <caption><h2>List of Movies</h2></caption>
            <tr>
                <th>Movie Id</th>
                <th>Title</th>
                <th>Language</th>
                <th>Release Year</th>
                <th>Director</th>
                <th>Action</th>
            </tr>
            <c:forEach var="movie" items="${moviesList}">
                <tr>
                    <td><c:out value="${movie.id}" /></td>
                    <td><c:out value="${movie.title}" /></td>
                    <td><c:out value="${movie.language}" /></td>
                    <td><c:out value="${movie.releaseYear}" /></td>
                    <td><c:out value="${movie.director}" /></td>
                    <td>
                    	<a href="editMovie?id=<c:out value='${movie.id}' />">Edit</a>
                    	&nbsp;&nbsp;&nbsp;&nbsp;
                    	<a href="deleteMovie?id=<c:out value='${movie.id}' />">Delete</a>                    	
                    </td>
                </tr>
            </c:forEach>
        </table>
        <br>
        
        <%--For displaying Page numbers. The when condition does not display a link for the current page--%>
		<table border="1" cellpadding="5" cellspacing="5" bordercolor="blue">
			<%--For displaying Previous link except for the 1st page --%>
			<tr>
			<%-- <c:if test="${currentPage != 1}">
	        	<td><a href="?page=${currentPage - 1}">Previous</a></td>
	        </c:if> --%>
				<c:forEach begin="1" end="${noOfPages}" var="i">
					<c:choose>
						<c:when test="${currentPage eq i}">
							<td>${i}</td>
						</c:when>
						<c:otherwise>
							<td><a href="?page=${i}">${i}</a></td>
						</c:otherwise>
					</c:choose>
				</c:forEach>
			</tr>
			<%--For displaying Next link --%>
			 <c:if test="${currentPage lt noOfPages}">
				<td><a href="?page=${currentPage + 1}">Next</a></td>
			</c:if> 
		</table>
    </div>	
    </center>
</body>
</html>
