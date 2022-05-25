`sudo apt install -y gobuster`

`gobuster dir -u $URL -w /usr/share/wordlists/dirb/common.txt -t 5 -b 301`
# -b parameter to blocklist the response code 301, an HTTP status that typically indicates the requested resource is set as a permanent redirect.