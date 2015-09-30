!************************************************************************
!Author: Navrit Bal
!Student Number:12958319
!Creation Date:25/01/2013
!Assignment Number:3_1
!Purpose: To calculate solutions to a quadratic equations, print the results
!                to the screen and to print other results to a file 
!                called assign_3_1.out. 
!                Also handles errors to a point with input validation
!************************************************************************

PROGRAM assign_3_1
  
  IMPLICIT NONE
  
  !a,b,c are variables and are initialised here
  !dis will store the answer
  REAL :: a,b,c,dis,x_plus,x_neg
  
  !Initial conditions
  a = 0 
  b = 0
  c = 0
  x_plus = 0
  x_neg = 0

  !Opens assign_3_1.out in unit number 99
  OPEN(99,FILE='assign_3_1.out')

  !Gets user input in a reasonably friendly manner
  WRITE(*,*) 'a = what??'
  READ(*,*) a
  WRITE(*,*) 'b = what??'
  READ(*,*) b
  WRITE(*,*) 'c = what??'
  READ(*,*) c

  dis = (b**2 - 4*a*c) !Calculate the disinant
  
  !Input validation and checking the number of solutions  
  IF (dis .gt. 0.0) THEN
	WRITE(*,*) 'There are 2 solutions to the quadratic equation'
	!Calculates the positive and negative x solution to the quadratic equation
	x_plus = ((-b + SQRT(dis))/(2*a))
	x_neg = ((-b - SQRT(dis))/(2*a))
  ELSEIF (dis .eq. 0.0) THEN
	x_plus = ((-b)/(2*a))
  ELSEIF (dis .lt. 0.0) THEN
	WRITE (*,*)  'Based on the coefficients entered,'
	WRITE (*,*)  'there are no solutions'
	WRITE (99,*) 'No real solutions'	
  ENDIF

  !Prints various useful pieces of information 
  WRITE (99,*) "\n Here are the coefficients of the quadratic equation"
  WRITE (99,*) "a = ",a
  WRITE (99,*) "b = ",b
  WRITE (99,*) "c = ",c
    
  WRITE (99,*) "\n Here is the positive x value : ",x_plus
  WRITE (99,*) "Here is the negative x value : ",x_neg
  WRITE (99,*) "\n If either of the above values are 0.0 or NaN"
  WRITE (99,*) "there is not a real root for that value \n"
  
  !Forcefully closes the file followed by halting execution
  CLOSE(99)

END PROGRAM 
