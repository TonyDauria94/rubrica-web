<%@page import="it.rdev.rubrica.model.entities.Contact"%>
<%@page import="it.rdev.rubrica.model.entities.Email"%>
<%@page import="it.rdev.rubrica.model.entities.Phone"%>
<%@page import="java.util.Set"%>

<%
Contact contact = (Contact) request.getAttribute("contact");
Set<Email> emails = contact.getEmails();
Set<Phone> phones = contact.getPhones();
%>

<h1 class="w3-center"><%=contact.getName()%>&nbsp;<%=contact.getSurname()%></h1>

<div style="max-width: 1200px;" class="w3-content w3-row">
	<div class="w3-col l6">
		<div class="w3-responsive w3-section">
			<table class="w3-table-all w3-centered">
				<thead>
					<tr>
						<th>Emails</th>
					</tr>
				</thead>
				<tbody>
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
			<table class="w3-table-all w3-centered">
				<thead>
					<tr>
						<th>Phones</th>
					</tr>
				</thead>
				<tbody>
					<% for (Phone p : phones) { %>
					<tr>
						<td><%=p.getPhone()%></td>
					</tr>
					<% } %>
				</tbody>
			</table>
		</div>
	</div>
	
	<a class="w3-button w3-green w3-right w3-padding w3-margin" 
	href="${pageContext.request.contextPath}/form?id=<%=contact.getId()%>">update</a>
	
	<a class="w3-button w3-red w3-right w3-padding w3-margin" 
	href="${pageContext.request.contextPath}/manage_contact?action=delete&id=<%=contact.getId()%>">delete</a>
	
</div>