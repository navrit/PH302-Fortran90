#!/bin/bash
PS1='\033[01;31m[SAFE(\u)\@]:> '
alias pico="pico;echo -e '\033[01;31m' "
NONE='\033[00m'
RED='\033[01;31m'
GREEN='\033[01;32m'
YELLOW='\033[01;33m'
PURPLE='\033[01;35m'
CYAN='\033[01;36m'
WHITE='\033[01;37m'
BOLD='\033[1m'
UNDERLINE='\033[4m'


printmode(){
	line="#######################################################"
	echoc="echo -e $BOLD $RED" 
	$echoc $line
	$echoc " ____    _    _____ _____   __  __  ___  ____  _____ "
	$echoc "/ ___|  / \  |  ___| ____| |  \/  |/ _ \|  _ \| ____|"
	$echoc "\___ \ / _ \ | |_  |  _|   | |\/| | | | | | | |  _|  "
	$echoc " ___) / ___ \|  _| | |___  | |  | | |_| | |_| | |___ "
	$echoc "|____/_/   \_\_|   |_____| |_|  |_|\___/|____/|_____|"
	$echoc $line
	$echoc $line
	echo -e $RED
												    
}

atstart(){
	printmode 
	tmp=$(grep CLASSTESTSETUP ~/.bashrc)
	if [ -z "$tmp" ]
	then

	    echo '-----------------------------------------------------' >>  ~/.${USER}_test.log

	    echo 'Starting test'
	    
	    echo 'subject: PH302_TEST_MOCK'  >> ~/.${USER}_test.log
	    echo 'Date: '  >> ~/.${USER}_test.log

	    date >> ~/.${USER}_test.log
	    
	    find ~ -name '*.f90*' |xargs chmod -r
	    find ~ -name '*.out*' |xargs chmod -r
	    echo -e '***** Fortran files in directory:'>> ~/.${USER}_test.log
	    find ~ -name '*.f90' |xargs ls -lt >> ~/.${USER}_test.log


	    echo '-----------------------------------------------------' >>  ~/.${USER}_test.log
	 
	    echo '~/start.bash      # CLASSTESTSETUP ' >> ~/.bashrc
	    echo "PS1='$PS1'      # CLASSTESTSETUP " >> ~/.bashrc
	    echo " alias pico=\"pico;echo -e '\\033[01;31m' \"      # CLASSTESTSETUP  " >> ~/.bashrc
	else
		if [ ! -f ~/.${USER}_test.log ] 
		then
			~/finish.bash
			~/start.bash
		else
		    echo '-----------------------------------------------------' >>  ~/.${USER}_test.log

		    echo 'Tried to run script again' >> ~/.${USER}_test.log


		    
		    echo 'Date: '  >> ~/.${USER}_test.log

		    date >> ~/.${USER}_test.log
	    
		fi
    fi

}
atstart

