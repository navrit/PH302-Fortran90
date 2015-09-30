!************************************************************************
!Author: Navrit Bal
!Student Number:12958319
!Creation Date:22/01/2013
!Assignment Number:2_2
!Purpose: To calculate solutions to a quadratic equations, print the results to the screen and to print other results to a file called assign_2_2.out
!************************************************************************

PROGRAM assign_2_2
  
  IMPLICIT NONE
  
  !a,b,c are variables and are initialised here
  !discrim will store the answer
  REAL :: a,b,c,discrim,x_plus,x_neg
  
  !Initial conditions
  a = 0 
  b = 0
  c = 0

  !Opens assign_2_2.out in unit number 9
  OPEN(99,FILE='assign_2_2.out') 9

  !Gets user input in a reasonably friendly manner
  WRITE(*,*) 'a = what??'
  READ(*,*) a
  WRITE(*,*) 'b = what??'
  READ(*,*) b
  WRITE(*,*) 'c = what??'
  READ(*,*) c

  discrim = b**2 - 4*a*c !Calculate the discriminant

  !Calculates the positive and negative x solution to the quadratic equation
  x_plus = (-b + SQRT(discrim))/(2*a) 
  x_neg = (-b - SQRT(discrim))/(2*a)

  !Prints various useful pieces of information 
  WRITE (99,*) "Here are the coefficients of the quadratic equation"
  WRITE (99,*) "a = ",a
  WRITE (99,*) "b = ",b
  WRITE (99,*) "c = ",c
  WRITE (99,*) "Here is the postive x value dude : ",x_plus !
  WRITE (99,*) "Here is the negative x value dude : ",x_neg !

  !Forcefully closes the program followed by halting execution
  CLOSE(99)

END PROGRAM 
