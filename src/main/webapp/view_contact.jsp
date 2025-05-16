<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <!DOCTYPE html>
        <html>

        <head>
            <meta charset="UTF-8">
            <title>Contact Details</title>
            <style>
                table {
                    width: 100%;
                    border-collapse: collapse;
                }

                table,
                th,
                td {
                    border: 1px solid black;
                    padding: 8px;
                }

                th {
                    background-color: #f2f2f2;
                }
            </style>
            <link rel="stylesheet" href="${pageContext.request.contextPath}/css/contact.css">
        </head>

        <body>

            <!-- 1) NAVIGATION BAR -->
            <nav>
                <div class="nav-container">
                    <div class="logo">Help Desk</div>
                    <ul>
                        <li><a href="/contact.jsp">New Contact</a></li>
                        <li><a href="/view_contact.jsp">View Contacts</a></li>
                    </ul>
                </div>
            </nav>

            <h2>Contact Details</h2>

            <table>
                <thead>
                    <tr>
                        <th>Contact ID</th>
                        <th>Name</th>
                        <th>Email</th>
                        <th>Contact No</th>
                        <th>Request Type</th>
                        <th>Subject</th>
                        <th>Message</th>
                        <th>Action</th>
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
                            <td>${contact.message}</td> <!-- Corrected here -->
                            <td>
                                <form action="contact_update_view" method="POST">
                                    <input type="hidden" name="id" value="${contact.c_f_id}">
                                    <button type="submit">Update</button>
                                </form>
                                <form action="contact_delete" method="POST">
                                    <input type="hidden" name="id" value="${contact.c_f_id}">
                                    <button type="submit">Delete</button>
                                </form>

                            </td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
            <p>${failedMsg}</p>

        </body>

        </html>