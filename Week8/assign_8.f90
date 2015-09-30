!************************************************************************
!Author : Navrit Bal
!Student Number : 12958319
!Creation Date : 05/03/2013
!Assignment Number : 
!Purpose :  
!         
!         
!************************************************************************

PROGRAM assign_8
	IMPLICIT NONE
	
	INTEGER :: choice
	CHARACTER*276 :: key
	LOGICAL :: encrypt
	
	WRITE(*,*) 'Write 1 to encrypt or 2 to decrypt'
	READ (*,*) choice
	WRITE(*,*) 'Write the key'
	READ (*,'(A276),') key
	key = REPEAT((TRIM(key)),276)
	WRITE(*,'(A276)') key
	
	SELECT CASE (choice)
		CASE(1)
			CALL process
		CASE(2)
			CALL process
		CASE DEFAULT
			WRITE(*,*) 'INVALID INPUT'
			WRITE(*,*) 'Enter only 1 or 2 for the first choice'
			WRITE(*,*) 'Try again...'
			STOP
	END SELECT
	
CONTAINS
	SUBROUTINE process
		IMPLICIT NONE
		
		CHARACTER*276 :: txt
		INTEGER :: i
		
		IF (choice == 1) THEN
			!Opens the file 'plaintext.txt' in unit number 99
			OPEN(99,FILE='plaintext.txt')
			READ (99,'(A)') txt
			CLOSE(99)	
			
			DO i = 1,276
				txt(i:i) = ACHAR((IACHAR(txt(i:i))) + (IACHAR(key(i:i))-32))
				IF (IACHAR(txt(i:i)) > 126) THEN
					txt(i:i) = ACHAR((IACHAR(txt(i:i)))-94)
				END IF
			END DO
			
			OPEN(88,FILE='assign_8_encrypt.out')
			WRITE(88,'(A)') txt
			
		ELSEIF (choice == 2) THEN
			!Opens the file 'assign_8_encrypt.out' in unit number 77
			OPEN(77,FILE='assign_8_encrypt.out')
			READ (77,'(A)') txt
			CLOSE(77)
			
			DO i = 1,276
				txt(i:i) = ACHAR((IACHAR(txt(i:i))) - (IACHAR(key(i:i))-32))
				IF (IACHAR(txt(i:i)) < 32) THEN
					txt(i:i) = ACHAR((IACHAR(txt(i:i)))+94)
				END IF
			END DO	
			
			!Opens the file 'assign_8_decrypt.out' in unit number 66
			OPEN(66,FILE='assign_8_decrypt.out')
			WRITE (66,'(A)') txt
			CLOSE(66)			
		END IF
		
	
	END SUBROUTINE process
	
END PROGRAM assign_8