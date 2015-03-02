!*************************************************************************
!Author : Navrit Bal
!Student Number : 12958319
!Creation Date : 19/03/2013
!Assignment Number : 10_2
!Purpose: Find the square root of a number using the Newton-Raphson method
!*************************************************************************

PROGRAM assign_10_2
	IMPLICIT NONE
	
	! Variable declaration block
	DOUBLE PRECISION	:: x, num, xold
	INTEGER 			:: n, i
	
	! Gets necessary user input
	WRITE(*,*)'Which number would you like to calculate the square root of?'
	READ (*,*) num
	WRITE(*,*)'Initial guess?'
	READ (*,*) x
	WRITE(*,*) 'How many iterations?'
	READ (*,*) n
	WRITE(*,*) '\n'
	
	!Opens the file 'assign_10_2.out' in unit number 99
	OPEN (99,FILE='assign_10_2.out')
	! Writes information header to the file 'assign_10_2.out'
	WRITE(99,'(A,F0.14)') 'Number to find the square root of (num) : ', num
	WRITE(99,'(A,F0.14)') 'Initial guess (X) : ', x
	WRITE(99,'(A,I0)') 'Number of iterations (n) : ', n
	WRITE(99,'(A)') 'Xn+1 =  X - ( ((X**2)-num)/(2*X) )'
	WRITE(99,'(A)') '\n i  X \t\t\t        Xn+1'
	! Writes header to the screen
	WRITE (*,'(A)') '\n i  X \t\t\tXn+1'
	
	! Calculates the next iteration using the Newton-Raphson method
	!   and writes the computed data to the file and screen in a 
	!   tabular format
	DO i = 1, n
		xold = x
		x = ( x - ( ((x**2)-num)/(2*x) ) )
		WRITE (*,'(X,I0,A,F0.14,A,F0.14)') i,'  ',xold,'\t', x
		WRITE(99,'(X,I0,A,F0.14,A,F0.14)') i,'  ',xold,'\t', x
	END DO
	
	! Closes 'assign_10_2.out'
	CLOSE(99)
	
END PROGRAM assign_10_2