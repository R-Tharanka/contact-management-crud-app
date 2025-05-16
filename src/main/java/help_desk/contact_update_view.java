package help_desk;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/contact_update_view")
public class contact_update_view extends HttpServlet 
{
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
    {
    	
    	int id = Integer.parseInt(request.getParameter("id"));
    	
    	System.out.println("update_dispaly id:  " +id);
		
		try
		{
			List<contact> up_contact_details = contact_DAO.getUpdateContactDetails(id);
			request.setAttribute("update_value", up_contact_details);
		}
		catch(Exception ex) 
		{
			ex.printStackTrace();
		}
		
		RequestDispatcher disp =request.getRequestDispatcher("contact_update.jsp");
		disp.forward(request, response);
    	
        
    }
}
