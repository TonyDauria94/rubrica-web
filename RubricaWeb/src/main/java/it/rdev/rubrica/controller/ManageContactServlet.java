package it.rdev.rubrica.controller;

import java.io.IOException;
import java.util.HashSet;
import java.util.Set;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import it.rdev.rubrica.model.ContactDao;
import it.rdev.rubrica.model.entities.Contact;
import it.rdev.rubrica.model.entities.Email;
import it.rdev.rubrica.model.entities.Phone;

/**
 * Servlet implementation class ManageContactServlet
 */
@WebServlet("/manage_contact")
public class ManageContactServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ManageContactServlet() {
        super();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String action = request.getParameter("action");
		
		String contactId = request.getParameter("id");
		
		if("insert".equals(action)) {
			String name = request.getParameter("name");
			String surname = request.getParameter("surname");
			
			// Creo un nuovo contatto e aggiungo nome e congome
			Contact c = new Contact();
			c.setName(name); 
			c.setSurname(surname);
			
			// Inizializzo un set di email e recupero gli input dalla request
			Set<Email> emails = new HashSet<>();
			
			for (String e : request.getParameterValues("emails")) {
				
				if(e != null && !e.equals("")) {
					Email email = new Email();
					email.setEmail(e);
					email.setContact(c);
					emails.add(email);
				}
				
			}
			
			c.setEmails(emails);
			
			// Inizializzo un set di telefoni e recupero gli input dalla request
			Set<Phone> phones = new HashSet<>();
			
			for (String p : request.getParameterValues("phones")) {

				if(p != null && !p.equals("")) {
					Phone phone = new Phone();
					phone.setPhone(p);
					phone.setContact(c);
					phones.add(phone);
				}
				
			}
		
			c.setPhones(phones);
			ContactDao.insert(c);
			
			request.getRequestDispatcher("/")
			.forward(request, response);
			
	    } else if(contactId != null && "update".equals(action)) {

			int id = Integer.parseInt(contactId);
			Contact toUpdate = ContactDao.getContact(id);
			
			String name = request.getParameter("name");
			String surname = request.getParameter("surname");
			
			toUpdate.setName(name); 
			toUpdate.setSurname(surname);
			
			// Inizializzo un set di email e recupero gli input dalla request
			Set<Email> emails = new HashSet<>();
			
			for (String e : request.getParameterValues("emails")) {
				
				if(e != null && !e.equals("")) {
					Email email = new Email();
					email.setEmail(e);
					email.setContact(toUpdate);
					emails.add(email);
				}
				
			}

			toUpdate.setEmails(emails);
			
			// Inizializzo un set di telefoni e recupero gli input dalla request
			Set<Phone> phones = new HashSet<>();
			
			for (String p : request.getParameterValues("phones")) {

				if(p != null && !p.equals("")) {
					Phone phone = new Phone();
					phone.setPhone(p);
					phone.setContact(toUpdate);
					phones.add(phone);
				}
				
			}
		
			toUpdate.setPhones(phones);
			ContactDao.update(toUpdate);

			request.getRequestDispatcher("/details?id=" + id)
			.forward(request, response);
			
		} else if(contactId != null && "delete".equals(action)) {

			int id = Integer.parseInt(contactId);
			
			Contact toDelete = new Contact();
			
			toDelete.setId(id);
			
			ContactDao.delete(toDelete);

			request.getRequestDispatcher("/")
			.forward(request, response);
			
		}
		
	}

}
