!************************************************************************
!Author: Navrit Bal
!Student Number:12958319
!Creation Date:05/02/2013
!Assignment Number:5_2
!Purpose:  Bubble sorting an array in a file
!         
!         
!************************************************************************

PROGRAM assign_5_2
	IMPLICIT NONE
	
	INTEGER :: n,temp,i,j
	INTEGER, DIMENSION(6) :: array
	LOGICAL :: check
	
	array = (/5,7,3,1,5,6/)
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
			WRITE(*,*) 'Finished! Exiting now'
			WRITE (*,*) array
			STOP
		ENDIF
		
	ENDDO
	
	WRITE (*,*) array
	
END PROGRAM