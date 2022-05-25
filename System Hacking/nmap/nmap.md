`cd /usr/share/nmap/scripts`
`nmap -p80 --script=http-enum 172.16.80.1`
`nmap -p80 --script=http-methods --script-args http-methods.url-path='/wp-includes/' $IP`
`nmap -p80 -sV --script http-wordpress-enum offsecwp`