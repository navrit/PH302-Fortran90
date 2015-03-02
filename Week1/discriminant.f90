!************************************************************************
!Author:Navrit Bal
!Student Number:12958319
!Creation Date:17/01/2013
!Assignment Number:1_2
!Purpose:To Find the discriminant of a quadratic equation of the form ax^2 + bx + c
!************************************************************************

PROGRAM discriminant
  
  IMPLICIT NONE
  
  !a,b,c are variables - initialised here
  !ans will store the answer

  REAL :: a,b,c,ans
  
  a = 2.0 !!Initial conditions
  b = 3.0
  c = -2.0

  ans = b**2 - 4*a*c !To calculate the discriminant

  WRITE (*,*) "Here is the discriminant dude : ",ans

END PROGRAM
