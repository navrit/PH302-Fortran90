!************************************************************************
!Author: Navrit Bal
!Student Number:12958319
!Creation Date:25/01/2013
!Assignment Number:3_2
!Purpose: To calculate solutions to a quadratic equations, print the results
!                to the screen and to print other results to a file 
!                called assign_3_2.out. 
!                Also handles errors to a point with input validation
!************************************************************************

PROGRAM assign_3_2
  
  IMPLICIT NONE
  
  !a,b,c are variables and are initialised here
  !dis will store the answer
  REAL :: a,b,c,dis,x_plus,x_neg
  INTEGER :: mode
  
  !Initial conditions
  a = 0 
  b = 0
  c = 0
  x_plus = 0
  x_neg = 0

  WRITE(*,*) "Choose a mode out of the following choices" 
  WRITE(*,*) "1 - Only output to the screen, not the file"
  WRITE(*,*) "2 - Overwrite existing file, not display to the screen"
  WRITE(*,*) "3 - Append existing file, not display to the screen"
  READ(*,*) mode
  
  !Gets user input in a reasonably friendly manner
  WRITE(*,*) '\n a = what??'
  READ(*,*) a
  WRITE(*,*) 'b = what??'
  READ(*,*) b
  WRITE(*,*) 'c = what??'
  READ(*,*) c

  dis = (b**2 - 4*a*c) !Calculate the discriminat 

  IF ((mode ==2) .OR. (mode == 3)) THEN
	!Input validation and checking the number of solutions  
	IF (dis > 0.0) THEN
		WRITE(*,*) 'There are 2 solutions to the quadratic equation'
		!Calculates the positive and negative x solution to
		!the quadratic equation
		x_plus = ((-b + SQRT(dis))/(2*a))
		x_neg = ((-b - SQRT(dis))/(2*a))
	ELSEIF (dis == 0.0) THEN
		x_plus = ((-b)/(2*a))
	ELSEIF (dis < 0.0) THEN
		WRITE (*,*)  'Based on the coefficients entered,'
		WRITE (*,*)  'there are no solutions'
		WRITE (99,*) 'No real solutions'	
	ENDIF
  ENDIF 
  
  
  SELECT CASE (mode)
	CASE (1) !Print to screen mode
		!Prints various useful pieces of information 
		WRITE (*,*) "\n\n Here are the coefficients of the quadratic equation"
		WRITE (*,*) "a = ",a
		WRITE (*,*) "b = ",b
		WRITE (*,*) "c = ",c
    
		WRITE (*,*) "\n Here is the positive x value : ",x_plus
		WRITE (*,*) "Here is the negative x value : ",x_neg
		WRITE (*,*) "\n If either of the above values are 0.0 or NaN"
		WRITE (*,*) "there is not a real root for that value \n\n"		
		
	CASE (2) !Overwrite file mode
		!Opens assign_3_2.out in unit number 99 in overwrite mode
		OPEN(99,FILE='assign_3_2.out')

		!Prints various useful pieces of information 
		WRITE (99,*) "\n\n Here are the coefficients of the quadratic equation"
		WRITE (99,*) "a = ",a
		WRITE (99,*) "b = ",b
		WRITE (99,*) "c = ",c
    
		WRITE (99,*) "\n Here is the positive x value : ",x_plus
		WRITE (99,*) "Here is the negative x value : ",x_neg
		WRITE (99,*) "\n If either of the above values are 0.0 or NaN"
		WRITE (99,*) "there is not a real root for that value \n\n"		
		
		CLOSE(99) !Forcefully closes the file followed by halting execution
		
	CASE (3) !Append file mode
		!Opens assign_3_2.out in unit number 99 in append mode
		OPEN(99,FILE='assign_3_2.out',POSITION='APPEND')
		
		!Prints various useful pieces of information 
		WRITE (99,*) "\n\n Here are the coefficients of the quadratic equation"
		WRITE (99,*) "a = ",a
		WRITE (99,*) "b = ",b
		WRITE (99,*) "c = ",c
    
		WRITE (99,*) "\n Here is the positive x value : ",x_plus
		WRITE (99,*) "Here is the negative x value : ",x_neg
		WRITE (99,*) "\n If either of the above values are 0.0 or NaN"
		WRITE (99,*) "there is not a real root for that value \n\n"
		
		CLOSE(99) !Forcefully closes the file followed by halting execution
		
	CASE DEFAULT !In case of invalid input
		WRITE (*,*) "You have entered invalid input"
		WRITE (*,*) "Next time enter '1', '2' or '3'"
		READ (*,*) 
		STOP !Halts execution
		
  END SELECT

  
END PROGRAM 
