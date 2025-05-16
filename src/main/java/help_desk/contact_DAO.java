package help_desk;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class contact_DAO {
	
	private static final String url = "jdbc:mysql://localhost:3306/support_desk";
    private static final String username = "root";
    private static final String password = "1234";
	
	
	public static boolean insertContactDetails(int id, String name, String email, String contact_no, String request_type, String subject, String Message)
	{
		boolean isSuccess = false;
		
		try
		{
			Class.forName("com.mysql.jdbc.Driver");
			
			Connection conn = DriverManager.getConnection(url, username, password);
			Statement stmnt = conn.createStatement();
			
			String sql = "INSERT INTO contact (id, name, email, contact_no, request_type, subject, Message) " +
		             "VALUES ('" + id + "', '" + name + "', '" + email + "', '" + contact_no + "', '" + request_type + "', '" + 
		             subject + "', '" + Message + "')";
			
			int reslt = stmnt.executeUpdate(sql);
			
			if(reslt > 0)
			{
				isSuccess = true;
				
			}
			else
			{
				isSuccess = false;
			}
		}
		 
		catch(Exception er)
		{
			er.printStackTrace();
		}
		
		
		return isSuccess;
		
	}
	
	///////////////////////////////////////VIEW /////////////////////////////////////////////
	
	public static List<contact> getContactDetails()
	{
		ArrayList<contact> contact_s = new ArrayList<>();

		try
		{
			Class.forName("com.mysql.jdbc.Driver");

			Connection conn = DriverManager.getConnection(url, username, password);
			Statement stmnt = conn.createStatement();

			String sql = "SELECT * FROM contact";

			ResultSet reslt = stmnt.executeQuery(sql);

			while(reslt.next())
			{
				int c_f_id = reslt.getInt(1);
				String name = reslt.getString(2);
				String email = reslt.getString(3);
				String contact_no = reslt.getString(4);
				String request_type = reslt.getString(5);
				String subject = reslt.getString(6);
				String message = reslt.getString(7);

				contact contact_obj = new contact( c_f_id, name, email, contact_no, request_type, subject, message);

				contact_s.add(contact_obj);
				
				System.out.println("" + c_f_id + "" +name+"" +email+"" +contact_no+"" +request_type+"" +subject+"" +message+"");//for debug

			}

		}

		catch(Exception ex2)
		{
			ex2.printStackTrace();
		}

		return contact_s;
	}
	
	
	
	//////////////////////////////////// DELETE //////////////////////////////////////////	
	
	public static boolean deleteContact(int contactId) 
	{
		boolean checkSuccess = false;

        System.out.println("dao delete: "+contactId);
        
		try
		{
			Connection conn = DriverManager.getConnection(url, username, password);
			Statement stmnt = conn.createStatement();

			String sql = "DELETE FROM contact WHERE id='"+contactId+"' ";

			int reslt = stmnt.executeUpdate(sql);
			
			
			if(reslt > 0)
			{
				checkSuccess = true;
			}
			else
			{
				checkSuccess = false;
			}
			
		}
		catch(Exception ex4)
		{
			ex4.printStackTrace();
		}
		
		return checkSuccess;
    }
	
	
	
		////////////////////////////////GET & VIEW UPDATE TICKET DETAILS ////////////////////////////////////////////////
			
	public static List<contact> getUpdateContactDetails(int id)
	{
		ArrayList<contact> contact_s = new ArrayList<>();

		try
		{
			Class.forName("com.mysql.jdbc.Driver");

			Connection conn = DriverManager.getConnection(url, username, password);
			Statement stmnt = conn.createStatement();

			String sql = "SELECT * FROM  contact WHERE id='"+id+"'";

			ResultSet reslt = stmnt.executeQuery(sql);

			while(reslt.next())
			{
				int c_f_id = reslt.getInt(1);
				String name = reslt.getString(2);
				String email = reslt.getString(3);
				String contact_no = reslt.getString(4);
				String request_type = reslt.getString(5);
				String subject = reslt.getString(6);
				String message = reslt.getString(7);

				contact contact_obj = new contact( c_f_id, name, email, contact_no, request_type, subject, message);

				contact_s.add(contact_obj);
				
				System.out.println("getUpdateContactDetails: DAO: "+"" + c_f_id + "" +name+"" +email+"" +contact_no+"" +request_type+"" +subject+"" +message+"");//for debug

			}

		}

		catch(Exception ex2)
		{
			ex2.printStackTrace();
		}

		return contact_s;
	}	
	
	/////////////////////////////////	UPDATE /////////////////////////////////////////////////
	
	public static boolean updateContactDetails(int id, String name,String email,String contact_no,String request_type, String subject, String message)
	{
		boolean checkSuccess = false;
		
		try
		{
			Class.forName("com.mysql.jdbc.Driver");

			Connection conn = DriverManager.getConnection(url, username, password);
			Statement stmnt = conn.createStatement();

			String sql = "UPDATE contact SET name='"+name+"', email='"+email+"', contact_no='"+contact_no+"', request_type='"+request_type+"', subject='"+subject+"', Message='"+message+"'"
					+ " WHERE id='"+id+"'";

			int reslt = stmnt.executeUpdate(sql);
			
			if(reslt > 0)
			{
				checkSuccess = true;
			}
			else
			{
				checkSuccess = false;
			}
			
		}
		catch(Exception ex3)
		{
			ex3.printStackTrace();
		}
		
		
		return checkSuccess;
	}
	

}
