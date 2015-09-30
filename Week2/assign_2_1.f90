!************************************************************************
!Author: Navrit Bal
!Student Number:12958319
!Creation Date:18/01/2013
!Assignment Number:2_1
!Purpose: To Find the discriminant of a quadratic equation of the form ax^2 + bx + c with user interaction
!************************************************************************

PROGRAM assign_2_1
  
  IMPLICIT NONE
  
  !a,b,c are variables - initialised here
  !discrim will store the answer
  REAL :: a,b,c,discrim,x_plus,x_neg
  
  a = 0 !!Initial conditions
  b = 0
  c = 0

  WRITE(*,*) 'a = what??'
  READ(*,*) a
  WRITE(*,*) 'b = what??'
  READ(*,*) b
  WRITE(*,*) 'c = what??'
  READ(*,*) c

  discrim = b**2 - 4*a*c !To calculate the discriminant

  x_plus = (-b + SQRT(discrim))/(2*a) !Calculates the positive x solution to the quadratic equation
  x_neg = (-b - SQRT(discrim))/(2*a) !Calculates the negative x solution to the quadratic equation

  WRITE (*,*) "Here is the positive x value dude : ",x_plus !Prints positive x solution with a friendly message
  WRITE (*,*) "Here is the negative x value dude : ",x_neg !Prints negative x solution with a friendly message

END PROGRAM 
