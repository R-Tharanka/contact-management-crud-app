package help_desk;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/contact_delete")
public class contact_delete extends HttpServlet 
{
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
    {
    	boolean checkSuccess= false;
    	
        String idStr = request.getParameter("id");
        if (idStr != null) 
        {
            int contactId = Integer.parseInt(idStr);
            
            System.out.println("\n delete id:"+contactId);//for debug
            
            checkSuccess = contact_DAO.deleteContact(contactId);
        }
        		
		if(checkSuccess == true)
		{
			//if deletion is success user redirected to 
			RequestDispatcher disp = request.getRequestDispatcher("contact_servlet");
			disp.forward(request, response);
			
		}
		else
		{
			request.setAttribute("failedMsg", "filed to delete");
			
			RequestDispatcher disp = request.getRequestDispatcher("view_contact.jsp");
			disp.forward(request, response);
		}
    }
    
    
    
}
