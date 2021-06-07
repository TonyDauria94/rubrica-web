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

	<%@include file="../component/navbar.jsp"%>

	<% String page_name = (String) request.getAttribute("page"); %>

    <div class="w3-container">
    
    <% if ("details".equals(page_name)) { %>
    
		<%@include file="details.jsp"%>
    
    <% } else if ("list".equals(page_name)) { %>
   		
		<%@include file="contacts_list.jsp"%>
		
    <% } %>
    </div>
</body>
</html>