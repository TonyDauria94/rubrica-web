<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.util.List" %>
<%@ page import="it.rdev.rubrica.dto.User" %>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%-- 	<jsp:useBean id="user" scope="request" class="it.rdev.rubrica.dto.User"> --%>
<%-- 		<jsp:setProperty name="user" property="*"/> --%>
<%-- 	</jsp:useBean> --%>
	
<%-- 	<%=user.getUsername()  + " " + user.getPassword() %> --%>
	<%  
		List<User> users = (List<User>) request.getAttribute("users");
 	%>
	<table>
	<thead>
		<tr><td>Username</td><td>Password</td></tr>
	</thead>
	<tbody>
	<c:forEach items="${users}" var="u">
		<tr>
			<td><c:out value="${u.username }"></c:out></td>
			<td><c:out value="${u.password }"></c:out></td>
		</tr>
	</c:forEach>
	</tody>
	</table>

<a href="secure/SecureResourceServlet">Risorsa Protetta</a>
</body>
</html>