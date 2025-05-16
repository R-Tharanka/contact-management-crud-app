<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
  <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <!DOCTYPE html>
    <html lang="en">

    <head>
      <meta charset="UTF-8">
      <title>Update Contact</title>
      <link rel="stylesheet" href="${pageContext.request.contextPath}/css/contact.css">
      <link rel="stylesheet" href="${pageContext.request.contextPath}/css/contact-update.css">
      <meta name="viewport" content="width=device-width, initial-scale=1.0">
    </head>

    <body>
      <!-- Nav Bar -->
      <nav>
        <div class="nav-container">
          <div class="logo">Help Desk</div>
          <ul>
            <li><a href="contact.jsp">New Contact</a></li>
            <li>
              <form action="contact_servlet" method="POST" style="display:inline">
                <button type="submit" class="nav-button">View Contacts</button>
              </form>
            </li>
          </ul>
        </div>
      </nav>

      <main class="update-container">
        <section class="update-card">
          <h1>Update Contact</h1>

          <form id="updateForm" action="contact_update" method="POST" novalidate>
            <c:forEach items="${update_value}" var="contact">
              <!-- Hidden ID -->
              <input type="hidden" name="c_f_id" value="${contact.c_f_id}">

              <div class="form-group">
                <label for="name">Name</label>
                <input id="name" name="name" required type="text" value="${contact.name}">
              </div>

              <div class="form-group">
                <label for="email">Email</label>
                <input id="email" name="email" required type="email" value="${contact.email}">
              </div>

              <div class="form-group">
                <label for="contact_no">Contact No.</label>
                <input id="contact_no" name="contact_no" required type="tel" value="${contact.contact_no}">
              </div>

              <div class="form-group">
                <label for="request_type">Request Type</label>
                <select id="request_type" name="request_type" required>
                  <option value="document" ${contact.request_type=='document' ? 'selected' : '' }>Official Document
                  </option>
                  <option value="registration" ${contact.request_type=='registration' ? 'selected' : '' }>Registration
                    Question</option>
                  <option value="examination" ${contact.request_type=='examination' ? 'selected' : '' }>Examination
                    Question</option>
                  <option value="other" ${contact.request_type=='other' ? 'selected' : '' }>Other</option>
                </select>
              </div>

              <div class="form-group">
                <label for="subject">Subject</label>
                <input id="subject" name="subject" required type="text" value="${contact.subject}">
              </div>

              <div class="form-group">
                <label for="message">Message</label>
                <textarea id="message" name="message" required rows="4">${contact.message}</textarea>
              </div>
            </c:forEach>

            <div class="form-actions">
              <button type="submit" class="btn-primary">Save Changes</button>
              <a href="contact_servlet" class="btn-secondary">Cancel</a>
            </div>
          </form>

          <p class="feedback">${failedMsg}</p>
        </section>
      </main>
      <script src="js/contact-validation.js"></script>
    </body>

    </html>