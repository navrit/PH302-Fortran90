!************************************************************************
!Author: Navrit Bal
!Student Number:12958319
!Creation Date:14/02/2013
!Assignment Number:
!Purpose: To interact with object code from 'week7prog.o', taking and passing back 
!         	various parameters with the aim of solving a quadratic equation
!************************************************************************

SUBROUTINE sevensub (a,b,c,x_sol,x_plus,x_min)
	IMPLICIT NONE
	
	! a, b and c take their values from 'week7prog.o' 
	REAL, INTENT(IN) :: a,b,c
	! x_plus and x_min send their values back to 'week7prog.o'
	REAL, INTENT(OUT) :: x_plus,x_min
	! x_sol - number of x solutions sends its value back to 'week7prog.o'
	INTEGER, INTENT(OUT) :: x_sol
	! dis -  discriminant - b**2 - 4*a*c
	REAL :: dis

	!Initial conditions
	x_plus = 0.0
	x_min = 0.0
	x_sol = 0
	dis = 0.0
	
	dis = (b**2 - 4*a*c) !Calculate the discriminant
	
	!Calculates as appropriate, the positive and negative x solution to the quadratic equation
	! and number of x solutions
	IF (dis > 0.0) THEN
		WRITE(*,*) 'There are 2 solutions to the quadratic equation'
		x_plus = ((-b + SQRT(dis))/(2*a))
		x_min = ((-b - SQRT(dis))/(2*a))
		x_sol = 2
	ELSEIF (dis == 0.0) THEN
		x_plus = ((-b)/(2*a))
		x_sol = 1
	ELSEIF (dis < 0.0) THEN
		WRITE (*,*)  'Based on the coefficients entered there are&
						&no real solutions'
		x_sol = 0
	ENDIF	
	
END SUBROUTINE sevensub
