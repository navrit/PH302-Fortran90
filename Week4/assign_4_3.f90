!************************************************************************
!Author: Navrit Bal
!Student Number:12958319
!Creation Date:29/01/2013
!Assignment Number:4_3
!Purpose: 
!************************************************************************

PROGRAM assign_4_3
  
	IMPLICIT NONE
	
	INTEGER :: i,j
	
	j = -4
	
	DO i = -1,8,2
		j = j*i
		WRITE(*,*) j
	END DO
	
END PROGRAM