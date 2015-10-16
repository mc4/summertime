#**************************************************************************
#script for OSX that reminds user to not stare at the screen for too long *
# by posting an alert to Notification Center using terminal Notifier      *
# to install terminal notifier with *sudo gem install terminal-notifier"  *
#**************************************************************************

#NOTES: only works for the life of bash shell

#recommended to be run in the background with "./eyes.sh &"
#possibly will need local permissions changed

while [ 1 ]
do
	sleep 30m
	terminal-notifier -message "Take care of your eyes." -title "Reminder"
done

#TODO: find a more clever way to kill the process...
#useful relevant commands "jobs -l" gets pid and use "kill PID" to terminate process
#Lit
