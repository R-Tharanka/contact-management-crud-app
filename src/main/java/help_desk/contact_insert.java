package help_desk;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/contact_insert")
public class contact_insert extends HttpServlet {
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

		boolean check_success;
		
		//validation part
		if(email == "" || message == "")
		{	
			request.setAttribute("nullMsg", "please fill Email and Message");
			RequestDispatcher disp = request.getRequestDispatcher("contact.jsp");
			disp.forward(request, response);
		}
		else
		{
			check_success = contact_DAO.insertContactDetails(id, name, email, contact_no, request_type, subject, message);
			
			if(check_success == true)
			{
				//RequestDispatcher disp = request.getRequestDispatcher("display_contact_servlet");
				RequestDispatcher disp = request.getRequestDispatcher("contact.jsp");
				disp.forward(request, response);
				
			}
			else
			{
				RequestDispatcher disp2 = request.getRequestDispatcher("db_failed.jsp");
				disp2.forward(request, response);
				
			}
		}
	}

}
