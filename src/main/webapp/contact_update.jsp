<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix= "c" uri="http://java.sun.com/jsp/jstl/core" %>
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

    table, th, td {
        border: 1px solid black;
        padding: 8px;
    }

    th {
        background-color: #f2f2f2;
    }
    input[type="text"] {
            border: none;
            background: none;
            padding: 0;
            margin: 0;
            width: 100%;
            box-sizing: border-box;
        }
</style>
</head>
<body>

<h2>Update Contact Details</h2>

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
    <form action="contact_update" method="POST" id="up_page_form" >
        <c:forEach items="${update_value}" var="contact">
            <tr>
                <td><input type="text" name="" id="id" value="${contact.c_f_id}" disabled>
                	<input type="hidden" name="c_f_id" id="id" value="${contact.c_f_id}" >
                </td>
                <td><input type="text" name="name" id="name" value="${contact.name}" ></td>
                <td><input type="text" name="email" id="email" value="${contact.email}"></td>
                <td><input type="text" name="contact_no" id="contact_no" value="${contact.contact_no}"></td>
                <td><input type="text" name="request_type" id="request_type" value="${contact.request_type}"></td>
                <td><input type="text" name="subject" id="subject" value="${contact.subject}"></td>
                <td><input type="text" name="message" id="message" value="${contact.message}"></td> <!-- Corrected here -->
                <td>
                    <button type="submit">Update</button>
                </td>
            </tr>
        </c:forEach>
    </form>
    </tbody>
</table>
<p>${failedMsg}</p>

</body>
</html>
