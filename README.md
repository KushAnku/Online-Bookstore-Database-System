# Online Bookstore Database System

## Project Overview
This project is an implementation of a database system for a hypothetical online bookstore. It involves creating, populating, and querying a MySQL database and building a web interface using PHP and HTML to interact with the database.

The system maintains records for books, subjects, suppliers, shipping carriers, customers, employees, and orders. The goal is to enable efficient management of bookstore operations through a functional and user-friendly interface.

---

## Features
1. **Database Creation**:
   - MySQL database with tables for books, suppliers, orders, customers, and more.
   - Populated using provided datasets.

2. **Web Interface**:
   - Built using PHP and HTML.
   - Allows users to execute SQL queries securely and display results dynamically.
   - Supports SELECT, INSERT, UPDATE, and DELETE operations.

3. **SQL Query Execution**:
   - Includes predefined SQL queries to retrieve specific information about books, customers, and orders.

4. **Error Handling**:
   - Displays appropriate error messages for invalid SQL queries.
   - Prevents execution of potentially harmful SQL statements like `DROP`.

---

## Project Structure
- **`src/`**: Contains all PHP and HTML files for the web interface.
  - `index.php`: Main entry point for the web application.
- **`sql/`**: Contains SQL scripts for database schema creation and query execution.
- **`data.zip`**: Dataset used to populate the database.
- **`url.txt`**: URL to access the live web application hosted on Auburn's Mallard server.

---

## Installation and Usage
1. **Request Server Access**:
   - Request personal web space on the Auburn Mallard server [here](https://aub.ie/iwr).
   - Request a MySQL database [here](http://aub.ie/mysqlcreate).

2. **Set Up Environment**:
   - Connect to the Mallard server using WinSCP or SecureCRT.
   - Upload project files to `/home/home$$/$AUusername/public_html`.
   - Ensure the `index.php` file is in the root directory.

3. **Run the Web Application**:
   - Access the web application at: `https://webhome.auburn.edu/~ans0148/index.php`.
   - Use the interface to execute predefined SQL queries and interact with the database.

---

## Predefined SQL Queries
This project includes 19 SQL queries to perform various operations, such as:
- Retrieve book details by supplier or category.
- Calculate the total price of customer orders.
- Identify customers with specific order patterns.
- Summarize employee sales performance.

---

## Useful Resources
- [PHP Tutorial](https://www.w3schools.com/php/)
- Book: *Learning PHP, MySQL & JavaScript* by Robin Nixon (6th Edition).

---

## Submission
- **URL**: The PHP/HTML interface URL is provided in `url.txt`.
- **Code**: Organized in the `src/` folder, including `index.php` and supporting files.
- **SQL Queries**: Documented in `sql.txt`.

---

### Developed by:
**Ankush Singh**
