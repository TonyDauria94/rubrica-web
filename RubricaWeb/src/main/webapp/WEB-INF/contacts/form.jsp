<%@page import="java.util.Iterator"%>
<%@page import="it.rdev.rubrica.model.entities.Contact"%>
<%@page import="it.rdev.rubrica.model.entities.Email"%>
<%@page import="it.rdev.rubrica.model.entities.Phone"%>
<%@page import="java.util.Set"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<%
Contact contact = (Contact) request.getAttribute("contact");

Iterator<Email> emails = null;
Iterator<Phone> phones = null;

if (contact != null) {
	emails = contact.getEmails().iterator();
	phones = contact.getPhones().iterator();
}

%>

<% if (contact != null) { %>
<form method="post" action="${pageContext.request.contextPath}/manage_contact?action=update&id=<%=contact.getId() %>" style="max-width: 1200px;" class="w3-content w3-row w3-margin-top">
<% } else { %>
<form method="post" action="${pageContext.request.contextPath}/manage_contact?action=insert" style="max-width: 1200px;" class="w3-content w3-row w3-margin-top">
<% } %>

	<table class="w3-table-all w3-hoverable w3-centered">
		<thead>
			<tr>
				<th>Name</th>
				<th>Surname</th>
			</tr>
		</thead>
		
		<tbody>
			<tr>
				<% if (contact != null) { %>
				<td>
				<input class="w3-input w3-border w3-center" name="name" type="text" value="<%=contact.getName() %>" />
				</td>
				<td>
				<input class="w3-input w3-border w3-center" name="surname" type="text" value="<%=contact.getSurname() %>" />
				</td>
				<% } else { %>
				<td>
				<input class="w3-input w3-border w3-center" name="name" type="text" value="" />
				</td>
				<td>
				<input class="w3-input w3-border w3-center" name="surname" type="text" value="" />
				</td>
				<% } %>
			</tr>
	
		</tbody>
	</table>



	<div class="w3-col l6">
		<div class="w3-responsive w3-section">
			<table class="w3-table-all w3-hoverable w3-centered">
				<thead>
					<tr>
						<th>Emails</th>
					</tr>
				</thead>
				<tbody>
					<% for (int i=0; i<10; i++) { %>
					<tr>
						<td>
						<% if (emails != null && emails.hasNext()) { %>
						<input class="w3-input w3-border w3-center" name="emails" type="text" value="<%=emails.next().getEmail()%>" />
						<% } else { %>
						<input class="w3-input w3-border w3-center" name="emails" type="text" value="" />
						<% } %>
						</td>
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
					<% for (int i=0; i<10; i++) { %>
					<tr>
						<td>
						<% if (phones != null && phones.hasNext()) { %>
						<input class="w3-input w3-border w3-center" name="phones" type="text" value="<%=phones.next().getPhone()%>" />
						<% } else { %>
						<input class="w3-input w3-border w3-center" name="phones" type="text" value="" />
						<% } %>
						</td>
					</tr>
					<% } %>
				</tbody>
			</table>
		</div>
	</div>
		
		<% if (contact != null) { %>
			<input hidden="true" name=id value=<%=contact.getId() %> />
			<button class="w3-button w3-green w3-right" type="submit">update</button>
		<% } else { %>	
			<button class="w3-button w3-green w3-right" type="submit">insert</button>
		<% } %>
</form>