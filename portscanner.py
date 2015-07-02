import sys, socket
from optparse import OptionParser

def scan_ports(host, scope):
	""" host is target website
		range is a tuple that holds port range """
	start = int(scope[0])
	end = int(scope[1])
	open_ports=[]

	try:
		ip = socket.gethostbyname(host)
	except socket.gaierror:
		print 'hostname could not be resolved. exiting...'
		sys.exit()

	print "IP address of host "+host+" is "+ip

	for i in range(start,end+1):
		print ('scanning port... ', i)
		try:
			sock = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
		except socket.error, msg:
			print 'Failed to create socket. Error code: ' + str(msg[0]) + ' , Error message : ' + msg[1]
			sys.exit();

		sock.settimeout(2)
		result=sock.connect_ex((ip, i))

		if result == 0:
			open_ports.append(i)
		sock.close()

	return open_ports

def print_open_ports(open_ports):
	""" prints a list of open ports """
	if(len(open_ports)) == 0:
		print "no port open!"
		return

	print "port(s) currently open..."
	for i in open_ports:
		print(i)

def main():
	parser = OptionParser()
	parser.add_option('-H',dest='host',type='string', \
		help="specify target host")
	parser.add_option('-P', dest = 'ports', type = 'string', \
		help = "specify port range separated by a '-' e.g. 1000-8000")

	(options, args) = parser.parse_args()

	if(options.host == None or options.ports == None):
		print parser.usage()
		sys.exit()
	else:
		host = options.host
		ports = str(options.ports).split('-')

	print "host is: "+host+"\tport range: "+str(ports)

	open_ports = scan_ports(host, ports)
	print_open_ports(open_ports)

if __name__ == "__main__":
	main()