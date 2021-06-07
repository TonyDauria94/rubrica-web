<%@page import="it.rdev.rubrica.model.entities.Contact"%>
<%@page import="java.util.List"%>
    
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>


<% List<Contact> contacts = (List<Contact>) request.getAttribute("contacts"); %>

<div style="max-width: 1200px;" class="w3-content w3-responsive w3-section">
	<table class="w3-table-all w3-hoverable w3-centered">
		<thead>
			<tr><th>Name</th><th>Surname</th><th>Details</th>
			<% if (session.getAttribute("USER") != null) { %><th>Delete</th></tr><% } %>
		</thead>
		<tbody>
			<c:forEach items="${contacts}" var="c">
				<tr>
					<td><c:out value="${c.name }"></c:out></td>
					<td><c:out value="${c.surname }"></c:out></td>
					<td><a class="w3-tag w3-green" href="${pageContext.request.contextPath}/details?id=<c:out value="${c.id }"></c:out>">details</a></td>
					<% if (session.getAttribute("USER") != null) { %>
					<td><a class="w3-tag w3-red" href="${pageContext.request.contextPath}/manage_contact?action=delete&id=<c:out value="${c.id }"></c:out>">delete</a></td>
					<% } %>
				</tr>
			</c:forEach>
		</tbody>
	</table>
</div>