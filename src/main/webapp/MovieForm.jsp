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

/*
/* Created by Filipe Pina
 * Specific styles of signin, register, component
 */
/*
 * General styles
 */
#playground-container {
    height: 500px;
    overflow: hidden !important;
    -webkit-overflow-scrolling: touch;
}
body, html{
     height: 100%;
 	background-repeat: no-repeat;
 	background:url(https://i.ytimg.com/vi/4kfXjatgeEU/maxresdefault.jpg);
 	font-family: 'Oxygen', sans-serif;
	    background-size: cover;
}

.main{
 	margin:50px 15px;
}

h1.title { 
	font-size: 50px;
	font-family: 'Passion One', cursive; 
	font-weight: 400; 
}

hr{
	width: 10%;
	color: #fff;
}

.form-group{
	margin-bottom: 15px;
}

label{
	margin-bottom: 15px;
}

input,
input::-webkit-input-placeholder {
    font-size: 11px;
    padding-top: 3px;
}

.main-login{
 	background-color: #fff;
    /* shadows and rounded borders */
    -moz-border-radius: 2px;
    -webkit-border-radius: 2px;
    border-radius: 2px;
    -moz-box-shadow: 0px 2px 2px rgba(0, 0, 0, 0.3);
    -webkit-box-shadow: 0px 2px 2px rgba(0, 0, 0, 0.3);
    box-shadow: 0px 2px 2px rgba(0, 0, 0, 0.3);

}
.form-control {
    height: auto!important;
padding: 8px 12px !important;
}
.input-group {
    -webkit-box-shadow: 0px 2px 5px 0px rgba(0,0,0,0.21)!important;
    -moz-box-shadow: 0px 2px 5px 0px rgba(0,0,0,0.21)!important;
    box-shadow: 0px 2px 5px 0px rgba(0,0,0,0.21)!important;
}
#button {
    border: 1px solid #ccc;
    margin-top: 28px;
    padding: 6px 12px;
    color: #666;
    text-shadow: 0 1px #fff;
    cursor: pointer;
    -moz-border-radius: 3px 3px;
    -webkit-border-radius: 3px 3px;
    border-radius: 3px 3px;
    -moz-box-shadow: 0 1px #fff inset, 0 1px #ddd;
    -webkit-box-shadow: 0 1px #fff inset, 0 1px #ddd;
    box-shadow: 0 1px #fff inset, 0 1px #ddd;
    background: #f5f5f5;
    background: -moz-linear-gradient(top, #f5f5f5 0%, #eeeeee 100%);
    background: -webkit-gradient(linear, left top, left bottom, color-stop(0%, #f5f5f5), color-stop(100%, #eeeeee));
    background: -webkit-linear-gradient(top, #f5f5f5 0%, #eeeeee 100%);
    background: -o-linear-gradient(top, #f5f5f5 0%, #eeeeee 100%);
    background: -ms-linear-gradient(top, #f5f5f5 0%, #eeeeee 100%);
    background: linear-gradient(top, #f5f5f5 0%, #eeeeee 100%);
    filter: progid:DXImageTransform.Microsoft.gradient(startColorstr='#f5f5f5', endColorstr='#eeeeee', GradientType=0);
}
.main-center{
 	margin-top: 30px;
 	margin: 0 auto;
 	max-width: 400px;
    padding: 10px 40px;
	background:#009edf;
	    color: #FFF;
    text-shadow: none;
	-webkit-box-shadow: 0px 3px 5px 0px rgba(0,0,0,0.31);
-moz-box-shadow: 0px 3px 5px 0px rgba(0,0,0,0.31);
box-shadow: 0px 3px 5px 0px rgba(0,0,0,0.31);

}
span.input-group-addon i {
    color: #009edf;
    font-size: 17px;
}

.login-button{
	margin-top: 5px;
}

.login-register{
	font-size: 11px;
	text-align: center;
}

</style>
 
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.0.0/css/bootstrap.min.css"> 
<!-- Website Font style -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.6.1/css/font-awesome.min.css">
<link rel="stylesheet" href="style.css">
<!-- Google Fonts -->
<link href='https://fonts.googleapis.com/css?family=Passion+One' rel='stylesheet' type='text/css'>
<link href='https://fonts.googleapis.com/css?family=Oxygen' rel='stylesheet' type='text/css'>
  
</head>
<body>
	<center>
		<h1>Movie Database Management</h1>
         <h2> 
        	 <a href="new">Add New Movie</a>&nbsp;&nbsp;&nbsp;
        	 <a href="list">List All Movies</a><br><br>
         </h2> 
	</center>
    <div align="center" class="form-group">
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
            
           
			
		</div>
            
            
        </table>
        <!-- </form> -->
    </div>	
    
     <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
     <script src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.0.0/js/bootstrap.min.js"></script>
</body>
</html>
