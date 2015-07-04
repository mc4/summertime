from subprocess import call

ip = raw_input("Enter a domain: ")
print call(["whois", ip])