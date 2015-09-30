!************************************************************************
!Author: Navrit Bal
!Student Number: 12958319
!Creation Date: 21/02/2013
!Assignment Number: 7_2
!Purpose: Calculate and print various qunatities using functions
!************************************************************************

PROGRAM assign_7_2
	IMPLICIT NONE
	
	! Declares all the variables and functions
	REAL :: r, circ_area, circ_perim, sphere_area,&
			&sphere_volume, pi
	
	! Define PI
	pi = 3.14159265359	
	
	! Gets the radius from the user and assigns to 'r'
	WRITE (*,*) 'What is the radius?'
	READ (*,*) r
	
	! Opens the file 'assign_7_2.out' in unit number 99
	OPEN (99,FILE='assign_7_2.out')
	
	! Writes the various calculated quantities in the functions
	WRITE (99,*) 'Circle area : ', circ_area(r, pi)
	WRITE (99,*) 'Perimeter of circle : ', circ_perim(r, pi)
	WRITE (99,*) 'Surface area of sphere : ', sphere_area(r, pi)
	WRITE (99,*) 'Volume of sphere : ', sphere_volume(r, pi)
	WRITE (99,*) 'Area of sphere - area of circle : ',&
				&(sphere_area(r, pi) - circ_area(r, pi))
	WRITE (99,*) 'Volume of sphere where the radius is taken as the&
				    & perimeter of circle : ',(sphere_volume(circ_perim(r, pi)))
	! Closes the file
	CLOSE (99)
		
END PROGRAM assign_7_2