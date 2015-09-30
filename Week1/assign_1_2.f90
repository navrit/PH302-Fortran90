!************************************************************************
!Author:Navrit Bal
!Student Number:12958319
!Creation Date:17/01/2013
!Assignment Number:1_2
!Purpose:To Find the discriminant of a quadratic equation of the form ax^2 + bx + c
!************************************************************************

PROGRAM assign_1_2
  
  IMPLICIT NONE
  
  !a,b,c are variables - initialised here
  !discrim will store the answer

  REAL :: a,b,c,discrim,x_plus,x_neg
  
  a = 2.0 !!Initial conditions
  b = 3.0
  c = 2.0

  discrim = b**2 - 4*a*c !To calculate the discriminant
  x_plus = (-b + SQRT(discrim))/(2*a) !Calculates the positive x solution to the quadratic equation
  x_neg = (-b - SQRT(discrim))/(2*a) !Calculates the negative x solution to the quadratic equation

  WRITE (*,*) "Here is the positive x value dude : ",x_plus !Prints positive x solution with a friendly message
  WRITE (*,*) "Here is the negative x value dude : ",x_neg !Prints negative x solution with a friendly message

END PROGRAM 
