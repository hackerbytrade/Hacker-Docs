# String concatenation
## You can concatenate together multiple strings to make a single string. 

Oracle	`'foo'||'bar'`
Microsoft	`'foo'+'bar'`
PostgreSQL	`'foo'||'bar'`
MySQL	`'foo' 'bar' [Note the space between the two strings]`<br>
`CONCAT('foo','bar')`<br>

# Substring
## You can extract part of a string, from a specified offset with a specified length. Note that the offset index is 1-based. Each of the following expressions will return the string ba.

Oracle	`SUBSTR('foobar', 4, 2)`
Microsoft	`SUBSTRING('foobar', 4, 2)`
PostgreSQL	`SUBSTRING('foobar', 4, 2)`
MySQL	`SUBSTRING('foobar', 4, 2)`

# Comments
## You can use comments to truncate a query and remove the portion of the original query that follows your input.

Oracle	`--comment`
Microsoft	`--comment`<br>
`/*comment*/`<br>
PostgreSQL	`--comment`<br>
`/*comment*/`<br>
MySQL	`#comment`<br>
`-- comment` [Note the space after the double dash]<br>
`/*comment*/`<br>

# Database version
## You can query the database to determine its type and version. This information is useful when formulating more complicated attacks.

