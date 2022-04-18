# Access Log Parsing

`awk '/midnitemeerkats/ {print $1, $3, $7}' access.log` | search for string midnitemeerkats 

`TZ=America/Los_Angeles awk '/midnitemeerkats/ {print strftime("%T", $1), $3, $7}' access.log` | convert epoch to timezone

