!************************************************************************
!Author: Navrit Bal
!Student Number : 12958319
!Creation Date : 14/03/2013
!Assignment Number :  9_1
!Purpose : 
!         
!         
!************************************************************************

PROGRAM assign_9_1
	IMPLICIT NONE
	
	INTEGER :: i, iostatnum, linenum
	COMPLEX, DIMENSION(:), ALLOCATABLE :: dat
	LOGICAL :: eof = .FALSE.
	CHARACTER :: dummy
	
	linenum = 0
	
	!Opens the file 'assign_.out' in unit number 99
	OPEN(99,FILE='complex_data.dat')
	
	DO WHILE (.NOT. eof)
		READ(99,*,IOSTAT = iostatnum) dummy
		
		IF (iostatnum == 0) THEN
			linenum = linenum + 1
		ELSEIF (iostatnum == -1) THEN
			WRITE(*,*) 'Number of lines : ', linenum
			eof = .TRUE.
		ELSE
			WRITE(*,*) 'Non EOF error encountered, aborting'
			WRITE(*,*) 'IOSTAT value : ',iostatnum
			CLOSE(99)
			STOP
		END IF
	END DO
	
	IF (linenum == 0) THEN
		WRITE(*,*) 'No valid lines detected in complex_data.dat, aborting'
		STOP
	END IF
	
	ALLOCATE(dat(1:linenum))
	
	DO i = 1, linenum
		READ(99,*,IOSTAT=iostatnum) dat(i)
		
		IF (iostatnum .NE. 0) THEN
			WRITE(*,*) 'Error at line :', i
			WRITE(*,*) 'ABORTING'
			STOP
		END IF
	END DO
	
	CLOSE(99)
	
	WRITE(*,*) dat
	
END PROGRAM