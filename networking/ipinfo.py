import re
import json
from socket import gethostbyname
from urllib2 import urlopen

#grabs local ip
def get_local_ip():
	try:
		response = urlopen('http://checkip.dyndns.com/')
		html = response.read()
	except:
		print 'error with "http://checkip.dyndns.com/"'
		exit()
	ip = re.search('\d+.\d+.\d+.\d+', html)
	return str(ip.group())

ip = ''
address = raw_input('Enter address or ip of target... or Enter for user information: ')

if address:
	ip = gethostbyname(address)
elif address == None:
	ip = get_local_ip()

#get data of ip
ip_info = 'http://ipinfo.io/'+ip+'/json'
data = json.load(urlopen(ip_info))

#extract data
hostname = data['hostname']
city = data['city']
region = data['region']
country = data['country']
postal = data['postal']
location = data['loc']
org = data['org']

#print data
print 'target ip is: ' + ip
print 'target hostname is: ' + hostname
print 'target city is: ' + city
print 'target region is: ' + region
print 'target country is: ' + country
print 'target zipcode is: ' + postal
print 'target approximate location is: ' + location
print 'target ISP(?) is: ' + org