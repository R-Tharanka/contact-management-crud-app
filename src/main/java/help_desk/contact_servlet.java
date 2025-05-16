package help_desk;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/contact_servlet")
public class contact_servlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// simply forward to POST logic
		doPost(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		System.out.println("servlet triggers");// for debug

		try {
			List<contact> contact_s = contact_DAO.getContactDetails();
			request.setAttribute("contact_details", contact_s);
		} catch (Exception ex) {
			ex.printStackTrace();
		}

		RequestDispatcher disp = request.getRequestDispatcher("/view_contact.jsp");
		disp.forward(request, response);
	}

}
