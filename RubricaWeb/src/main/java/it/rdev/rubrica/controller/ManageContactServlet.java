package it.rdev.rubrica.controller;

import java.io.IOException;
import java.util.HashSet;
import java.util.Set;
import java.util.TreeSet;

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
			
			for (int i=0; i<10; i++) {
				String e = request.getParameter("email" + i);
	
				
				if(e != null) {
					Email email = new Email();
					email.setEmail(e);
					emails.add(email);
				}
				
			}

			for (Email e : emails) {
				System.out.println(e.getEmail());
			}
			
			c.setEmails(emails);
			
			// Inizializzo un set di telefoni e recupero gli input dalla request
			Set<Phone> phones = new HashSet<>();
			
			for (int i=0; i<10; i++) {
				String p = request.getParameter("phone" + i);

				if(p != null) {
					Phone phone = new Phone();
					phone.setPhone(p);
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
			
			for (int i=0; i<10; i++) {
				String e = request.getParameter("email" + i);
	
				
				if(e != null) {
					Email email = new Email();
					email.setEmail(e);
					emails.add(email);
				}
				
			}

			for (Email e : emails) {
				System.out.println(e.getEmail());
			}
			
			toUpdate.setEmails(emails);
			
			// Inizializzo un set di telefoni e recupero gli input dalla request
			Set<Phone> phones = new HashSet<>();
			
			for (int i=0; i<10; i++) {
				String p = request.getParameter("phone" + i);

				if(p != null) {
					Phone phone = new Phone();
					phone.setPhone(p);
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
