<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>Contact Us</title>
  <!-- Google Font -->
  <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;600&display=swap" rel="stylesheet">
  <link rel="stylesheet" href="css/contact.css">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
</head>
<body>
  <main class="container">
    <section class="card">
      <h1>Contact Us</h1>
      <form action="contact_insert" method="POST" id="contact_form" novalidate>
        <input type="hidden" name="c_f_id" value="0">

        <div class="form-group">
          <label for="name">Name</label>
          <input required type="text" name="name" id="name" placeholder="Your full name">
        </div>

        <div class="form-group">
          <label for="email">Email</label>
          <input required type="email" name="email" id="email" placeholder="you@example.com">
        </div>

        <div class="form-group">
          <label for="contact_no">Contact No.</label>
          <input required type="tel" name="contact_no" id="contact_no" placeholder="+94 77 123 4567">
        </div>

        <div class="form-group">
          <label for="request_type">Request Type</label>
          <select id="request_type" name="request_type" required>
            <option value="" disabled selected>Select a topic</option>
            <option value="document">Official Document</option>
            <option value="registration">Registration Question</option>
            <option value="examination">Examination Question</option>
            <option value="other">Other</option>
          </select>
        </div>

        <div class="form-group">
          <label for="subject">Subject</label>
          <input required type="text" name="subject" id="subject" placeholder="Subject of your message">
        </div>

        <div class="form-group">
          <label for="message">Message</label>
          <textarea required name="message" id="message" rows="5" placeholder="Type your message here"></textarea>
        </div>

        <button type="submit" class="btn-primary">Send Message</button>
      </form>

      <p class="feedback">${nullMsg}</p>
    </section>
  </main>
</body>
</html>
