 <%@page import="it.rdev.rubrica.dto.User"%>
<div class="w3-bar w3-border w3-theme-d2" style="padding-left: 5%; padding-right: 5%;">
  <a href="${pageContext.request.contextPath}/" class="w3-bar-item w3-button w3-padding-left w3-padding-16">RUBRICA WEB</a>
  <% if (session.getAttribute("USER") != null) { %>
  	<a href="${pageContext.request.contextPath}/do_login?action=logout" class="w3-bar-item w3-button w3-right w3-padding-right w3-padding-16">Logout</a>
  <% } else { %>
  	<a href="${pageContext.request.contextPath}/login" class="w3-bar-item w3-button w3-right w3-padding-right w3-padding-16">Login</a>
  <% } %>
</div> 