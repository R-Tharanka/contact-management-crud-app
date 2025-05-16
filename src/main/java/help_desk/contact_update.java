package help_desk;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/contact_update")
public class contact_update extends HttpServlet {
	private static final long serialVersionUID = 1L;


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		
		
		int id = Integer.parseInt(request.getParameter("c_f_id"));
		String name = request.getParameter("name");
		String email = request.getParameter("email"); 
		String contact_no = request.getParameter("contact_no"); 
		String request_type = request.getParameter("request_type"); 
		String subject = request.getParameter("subject"); 
		String message = request.getParameter("message"); 

		boolean checkSuccess = contact_DAO.updateContactDetails(id, name, email, contact_no, request_type, subject, message);
		
		if(checkSuccess == true)
		{
			List<contact> up_contact_details = contact_DAO.getUpdateContactDetails(id);
			request.setAttribute("contact_details", up_contact_details);

			RequestDispatcher disp = request.getRequestDispatcher("contact_servlet");
			disp.forward(request, response);	
		}
		else
		{
			RequestDispatcher disp = request.getRequestDispatcher("db_failed.jsp");
			disp.forward(request, response);
		}
	}

}
