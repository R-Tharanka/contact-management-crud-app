package help_desk;

public class contact {
	
	int c_f_id;
	String name;
	String email;
	String contact_no;
	String request_type;
	String subject;
	String Message;
	
	
	public contact(int c_f_id, String name, String email, String contact_no, String request_type,
			String subject, String message) {
		super();
		this.c_f_id = c_f_id;
		this.name = name;
		this.email = email;
		this.contact_no = contact_no;
		this.request_type = request_type;
		this.subject = subject;
		this.Message = message;
	}


	public int getC_f_id() {
		return c_f_id;
	}


	public String getName() {
		return name;
	}


	public String getEmail() {
		return email;
	}


	public String getContact_no() {
		return contact_no;
	}


	public String getRequest_type() {
		return request_type;
	}


	public String getSubject() {
		return subject;
	}


	public String getMessage() {
		return Message;
	}
	
	
	
}
