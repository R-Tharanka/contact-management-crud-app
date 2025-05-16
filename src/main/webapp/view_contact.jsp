<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <!DOCTYPE html>
        <html lang="en">

        <head>
            <meta charset="UTF-8">
            <title>View Contacts</title>
            <link rel="stylesheet" href="${pageContext.request.contextPath}/css/contact.css">
            <link rel="stylesheet" href="${pageContext.request.contextPath}/css/view-contact.css">
            <meta name="viewport" content="width=device-width, initial-scale=1.0">
        </head>

        <body>

            <!-- NAVIGATION BAR -->
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

            <main class="contacts-container">
                <h1>Contact Records</h1>

                <c:if test="${empty contact_details}">
                    <p class="feedback">No contact records available.</p>
                </c:if>

                <div class="table-wrapper">
                    <table class="modern-table">
                        <thead>
                            <tr>
                                <th>ID</th>
                                <th>Name</th>
                                <th>Email</th>
                                <th>Phone</th>
                                <th>Type</th>
                                <th>Subject</th>
                                <th>Message</th>
                                <th>Actions</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach items="${contact_details}" var="contact">
                                <tr>
                                    <td>${contact.c_f_id}</td>
                                    <td>${contact.name}</td>
                                    <td>${contact.email}</td>
                                    <td>${contact.contact_no}</td>
                                    <td>${contact.request_type}</td>
                                    <td>${contact.subject}</td>
                                    <td>${contact.message}</td>
                                    <td class="actions">
                                        <form action="contact_update_view" method="POST" style="display:inline;">
                                            <input type="hidden" name="id" value="${contact.c_f_id}">
                                            <button type="submit" class="btn-update">Update</button>
                                        </form>
                                        <form action="contact_delete" method="POST" style="display:inline;">
                                            <input type="hidden" name="id" value="${contact.c_f_id}">
                                            <button type="submit" class="btn-delete">Delete</button>
                                        </form>
                                    </td>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                </div>

                <p class="feedback">${failedMsg}</p>
            </main>
        </body>

        </html>