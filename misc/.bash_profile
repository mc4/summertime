##################################################
########		  MARK'S BASH WORLD       ########
# ---------------------------------------------- #
# With much help from....						 #	
# http://natelandau.com/my-mac-osx-bash_profile/ #
##################################################

#   -------------------------------
#   ENVIRONMENT CONFIGURATION
#   -------------------------------

	PS1="\h: " 

	# Set architecture flags
	export ARCHFLAGS="-arch x86_64"
	# Ensure user-installed binaries take precedence
	export PATH=/usr/local/bin:$PATH
	# Load .bashrc if it exists
	test -f ~/.bashrc && source ~/.bashrc

#	Set Default Editor (change 'Nano' to the editor of your choice)
#   ------------------------------------------------------------
    export EDITOR=/usr/bin/Sublime\ Text

#   ---------------------------------------
#   NETWORKING
#   ---------------------------------------

	alias myip='curl ip.appspot.com/ ; echo'			# myip: public facing IP address
	alias netCons='lsof -i'                             # netCons:      Show all open TCP/IP sockets
	alias flushDNS='dscacheutil -flushcache'            # flushDNS:     Flush out the DNS Cache
	alias lsock='sudo /usr/sbin/lsof -i -P'             # lsock:        Display open sockets
	alias lsockU='sudo /usr/sbin/lsof -nP | grep UDP'   # lsockU:       Display only open UDP sockets
	alias lsockT='sudo /usr/sbin/lsof -nP | grep TCP'   # lsockT:       Display only open TCP sockets

#   ---------------------------------------
#   SYSTEMS OPERATIONS & INFORMATION
#   ---------------------------------------

#   cleanupDS:  Recursively delete .DS_Store files
#   -------------------------------------------------------------------
	alias cleanupDS="find . -type f -name '*.DS_Store' -ls -delete"

#   finderShowHidden:   Show hidden files in Finder
#   finderHideHidden:   Hide hidden files in Finder
#   -------------------------------------------------------------------
    alias finderShowHidden='defaults write com.apple.finder ShowAllFiles TRUE'
    alias finderHideHidden='defaults write com.apple.finder ShowAllFiles FALSE'

#   ---------------------------------------
#   HOMEBREW 
#   ---------------------------------------

	#Activiates bash completion
	if [ -f $(brew --prefix)/etc/bash_completion ]; then
    	source $(brew --prefix)/etc/bash_completion
	fi

#   ---------------------------------------
#   MISC.
#   ---------------------------------------

#   lr:  Full Recursive Directory Listing
#   ------------------------------------------
	alias lr='ls -R | grep ":$" | sed -e '\''s/:$//'\'' -e '\''s/[^-][^\/]*\//--/g'\'' -e '\''s/^/   /'\'' -e '\''s/-/|/'\'' | less'