!**********************************************
! Author : Navrit Bal - njsb2
! Student ID : 12958319
! Creation Date : 19/02/2013
! Purpose : To calculate interest repayments on a  mortgage loan  
!**********************************************
PROGRAM mortgage
 ! Turn implicit typing off
 IMPLICIT NONE 
 
 ! Declare all of the financial variables - number of years 'n', annual repayment 's', 
 ! additional cost of loan 'c', principal 'p', interest rate 'interest'
 REAL :: s,p,interest,c
 INTEGER :: n
 
 ! Initialise all variables as 0 or 0.0
 s = 0.0
 p = 0.0
 interest = 0.0
 c = 0.0
 n = 0
 
 ! Gets user inputs and confirms what they have just typed in
 WRITE (*,*) 'What is the principal?'
 READ (*,*) p
 WRITE (*,*) 'What is the interest rate?'
 READ (*,*) interest
 WRITE (*,*) 'Principal : ',p
 WRITE (*,*) 'Interest : ',interest
 
 ! Checks if program should actually run - input validation
 IF ( ( p > 0.0 ) .AND. ( interest > 0.0 ) ) THEN
	! Opens 'mortgage.out' in unit number 99
	OPEN (99,FILE='mortgage.out',POSITION='APPEND')
	
	! Prints relevant headings
	WRITE (99,*) '{Navrit Bal}'
	WRITE (99,*) '\n\tRepayments on loan of £P at I% interest'
	WRITE (99,*) 'No. of Years\tAnnual Repayments\tTotal Cost of Loan'
	
	! Generates and prints annual repayments and total cost of the loan
	DO n=1,30,1
		s = ((p*interest)/(1-(1+interest)**(-n)))
		c = ((n*s)-p)
		WRITE (99,*) n,'\t',s,'\t',c
	ENDDO
	
	! Closes 'mortgage.out'
    CLOSE (99)
 ENDIF

! Ends the program 
END PROGRAM mortgage