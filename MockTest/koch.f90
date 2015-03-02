!************************************************************
! Author : Navrit Bal
! Creation Date : 15/02/2013
! Purpose : Mock Test - To model the Koch Snowflake
!************************************************************

PROGRAM koch
	
	! n - number of steps to grow the snowflake
	! k - holds 'n-1'
	! sides - number of sides at step 'n'	
	! m -  maths variable to make it easier to read
	INTEGER :: n, k, sides, m
	
	! peri - Perimeter at step 'n'
	! area - Area at step 'n'
	! x and g - maths variables to make it easier to read
	REAL :: peri, area, x, g
	
	! Initialising all the variables starting at n = 1
	n = 1
	area = 1
	sides = 3
	peri = 1
	x = 1
	m = 9
	g = 1.0
	
	! Get user input for the number of steps
	WRITE (*,*) 'Enter the number of steps to grow the snowflake'
	WRITE (*,*) 'This must be more than 0 and an integer'
	READ (*,*) n
	
	! Main function of the program - calculates the area, perimeter and number of sides
	! Opens, closes and prints to the file 'koch.out'
	IF (n > 0) THEN
	
		DO i = 0,n,1
			
			k = n - 1
			g = m**k
			x = sides/g
			area = (area + x )
			sides = (4 * sides)
			peri = ( (4.0/3.0) * peri)
			
			WRITE (*,*) area,' ',sides,' ',peri,' '
			
		ENDDO		
	
	ENDIF
	
	OPEN (99,FILE='koch.out', POSITION='APPEND') 
	WRITE (99,*) 'Area',' ','Sides',' ','Perimeter',' '
	WRITE (99,*) area,' ',sides,' ',peri,' '
	CLOSE (99)
	
END PROGRAM koch