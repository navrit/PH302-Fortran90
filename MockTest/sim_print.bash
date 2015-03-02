#! /bin/bash

#Script to simulate amount of time taken to print source code+output at end of test
echo "Simulating time taken to print documents."

#initialise a variable indicating whether test was successful or not
success=true

#iterate six times in steps of approx 10 seconds for roughly one minute to print and collect work
for i in 1 2 3 4 5 6 ; do
   if [ ${i} -gt 1 ] ; then
      echo ' Still printing...'
   fi
   sleep 10

   #get random number between 1 and 72, 3 specific possible errors (1/24 chance per 10 seconds)
   #overall chance over one minute of 25%
   NUMBER=$[ ( $RANDOM % 72 )  + 1 ]
   #if rand rolled a 1, 2 or 3, an error occurs
   if [ ${NUMBER} == 1 ] ; then
      echo "Simulated print error: Printer incorrectly selected!"
      success=false
      break
   elif [ ${NUMBER} == 2 ] ; then
      echo "Simulated print error: You notice a mistake in document/printout that needs correcting!"
      success=false
      break
   elif [ ${NUMBER} == 3 ] ; then
      echo "Simulated print error: Page(s) go missing at printer!"
      success=false
      break
   elif [ ${NUMBER} == -1 ] ; then
      #this condition cannot/should not be able to actually happen, unnecessary reference to roguelikes, ignore
      echo "You have been eaten by a Grue."
   fi

   #calculate number of seconds (10 seconds * i'th iteration) and tell user
   value=$[10*${i}]
   echo -n "${value} seconds."
done

#if success flag has not been reset, simulated job completed successfully, else, instruct that reprint is necessary
if ${success} ; then
   echo -e ' Print job completed and collected successfully! :D\nNow run:\nsource ~/finish.bash\nas your final task'
else
   echo "Print job failed for some reason, run script again to simulate trying to reprint. :("
fi
