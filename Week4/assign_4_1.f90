!************************************************************************
!Author: Navrit Bal
!Student Number:12958319
!Creation Date:29/01/2013
!Assignment Number:4_1
!Purpose: This writes out the song 99 bottles on a wall but starting at
!         22 bottles instead. It uses a DO loop to do so. The number of
!         bottles is hard coded and does not accept any user input
!************************************************************************

PROGRAM assign_4_1 
	IMPLICIT NONE
	
	!Declares the loop variable 'count', the number of number of bottles 
	! 'n' along with the decremented value of 'n' which is 'k'
	INTEGER :: count,n,k
	
	!Opens the file 'assign_4_1.out' is unit number 99
	OPEN(99,FILE='assign_4_1.out')
	
	!Initialises the number of bottles 'n' and 'k'
	n = 22
	k = 0
	
	!Do loop which does all of the printing and is dependent on the number
	! of bottles left
	DO count = 1,22,1
		!Initial spacing - purely cosmetic purposes
		WRITE(*,*) '\n'
		WRITE(99,*) '\n'
		!Writes the song with the appropriate lyrics to the screen and file
		!This IF section handles all plural bottle cases
		IF (n > 1) THEN 
			WRITE(*,*) n,' bottles of beer on the wall,'
			WRITE(*,*) n,' bottles of beer,'
			WRITE(*,*) ' \t      you take one down, pass it around,'
			k = (n-1)
			IF (k > 1) THEN
				WRITE(*,*) k,' bottles of beer on the wall ;'
			ELSEIF (k == 1) THEN
				WRITE(*,*) k,' bottle of beer on the wall ;'
			ENDIF	
			WRITE(*,*) '\n'
			
			WRITE(99,*) n,' bottles of beer on the wall,'
			WRITE(99,*) n,' bottles of beer,'
			WRITE(99,*) ' \t      you take one down, pass it around,'
			IF (k > 1) THEN
				WRITE(99,*) k,' bottles of beer on the wall ;'
			ELSEIF (k == 1) THEN
				WRITE(99,*) k,' bottle of beer on the wall ;'
			ENDIF	
			WRITE(99,*) '\n'
			n = (n-1)
		!This ELSEIF section handles the singular or zero bottle cases
		! with appropriate lyrics
		ELSEIF (n ==1) THEN
			WRITE(*,*) n,' bottle of beer on the wall,'
			WRITE(*,*) n,' bottle of beer,'
			WRITE(*,*) ' \t      you take one down, pass it around,'
			k = (n-1)
			WRITE(*,*) ' \t      No bottles of beer on the wall ;'
			WRITE(*,*) '\n'

			WRITE(99,*) n,' bottle of beer on the wall,'
			WRITE(99,*) n,' bottle of beer,'
			WRITE(99,*) ' \t      you take one down, pass it around,'
			WRITE(99,*) ' \t      No bottles of beer on the wall ;'
			WRITE(99,*) '\n'
		ENDIF

	END DO
	
	CLOSE(99)
	
END PROGRAM