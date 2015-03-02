!************************************************************************
!Author: Navrit Bal
!Student Number: 12958319
!Creation Date: 21/02/2013
!Assignment Number: 7_2
!Purpose:  Provide functions for another program which takes a parameter 
!			and performs various calculations with it and returns them
!************************************************************************

REAL FUNCTION circ_area(k, pi)
	IMPLICIT NONE

	! Takes 'r' from the main program as 'k' - same for the other functions
	REAL, INTENT(IN) :: k, pi
	! Calculates the area of a circle based on the radius given
	circ_area = ( pi * (k**2) )
	
END FUNCTION circ_area


REAL FUNCTION circ_perim(k, pi)
	IMPLICIT NONE

	REAL, INTENT(IN) :: k, pi
	! Calculates the perimeter of a circle based on the radius given
	circ_perim = (2 * pi * k)
	
END FUNCTION circ_perim


REAL FUNCTION sphere_area(k, pi)
	IMPLICIT NONE

	REAL, INTENT(IN) :: k, pi
	! Calculates the surface area of a sphere based on the radius given
	sphere_area = (4 * pi * (k**2) )
	
END FUNCTION sphere_area


REAL FUNCTION sphere_volume(k, pi)
	IMPLICIT NONE

	REAL, INTENT(IN) :: k, pi
	! Calculates the volume of a sphere based on the radius given
	sphere_volume = ((4.0/3.0) * pi * (k**3) )
	
END FUNCTION sphere_volume