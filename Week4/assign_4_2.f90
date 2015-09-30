!************************************************************************
!Author: Navrit Bal
!Student Number:12958319
!Creation Date:29/01/2013
!Assignment Number:4_2
!Purpose: To generate a list of student number and assignment number 
!         combinations for the purposes of helping a teacher check to see
!         which students have done which assignments
!************************************************************************

PROGRAM assign_4_2
  
	IMPLICIT NONE
	
	!Declares the number of students and assignments which are inputted by
	!the user later. Also declares a 'counter' variable which is used to
	!store the number of student/assignment combinations. Finally 'i' and 'j'
	!variables which are used within the iteration to generate the list
	INTEGER :: student_num,assign_num,counter,i,j
	
	!Initialises the sudent number, assignment number and counter variables
	student_num = 0
	assign_num = 0
	counter = 0
	
	!Gets user input for the student and assignment numbers
	WRITE(*,*) '\n What is the student number?'
	READ(*,*) student_num
	WRITE(*,*) '\n What is the assignment number?'
	READ(*,*) assign_num
	WRITE(*,*) '\n'
	!Opens file and writes headings
	OPEN(99,FILE='assign_4_2.out')	
	WRITE(99,*) 'Student No. \t Assignment'
	WRITE(*,*) 'Student No. \t Assignment'
	
	!Generates the combination list of student and assignment numbers
	DO i = 1,student_num,1
		DO j = 1,assign_num,1			
			WRITE(*,*) i,j
			WRITE(99,*) i,j
			counter = counter + 1
		ENDDO		
	ENDDO
	
	!Prints how many entries were processed and closes the file
	WRITE(*,*) 'Successful entries processed :',counter
	WRITE(99,*) 'Successful entries processed :',counter	
	CLOSE(99)
	
END PROGRAM