# Help Desk - Contact Management System

A Java web application for managing customer support requests and inquiries with a user-friendly interface.

## Overview

The Help Desk application is a simple yet effective contact management system built using Java Servlets, JSP, and MySQL. It allows support staff to manage customer inquiries and support requests through a web interface. The application includes functionality for creating, viewing, updating, and deleting contact records.

## Features

- **Contact Form**: User-friendly form for submitting new support requests
- **Contact Management**: View, edit, and delete contact records
- **Validation**: Client-side form validation using JavaScript
- **Responsive Design**: Works well on desktop and mobile devices

## Technologies Used

- **Backend**: Java Servlets (Java 8)
- **Frontend**: JSP, HTML, CSS, JavaScript
- **Database**: MySQL
- **Build Tool**: Maven
- **Server**: Any Servlet 3.1 compatible container (e.g., Tomcat, Jetty)
- **Libraries**:
  - JSTL 1.2
  - MySQL Connector/J 8.0.32

## Project Structure

```
help_desk/
├── src/
│   └── main/
│       ├── java/
│       │   └── help_desk/
│       │       ├── contact.java               # Contact model class
│       │       ├── contact_DAO.java           # Data Access Object
│       │       ├── contact_insert.java        # Servlet for adding new contacts
│       │       ├── contact_servlet.java       # Servlet for listing contacts
│       │       ├── contact_update.java        # Servlet for updating contacts
│       │       ├── contact_update_view.java   # Servlet for edit form
│       │       └── contact_delete.java        # Servlet for deleting contacts
│       └── webapp/
│           ├── contact.jsp                    # New contact form
│           ├── view_contact.jsp               # Contact listing page
│           ├── contact_update.jsp             # Contact edit form
│           ├── css/
│           │   ├── contact.css                # Main stylesheet
│           │   ├── contact-update.css         # Update form styles
│           │   └── view-contact.css           # Contact list styles
│           ├── js/
│           │   └── contact-validation.js      # Form validation script
│           └── WEB-INF/
│               └── lib/                       # Required libraries
└── pom.xml                                    # Maven configuration
```

## Database Setup

1. Create a MySQL database named `support_desk`
   ```sql
    CREATE DATABASE support_desk;
    USE support_desk;
    ```
2. Use the following SQL script to create the required table:

```sql
    CREATE TABLE `contact` (
    `id` INT NOT NULL AUTO_INCREMENT,
    `name` VARCHAR(100) NOT NULL,
    `email` VARCHAR(100) NOT NULL,
    `contact_no` VARCHAR(20) NOT NULL,
    `request_type` VARCHAR(50) NOT NULL,
    `subject` VARCHAR(200) NOT NULL,
    `message` TEXT NOT NULL,
    PRIMARY KEY (`id`)
    );

```

## Configuration

Database connection settings are located in `contact_DAO.java`. Update the following constants with your database credentials:

```java
private static final String url = "jdbc:mysql://localhost:3306/support_desk";
private static final String username = "root";
private static final String password = "1234";
```

## Building and Running

### Prerequisites

- JDK 8 or later
- Maven
- MySQL Server
- Servlet container (e.g., Apache Tomcat)

### Build Steps

1. Clone the repository
2. Navigate to the project directory
3. Build with Maven:

```
mvn clean package
```

4. Deploy the generated WAR file (`target/help_desk.war`) to your servlet container

### Alternative Deployment

You can also deploy the application directly from an IDE such as Eclipse or IntelliJ IDEA with appropriate server integration plugins.

## Usage

1. Access the application through: `http://localhost:8080/help_desk/`
2. Use the navigation menu to switch between adding new contacts and viewing existing ones
3. Fill out the contact form to add new support requests
4. View all contacts in the listing page
5. Edit or delete contacts using the action buttons in the contact list

## License

This project is licensed under the MIT License - see the LICENSE file for details.
