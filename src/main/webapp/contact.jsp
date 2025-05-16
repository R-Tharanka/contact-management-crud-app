<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Contact</title>
<link rel="stylesheet" type="text/css" href="css/contact.css">


</head>
<body>



	<div id="form_div">
		<form action="contact_insert" method="POST" id="contact_form">
		
			<input type="hidden" name="c_f_id" value="0">
			
			<label for="name">Name</label>
			<input type="text" name="name" id="name"> 
			<br><br>
			
			<label for="email">Email</label>
			<input type="email" name="email" id="email">
			<br><br>
			
			<label for="contact_no">Contact</label>
			<input type="text" name="contact_no" id="contact_no">
			<br><br>
			
			<label for="request_type">Request Type:</label>
			<select id="request_type" name="request_type">
  				<option value="student">Request an official document</option>
  				<option value="student">I have a question about Registration</option>
  				<option value="student">I have a question about Examination</option>
  				<option value="student">Other</option>
  
  
			</select>
			<br> <br>
			
			<label for="subject">Subject</label>
			<input type="text" name="subject" id="subject">
			<br><br>
			
			<label for="message">Message</label>
			<textarea name="message" id="message"></textarea>
			<br><br>
			
			<input type="submit" value="submit" name="submit">
			
		</form>
		
		<p>${nullMsg}</p>
	</div>
	
	<div>
		<form action="contact_servlet" method="POST">
		<button type="submit" >view</button>
		</form>
	</div>

</body>
</html>