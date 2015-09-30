#! /bin/bash
PS1='[\u@\h]:> '
NONE='\033[00m'
RED='\033[01;31m'
GREEN='\033[01;32m'
YELLOW='\033[01;33m'
PURPLE='\033[01;35m'
CYAN='\033[01;36m'
WHITE='\033[01;37m'
BOLD='\033[1m'
UNDERLINE='\033[4m'



atend(){
	grep -v CLASSTESTSETUP ~/.bashrc > tmp.rc
	mv tmp.rc ~/.bashrc
	echo -e $NONE
}

if [ -f ~/.${USER}_test.log ]; then
    newfiles=$(find ~ -newer ~/start.bash -name '*.f90')
    echo -e '\n***** End script called at time:\n' >> ~/.${USER}_test.log
    
    date >> ~/.${USER}_test.log
 
    echo -e '\n***** Fortran files in directory:\n' >> ~/.${USER}_test.log
    find ~ -name '*.f90' |xargs ls -lt >> ~/.${USER}_test.log
    echo -e "\nThese files are new:\n" $newfiles
    
    
    
    echo -e '\n*****Open terminal seeions by this user:\n' >> ~/.${USER}_test.log
    
    who | grep ${USER} >> ~/.${USER}_test.log

    echo -e '\n*****\n' >> ~/.${USER}_test.log

    find ~ -name '*.f90*' |xargs chmod +r
    find ~ -name '*.out*' |xargs chmod +r
    for f in $newfiles
    do 
	    echo "-------------------------------------------------"  >> ~/.${USER}_test.log
	    echo "FILE: " $f " ...:" >> ~/.${USER}_test.log
	    cat $f >> ~/.${USER}_test.log
	    echo "-------------------------------------------------"  >> ~/.${USER}_test.log
    done


#   mail tk218@heron < ~/.${USER}_test.log

    #rm ~/.${USER}_test.log
    
    echo 'Test completed'
    echo 'Have a nice day!'

    atend
    rm ~/start.bash
    rm ~/finish.bash
else
    echo 'Test either not started or already finished.'
fi
