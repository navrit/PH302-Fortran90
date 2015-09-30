!************************************************************************
!Author: Navrit Bal
!Student Number : 12958319
!Creation Date : 02/04/2013
!Assignment Number : 12
!Purpose: To calculate the temperature and therefore pressure at an incrementing 
!         	time step in order to find when (within 0.5s) a carbonated drinks can
!         	will exceed 3.2atm of pressure and explode.
!************************************************************************

PROGRAM assign_12
	! Turns off implicit typing
	IMPLICIT NONE
	
	! Generic loop variable
	INTEGER :: 	i
	! The temperature and pressure are taken from their respective functions
	! t is used for the parameter for the Temp function in order to make is more easily understandable
	REAL	::	temperature, pressure, t
	
	!Opens the file 'pressure.data' in unit number 99
	OPEN(99,FILE='pressure.data')	
	!  Since loop variables cannot be REAL, an integer of twice the desired length in seconds was used
	!    in order to have an effective time step of 0.5s
	
	DO i = 1, 120
		! Only starts printing data after 25.5 seconds
		IF (i > 51) THEN
			WRITE(99,'(F4.1,X,F0.4,X,F0.4)') t, temperature, pressure
		END IF
		! Exits the DO loop and therefore program if the pressure exceeded 3.2atm in the last loop
		IF (pressure > 3.2) THEN
			EXIT
		END IF
		! Calculates the time and forces REAL calculations
		t = (REAL(i)/2)
		! Calculates temperature using the function Temp
		temperature = Temp(t)
		! Calculates pressure using the function P
		pressure = P(temperature)
	END DO
	
	! Closes the file 'pressure.data' in unit number 99
	CLOSE(99)
	
CONTAINS
	
	! This function calculates the temperature at a given time
	REAL FUNCTION Temp(time)
		! Turns off implicit typing
		IMPLICIT NONE
		! Variable for the time
		REAL :: time
		! Calculates the temperature using a given formula
		Temp = (10.0+(0.65*SQRT(60.0*time)))
		
	END FUNCTION Temp
	
	! This function calculates the pressure at a given temperature
	REAL FUNCTION P	(Temp)
		! Turns off implicit typing
		IMPLICIT NONE
		! Variable for the temprature
		REAL	:: Temp
		! Calculates the pressure using a given formula
		P = ((0.00105*Temp**2)+(0.0042*Temp)+1.352)
		
	END FUNCTION P
	
END PROGRAM assign_12