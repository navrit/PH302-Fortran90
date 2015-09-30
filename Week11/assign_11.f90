!***************************************************************************
!Author: Navrit Bal
!Student Number : 12958319
!Creation Date : 21/03/2013
!Assignment Number: 11
!Purpose: Simulate Rutherford's scattering experiment which is a 2 body 
!		system and requires the use of time stepping and atomic units in 
!		order to minimise rounding errors due to very large differences 
!		in exponents of floating point numbers
!***************************************************************************

PROGRAM assign_11
	! Turns off implicit typing
	IMPLICIT NONE
	
	! Defines a custom TYPE which represents a 2D vector
	!    with x and y components
	TYPE vector
		DOUBLE PRECISION :: x, y
	END TYPE vector
	
	!-----------------------------------------------------------------------
	! Declaration of variables block
	DOUBLE PRECISION :: Ma, Rlim, const, c
	TYPE(vector) 	 :: F, r, unit_r, v, a
	INTEGER 		 :: i
	!-----------------------------------------------------------------------
	
	!-----------------------------------------------------------------------
	! Initialising of various constants block
	Ma		= (7294.3)	! *Me = [kg]	! Mass of alpha particle [Me]
	const	= (2*79)					! Repeatedly used constant
						! Charge of alpha particle * gold nucleus
	c 		= (137.035999)
	!-----------------------------------------------------------------------
	
	!-----------------------------------------------------------------------
	! Initialising variable block
	r%y		 = (-0.005)	! *ao = [m]
	v%x		 = 0		! [ao/Ta]
	a%x		 = 0		! [ao/Ta^2]
	a%y		 = 0		! [ao/Ta^2]
	!-----------------------------------------------------------------------
	
	!-----------------------------------------------------------------------
	! Gets user input required for the program
	WRITE(*,*) 'Initial y velocity of alpha particle as a multiple of c'
	WRITE(*,*) 'Should be less than 0.1 due to relativistic factors'
	READ (*,*) v%y
	v%y = (v%y*c)

	WRITE(*,*) 'Initial X offset? Expecting  0 < x < 0.01'
	READ (*,*) r%x
	WRITE(*,*) 'X offset : ', r%x
	!-----------------------------------------------------------------------
	! Defines the limiting distance of computation for the given radius
	Rlim	 = (1.1*(mag(r)))
	WRITE(*,*) 'Distance at which computation will halt :', Rlim, 'atomic &
															&length units'
	WRITE(*,*) 'Magnitude of r : ',(mag(r))
	
	!Opens the file 'output.dat' in unit number 99
	OPEN(99,FILE='output.dat')
	
	!-----------------------------------------------------------------------
	! Calculates the force, acceleration, velocity and therefore position
	!  iteratively in time steps of 1e-5 atomic time units
	
	! Up to 10,000 iterations are performed or until the condition in the 
	!  IF statement is met
	
	! Various vector operations are in the functions beyond the DO loop
	!  and are used in the main caluclations to simplify reading and coding
	!  the solutions to this simulation
	
	DO i = 1, 10000
		IF ((mag(r)) > Rlim) THEN
			CLOSE(99)
			STOP
		ELSE
			unit_r 	= div(r,(mag(r)))
			F 		= (mult(unit_r,((const)/((mag(r))**2))))
			a 		= (div(F,Ma))
			v 		= (add(v,(mult(a,(1D-5)))))
			r		= (add(r,(mult(v,(1D-5)))))
			! Writes positions to the file 'output.dat'
			WRITE(99,'(F0.18,X,F0.18)') r%x, r%y
		END IF
	END DO
	
	! Closes the file 'output.dat' in unit number 99
	CLOSE(99)
	
	!-----------------------------------------------------------------------
	
CONTAINS ! Various vector manipulation functions

	! Multiplies a 2D vector by a scalar, resulting in a vector
	TYPE(vector) FUNCTION mult(a, b)
		IMPLICIT NONE
		TYPE(vector), INTENT(IN) 	 :: a
		DOUBLE PRECISION, INTENT(IN) :: b
		mult%x	 = a%x * b
		mult%y	 = a%y * b
	END FUNCTION mult	
	
	! Divides a 2D vector by a scalar, resulting in a vector
	TYPE(vector) FUNCTION div(a, b)
		IMPLICIT NONE
		TYPE(vector), INTENT(IN) 	 :: a
		DOUBLE PRECISION, INTENT(IN) :: b
		div%x	 = a%x / b
		div%y	 = a%y / b
	END FUNCTION div	
	
	! Adds 2 2D vectors, resulting in another vector
	TYPE(vector) FUNCTION add(a, b)
		IMPLICIT NONE
		TYPE(vector), INTENT(IN) 	 :: a, b
		add%x	 = a%x + b%x
		add%y	 = a%y + b%y
	END FUNCTION add
	
	! Finds the magnitude of a 2D vector, 
	!  resulting in a floating point number
	DOUBLE PRECISION FUNCTION mag(a)
		IMPLICIT NONE
		TYPE(vector), INTENT(IN) 	 :: a
		mag		 = (SQRT((a%x)**2 + (a%y)**2))
	END FUNCTION mag
	
END PROGRAM assign_11