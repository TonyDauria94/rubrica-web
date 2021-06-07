package it.rdev.rubrica.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import it.rdev.rubrica.model.ContactDao;
import it.rdev.rubrica.model.entities.Contact;

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
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub

		String action = request.getParameter("action");
		
		String contactId = request.getParameter("id");
		
		if(contactId != null && "delete".equals(action)) {

			int id = Integer.parseInt(contactId);
			
			Contact toDelete = new Contact();
			toDelete.setId(id);
			
			ContactDao.delete(toDelete);

			request.getRequestDispatcher("/")
			.forward(request, response);
			
		}
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
