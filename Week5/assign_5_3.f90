!************************************************************************
!Author: Navrit Bal
!Student Number:12958319
!Creation Date:07/02/2013
!Assignment Number:5_3
!Purpose:  Bubble sorting an array in a file
!         
!         
!************************************************************************

PROGRAM assign_5_3
	IMPLICIT NONE
	
	INTEGER :: n,temp,i,j
	INTEGER, DIMENSION(1000) :: array
	LOGICAL :: check
	
	OPEN (99,FILE='assign_5_3.out') 
	OPEN (98,FILE='sample_random.dat')
	READ (98,*) array
	CLOSE(98)
	
	n = SIZE(array)
	check = .FALSE.
	
	DO i = 1, ( n - 1 ) ,1	
		
		check = .FALSE.
		DO j = 1, ( n - i ) ,1
			IF (array(j) > array(j+1)) THEN
				check = .TRUE.
				temp = array(j)
				array(j) = array(j+1)
				array (j+1) = temp	
			ENDIF
		ENDDO
		
		IF (check .EQV. .FALSE.) THEN
			WRITE (*,*) 'Finished! Exiting now'
			WRITE (99,*) array
			CLOSE (99)
			WRITE (*,*) array(1:10),'\n'
			WRITE (*,*) array(991:1000)
			STOP
		ENDIF
		
	ENDDO
	
	CLOSE(99)
	
END PROGRAM