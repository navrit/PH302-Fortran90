!************************************************************************
!Author : Navrit Bal
!Student Number : 12958319
!Creation Date : 18/03/2013
!Assignment Number : 10_1
!Purpose : Attempt to calculate PI via stochastic methods and comparison
!			to the real value of PI
!************************************************************************

PROGRAM assign_10_1
	IMPLICIT NONE
	
	! Declaration of variables block
	INTEGER :: choice, i, j, circle
	INTEGER, DIMENSION(4) :: seeds
	DOUBLE PRECISION :: n, x, y, PI_comp, PI_proper, percent
	
	! Gets user input for seed information for the random number function
	WRITE(*,*) 'How many seeds numbers would you like to input?'
	WRITE(*,*) 'You may choose 1 or 4 ONLY'
	READ(*,*) choice
	
	IF (choice == 1) THEN
		WRITE(*,*) 'Enter 1 integer for the seeds'
		READ(*,*) seeds(1)
		! Expands the seed array using the first index
		DO i = 2, 4
			seeds(i) = (seeds(i-1)+66)**1.1
		END DO
	ELSEIF (choice == 4) THEN
		! Reads in all seed values sequentially
		WRITE(*,*) 'Enter 4 integers for the seeds on different lines' 
		DO i = 1, 4
			READ(*,*) seeds(i)
		END DO
	ELSE
		! Invalid user input handling
		WRITE(*,*) 'ERROR'
		WRITE(*,*) 'Please only write 1 or 4'
		READ(*,*)
		STOP
	END IF
	
	! Gets the number of iterations to run the DO loop below
	WRITE(*,*) 'Number of iterations? Must be more than 1'
	READ(*,*) n
	! Calls random seed subroutine and modifies the seeds array
	CALL RANDOM_SEED(PUT = seeds)
	
	DO i = 1, n
		! Generates random numbers
		CALL RANDOM_NUMBER(x)
		CALL RANDOM_NUMBER(y)
		! Checks to see if those points are in the circle
		IF (((x**2) + (y**2)) < 1.0) THEN
			circle = circle + 1
		END IF
	END DO
	
	! Computes the value of PI according to this stochastic method along with the accurate version
	PI_comp = ( 4.0 * (circle/n) )
	PI_proper = ( 4.0 * ATAN(1.0) )
	! Calculates the percentage difference
	percent = ( ((PI_comp/PI_proper)*100)-100 )
	
	! Writes out the relevant results
	WRITE(*,*) 'Pi has been computed to be :', PI_comp
	WRITE(*,*) 'Pi is actually :', PI_proper
	WRITE(*,'(A,F18.14," %")') 'Percentage difference : ', percent
	
END PROGRAM assign_10_1