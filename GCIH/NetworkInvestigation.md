# Proxy Access Log Parsing
`awk '/midnitemeerkats/ {print $1, $3, $7}' access.log` | search for string midnitemeerkats (domain name of ransomware)

`TZ=America/Los_Angeles awk '/midnitemeerkats/ {print strftime("%T", $1), $3, $7}' access.log` | convert epoch to timezone

# Search For Beacons
`./findbeacons.py -i 5 -c 10 172.16.42.107 access.log` | search for beacons from specific host

# Search for other compromised hosts
`awk '/www1-google-analytics.com/ {print $3}' access.log | sort -u` | seach for beacon url and print host ips trying to connect

# Search for IP of beacon in PCAP
`tcpdump -nr falsimentis.pcap dst host 167.172.201.123 | cut -d ' ' -f 3 | cut -d '.' -f 1-4 | sort -u` 

# Find First Packet
`for octet in 2 3 103 105 107 108 109; do TZ=PST7PDT tcpdump -tttt -n -r falsimentis.pcap -c 1 "src host 172.16.42.$octet and dst host 167.172.201.123" 2>/dev/null; done` 

# Find First Packet on port 80
`for octet in 2 3 103 105 107 108 109; do TZ=PST7PDT tcpdump -tttt -n -r falsimentis.pcap -c 1 "src host 172.16.42.$octet and dst host 167.172.201.123 and dst port 80" 2>/dev/null; done` 

