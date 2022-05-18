import requests
import hashlib
import re

def parse_and_encode(text):
    reg = re.compile(r"<h3 align='center'>(.*)</h3>", re.MULTILINE)
    text = reg.findall(text)[0]
    h = hashlib.md5(text.encode('utf-8'))
    dig = h.hexdigest()
    return { 'hash': dig }

session = requests.Session()
r = session.get('http://46.101.27.51:32470/')

data = parse_and_encode(r.text)

r2 = session.post('http://46.101.27.51:32470/', data=data)
reg = re.compile(r"<p align='center'>(.*)</p>", re.MULTILINE)
flag = reg.findall(r2.text)[0]
print(flag)