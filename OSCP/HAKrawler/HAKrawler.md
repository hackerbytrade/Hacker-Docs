# We should carefully understand the strict distinction between a crawling tool and a directory busting tool. 
# During directory busting, mass amounts of data from wordlists are thrown at a target web server to discover directories, files, parameters, or programmatic endpoints. 
# None of this occurs with crawlers, which instead travel across endpoints provided in the user-interface or page source of the target URL or endpoint.

# HA Krawler Installation
`cd /usr/local/`
`sudo wget https://golang.org/dl/go1.17.linux-amd64.tar.gz`
`sudo tar -xzf go1.17.linux-amd64.tar.gz`
`cd /usr/local/go/bin/`
`export PATH=$PATH:/usr/local/go/bin:/home/kali/go/bin/`
`sudo ./go install github.com/hakluke/hakrawler@latest`
`cd /home/kali/go/bin/`
`ls -lsa`