
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Rubrica</title>
	
	<meta name="viewport" content="width=device-width, initial-scale=1">
	
	<!-- Libreria w3.css -->
	<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
	<link rel="stylesheet" href="https://www.w3schools.com/lib/w3-theme-blue.css">

</head>
<body class="w3-theme-l4">

	<%@include file="component/navbar.jsp"%>

	<% String page_name = (String) request.getAttribute("page"); %>

    
    
        
    <form class="w3-container" method="post" action="${pageContext.request.contextPath}/do_login">
     <div class="w3-row w3-content" style="max-width: 600px;">
     
        <div class="w3-col l12">
		    <p>      
			    <label><b>Username</b></label>
			    <input class="w3-input w3-border" name="username" type="text">
			</p>
			
		    <p>      
			    <label><b>Password</b></label>
			    <input class="w3-input w3-border" name="password" type="password">
			</p>
			
		    <p>
			    <button class="w3-button w3-theme-d2" type="submit">Login</button>
			    <button class="w3-button w3-theme-d2" type="reset">Reset</button>
		    </p>
	    
  		</div>
  	</div>
  </form>
  
    
  
</body>

</html>