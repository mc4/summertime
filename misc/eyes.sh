#script for OSX that reminds user to not stare at the screen for too long

#recommended to be run in the background with "./eyes.sh &"
#possibly might need local permissions changed

while [ 1 ]
do
	sleep 30m
	terminal-notifier -message "Take care of your eyes." -title "Reminder"
done

#NOTES: only works for the life of bash shell

#useful relevant commands "jobs -l" gets pid and use "kill PID" to terminate process
#TODO: find a more clever way to do this.