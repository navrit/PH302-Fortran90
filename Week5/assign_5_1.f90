!************************************************************************
! code written by P. S. Eudonym , last edited 31/07/10
! Program to find mean and max for a file containing 90 lines of student
! marks between 1 and 100
!************************************************************************
!EDIT INFORMATION
!Author: Navrit Bal
!Student Number:12958319
!Last edit Date:05/02/2013
!Assignment Number:5_1       
!************************************************************************

PROGRAM stats_finder
	IMPLICIT NONE
	
	! Array for the marks
	INTEGER , DIMENSION (90) :: marks
	! Stats variables
	REAL :: meanmark
	INTEGER :: maxmark , marksum
	INTEGER :: studentmin , studentmax
	! generic counter variable
	INTEGER :: i
	
	! Open read in file , and iterate through all 90 entries , reading in the 
	! marks for all students
	! Additional check to make sure the mark is within valid range
	OPEN (10,FILE ='sample_marks.dat')
	DO i = 1,90,1
		READ (10,*) marks (i)
		IF (marks (i) > 100) THEN
			WRITE(*,*)'Error with file , mark greater than 100 found . Exiting .'
			STOP
		END IF
	END DO
	CLOSE (10)
	
	! Initialise the stats variables
	maxmark = -1
	marksum = 0
	studentmin = -1
	studentmax = -1

	!For each mark , add it to the sum and find if it is the new maximum
	DO i = 1, 90, 1
		marksum = marksum + marks (i)
		IF ( marks (i) > maxmark ) THEN
			maxmark = marks (i)
			studentmax = i
		END IF
	END DO
	
	!For each mark , add it to the sum and find if it is the new minimum
	DO i = 1, 90, 1
		marksum = marksum + marks (i)
		IF ( marks (i) < maxmark ) THEN
			maxmark = marks (i)
			studentmax = i
		END IF
	END DO	
	
	! divide sum by number of elements to get mean
	meanmark = REAL ( marksum ) / 90.0
	
	! Output stats
	WRITE(*,*)'Maximum mark is:',maxmark
	OPEN(10,FILE='assign_5_1.out')
	WRITE(10,*)'Obtained by student number :',studentmax
	WRITE(10,*)'Mean mark is:',meanmark
	CLOSE(10)
	
END PROGRAM stats_finder