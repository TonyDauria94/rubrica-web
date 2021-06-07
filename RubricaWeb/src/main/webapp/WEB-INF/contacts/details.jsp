<%@page import="it.rdev.rubrica.model.entities.Contact"%>
<%@page import="it.rdev.rubrica.model.entities.Email"%>
<%@page import="it.rdev.rubrica.model.entities.Phone"%>
<%@page import="java.util.Set"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<%
Contact contact = (Contact) request.getAttribute("contact");
Set<Email> emails = contact.getEmails();
Set<Phone> phones = contact.getPhones();
%>

<h1 class="w3-center"><%=contact.getName()%>&nbsp;<%=contact.getSurname()%></h1>

<div style="max-width: 1200px;" class="w3-content w3-row">
	<div class="w3-col l6">
		<div class="w3-responsive w3-section">
			<table class="w3-table-all w3-hoverable w3-centered">
				<thead>
					<tr>
						<th>Emails</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${emails}" var="e">
						<tr>
							<td><c:out value="${e.email }"></c:out></td>
						</tr>
					</c:forEach>

					<% for (Email e : emails) { %>
					<tr>
						<td><%=e.getEmail()%></td>
					</tr>
					<% } %>

				</tbody>
			</table>
		</div>
	</div>

	<div class="w3-col l6">
		<div class="w3-responsive w3-section">
			<table class="w3-table-all w3-hoverable w3-centered">
				<thead>
					<tr>
						<th>Phones</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${phones}" var="p">
						<tr>
							<td><c:out value="${p.phone }"></c:out></td>
						</tr>
					</c:forEach>

					<% for (Phone p : phones) { %>
					<tr>
						<td><%=p.getPhone()%></td>
					</tr>
					<% } %>
				</tbody>
			</table>
		</div>
	</div>
</div>