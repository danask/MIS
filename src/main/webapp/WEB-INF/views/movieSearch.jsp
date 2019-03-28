<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<% String role = (String)request.getAttribute("sessionInfo"); %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>	    
	    <title>Movie Search</title>
	    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
	    <style>
	    	#description {
			  width: 100%;
			  height: 5em;
			  padding: 12px 20px;

			}
	    	li:nth-of-type(4){margin-left: 25em;}
		</style>
	
	<body>
		
		<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
		  <a class="navbar-brand" href="home"><strong>MIS</strong></a>
		  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
		    <span class="navbar-toggler-icon"></span>
		  </button>
		  <div class="collapse navbar-collapse" id="navbarNav">
		    <ul class="navbar-nav">
<!-- 		      <li class="nav-item active">
		        <a class="nav-link" href="home">Home <span class="sr-only">(current)</span></a>
		      </li> -->
		      
   				  <li class="nav-item">
			        <a class="nav-link" href="searchMovie">Search</a>
			      </li>   		      
		      
   			   <%if(role.equals("Movie Database Administrator")	|| role.equals("Administrator")){%>

				  <li class="nav-item">
			        <a class="nav-link" href="listMovie">Movie List</a>
			      </li>   			   
			      <li class="nav-item">
			        <a class="nav-link" href="addMovie">Movie Database</a>
			      </li>  
		       <%}%>
		       			         
		      <li class="nav-item">
		        <a class="nav-link" href="addUser">User Registration</a>
		      </li>	
		       		
			   <%if(role.equals("Administrator")){%>
		      	  <li class="nav-item">
			        <a class="nav-link" href="listRole">Admin</a>
			      </li>
		       <%}%>
			   
			   <%if(role.equals("User Manager")	|| role.equals("Administrator")){%>			   
			      <li class="nav-item">
			        <a class="nav-link" href="listUser">Users</a>
			      </li>	 
			   <%}%>
		       		        
		      <li class="nav-item">
		        <a class="nav-link" href="/">Log out</a>
		      </li>
		    </ul>
		  </div>
		</nav>


		<br/><br/>
	    <div class="container">
	        <h3 id="form_header" align="center">Movie Database</h3>
	        <br/>
	        <div><h5>Please enter a movie title or artist name which you want to find.</h5></div>
			<br/>
	        <c:url var="searchMovieResultUrl" value="/searchMovieResult" />
	        <form id="movie_form" action="${searchMovieResultUrl}" method="POST">
	        <!-- <form:form action="saveMovie" method="post" modelAttribute="movie"> -->
	         <!-- <form action="saveMovie" th:action="@{/saveMovie}" th:object="${movie}" method="post"> -->
	         
	           <input type="hidden" name="id" value='${movie.id}'/>
               <div class="form-group">
	                <label for="movieTitle">Movie Title:</label>
	                <input type="text" class="form-control" id="movieTitle" placeholder="Enter movie title" 
	                name="movieTitle" value='${movie.movieTitle}' />
	            </div>
	            <div class="form-group">
	                <label for="movieArtist">Artist:</label>
	                <input type="text" class="form-control" id="movieArtist" placeholder="Enter the name of artist" 
	                name="movieArtist" value='${movie.movieArtist}' />
	            </div>
	 <%--            <div class="form-group">
	                <label for="year">Year:</label>
	                <input type="number" class="form-control" id="year" placeholder="Enter released year" 
	                name="year" value='${movie.year}' min="1950" max="2050">
	            </div> --%>
	         
	            <div align="center">       	            
	            	<button id="confirm_movie" type="submit" class="btn btn-dark">search</button>
	            </div> 
	        </form>
	    </div>

</body>
</html>