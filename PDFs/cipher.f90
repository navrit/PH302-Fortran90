!----------------------------------------------------------------------------!
!-- Caesar cipher Encryption Program                                       --!
!-- Program Written by Tim Kinnear                                         --!
!-- This program performs a caesar cipher encryption procedure to a string --!
!-- of plain text supplied as either a command line argument, or input     --!
!-- interactively. The key for the cipher is also input either via the     --!
!-- command line or interactively.                                         --!
!----------------------------------------------------------------------------!

PROGRAM caesarcipher

	IMPLICIT NONE

	CHARACTER*512 :: plaintext, ciphertext, temptext
	CHARACTER*26 :: lowercase, uppercase, cipher
	CHARACTER*10 :: numerals
	CHARACTER*1 :: letter
	INTEGER :: plainlen, scanloc
	INTEGER :: key, testval, testio
	INTEGER :: nargs, i
	LOGICAL :: checkcontains

	!define character sets
	lowercase = 'abcdefghijklmnopqrstuvwxyz'
	uppercase = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ'
	numerals = '1234567890' !not actually used in current version, but retained for
	                        !if their use in future is needed

	!get number of cmdline arguments
	nargs = IARGC()

	WRITE(*,*) '+---------------------------------------+'
	WRITE(*,*) "|   Tim's program of encryption magic   |"
	WRITE(*,*) '+---------------------------------------+'

	!if no cmdline args, ask for text and key interactively
	IF (nargs == 0) THEN
		CALL gettext(plaintext,plainlen)
		CALL getkey(key)
	!if one cmdline arg, test to see if integer, if it is, make it key, and ask for text,
	!otherwise, make it text and ask for key
	ELSE IF (nargs == 1) THEN
		CALL GETARG(1,temptext)
		READ(temptext,*,IOSTAT=testio) testval
		IF (testio == 0) THEN
			READ(temptext,*) key
			CALL gettext(plaintext,plainlen)
		ELSE
			plaintext = temptext
			plainlen = LEN(TRIM(plaintext))
			CALL getkey(key)
		END IF
	!if two cmdline args, test first to see if integer, if it is, make it key,
	!and use second for text, otherwise make first arg text, and test to see
	!if second is integer; if so, make second key, otherwise, quit
	ELSE IF (nargs == 2) THEN
		CALL GETARG(1,temptext)
		READ(temptext,*,IOSTAT=testio) testval
		IF (testio == 0) THEN
			READ(temptext,*) key
			CALL GETARG(2,plaintext)
			plainlen = LEN(TRIM(plaintext))
		ELSE
			plaintext = temptext
			plainlen = LEN(TRIM(plaintext))
			CALL GETARG(2,temptext)
			READ(temptext,*,IOSTAT=testio) key
			IF (testio .NE. 0) THEN
				WRITE(*,*) 'Could not determine which command line argument was key'
				STOP
			END IF
		END IF
	ELSE
		!if there are more than two cmdline arguments, tell user that is not valid
		WRITE(*,*) 'Maximum of two (2) arguments.'
		STOP
	END IF

	IF ((key < -26) .OR. (key > 26)) THEN
		WRITE(*,*) 'Key must be in one of the following ranges:'
		WRITE(*,*) 'For encryption, between 1 and 26'
		WRITE(*,*) 'For decryption, between -1 and -26'
		WRITE(*,*) 'To cycle through all possible keys, use 0 (zero)'
		STOP
	END IF

	!if the first 5 letters of the plaintext string are 'FILE=' then
	!assume that this precedes the name of a file that contains the
	!data to be encrypted, open that file and extract contents
	IF (plaintext(1:5) == 'FILE=') THEN
		OPEN(10,FILE=TRIM(plaintext(6:)))
		READ(10,'(A)') plaintext
		CLOSE(10)
		plainlen = LEN(TRIM(plaintext))
	END IF

	WRITE(*,*) '+---------------------------------------+'
	WRITE(*,*) "|      Plaintext and key prepared       |"
	WRITE(*,*) '+---------------------------------------+'

	!Echo choices to screen
	!when key is positive, 'encrypt' the data (shift forwards through cipher cycle)
	!when key is negative, 'decrypt' the data (shift backwards through cipher cycle)
	!when key is zero, go through all possible keys
	WRITE(*,'(A26,A,A)') 'Plaintext is: "', plaintext(1:plainlen), '"'
	WRITE(*,'(A26,I0)',ADVANCE='no') 'Key is:  ', key
	IF (key < 0) THEN
		WRITE(*,*) ' (decrypt)'
	ELSE IF (key > 0) THEN
		WRITE(*,*) ' (encrypt)'
	ELSE
		WRITE(*,*) ' (full slew)'
	END IF

	!change plaintext to uniform case
	CALL encrypt(plaintext,uppercase,lowercase,temptext)
	plaintext = temptext

	!if there are no regular lowercase characters in plaintext, then encryption/decryption
	!is not possible (caesar cipher only cycles through regular alphabet), tell user this
	!and exit
	IF (.NOT. checkcontains(plaintext,lowercase)) THEN
		WRITE(*,*) 'Plaintext does not appear to contain any encryptable characters'
		STOP
	END IF
	
	!re inform user of the text being encrypted shifted to lowercase characters
	WRITE(*,'(A26,A,A)') 'Normalised case text is: "', plaintext(1:plainlen), '"'

	WRITE(*,*) '+---------------------------------------+'
	WRITE(*,*) "|        Performing Encryption          |"
	WRITE(*,*) '+---------------------------------------+'

	IF (key == 0) THEN
		!use all possible keys
		DO key = 1, 26, 1
			!create the cipher alphabet for specified key
			CALL gencipher(lowercase,key,cipher)
			!perform the encryption
			CALL encrypt(plaintext,lowercase,cipher,ciphertext)
			WRITE(*,'(A26,A,A,I0)') 'ciphered text is: "', TRIM(ciphertext), '" for key of ', key
		END DO
	ELSE
		!create the cipher alphabet for specified key
		CALL gencipher(lowercase,key,cipher)
		!perform the encryption
		CALL encrypt(plaintext,lowercase,cipher,ciphertext)
		WRITE(*,'(A26,A,A)') 'ciphered text is: "', TRIM(ciphertext), '"'
	END IF


	WRITE(*,*) '+---------------------------------------+'
	WRITE(*,*) "|         Encryption complete           |"
	WRITE(*,*) '+---------------------------------------+'

END PROGRAM caesarcipher

!Function which returns .TRUE. if 'string' contains any character specified by 'alphabet'
LOGICAL FUNCTION checkcontains(string,alphabet)
	IMPLICIT NONE
	CHARACTER*512, INTENT(IN) :: string
	CHARACTER*26, INTENT(IN) :: alphabet
	INTEGER :: i, scanloc
	!initialise check variable
	checkcontains = .FALSE.
	!go through each letter in the string supplied, and scan alphabet looking for that letter
	!if it returns non-zero, it means that that character from the string is in the alphabet
	!set var to .TRUE. to indicate success
	DO i = 1, LEN(TRIM(string)), 1
		scanloc = SCAN(alphabet,string(i:i))
		IF (scanloc .NE. 0) THEN
			checkcontains = .TRUE.
		END IF
	END DO
END FUNCTION checkcontains

!Main encryption routine (also decrypts, as effectively the same process)
SUBROUTINE encrypt(instring,alphabet,cipher,outstring)
	IMPLICIT NONE
	!original plaintext or encrypted text to be encrypted/decrypted
	CHARACTER*512, INTENT(IN) :: instring
	!text to send back to caller of the subroutine, with encrypted/decrypted version
	!of the original text
	CHARACTER*512, INTENT(OUT) :: outstring
	!alphabet is the original alphabet of characters in order,
	!cipher is the rearranged alphabet, shifted along by `key' places
	CHARACTER*26, INTENT(IN) :: alphabet, cipher
	CHARACTER*1 :: letter
	INTEGER :: i, scanloc

	!initialise the string to return (fill with whitespace)
	outstring = REPEAT(' ',512)

	!go through each letter of original text, find the location of that letter in the alphabet string
	!once found, use the same location in the shifted cipher string to grab the enciphered replacement
	!for the original letter
	DO i = 1, LEN(TRIM(instring)), 1
		letter = instring(i:i)
		scanloc = SCAN(alphabet,letter)
		!if the letter in the plaintext is not in the alphabet, do not attempt to
		!replace it with anything
		IF (scanloc .NE. 0) THEN
			letter = cipher(scanloc:scanloc)
		END IF
		outstring(i:i) = letter
	END DO
END SUBROUTINE

!This subroutine generates the ciphered alphabet to perform encryption using
SUBROUTINE gencipher(alphabet,key,cipher)
	IMPLICIT NONE
	CHARACTER*26, INTENT(IN) :: alphabet !the alphabet which is going to be shifted
	CHARACTER*26, INTENT(OUT) :: cipher !the ciphered alphabet which is to be returned
	INTEGER, INTENT(IN) :: key !the key to apply the cipher
	INTEGER :: i, newi
	!initialise cipher, just in case
	cipher = REPEAT(' ',26)
	!go through each letter of the alphabet supplied
	DO i = 1, 26, 1
		!shift the index of the letter by `key' (ie `1' for `a', with a key of 2 would become `3' for `c')
		newi = i + key
		IF (newi > 26) THEN
			!if the shift takes the new index past the end of the alphabet, subtract 26 to
			!loop back around from the beginning
			newi = newi - 26
		ELSE IF (newi < 1) THEN
			!if the shift takes the new index below the alphabet (for the case of decryption),
			!then add 26 to loop back to top
			newi = newi + 26
		END IF
		!the cipher character at the same index as being examined for the alphabet then becomes
		!the character at the shifted index of the alphabet
		cipher(i:i) = alphabet(newi:newi)
	END DO
END SUBROUTINE

!Subroutine to ask user for, and then read in, the text to be encrypted/decrypted
!no real error checking done here, as text could be practically anything
!could implement check for string being zero length (ie, nothing entered)
!however, this would be caught by various other checks later on (there will be nothing to encrypt!)
SUBROUTINE gettext(string, stringlen)
	IMPLICIT NONE
	CHARACTER*512, INTENT(OUT) :: string
	INTEGER, INTENT(OUT) :: stringlen
	WRITE(*,*) "Please enter plain text below, press return when done&
& (begin with code 'FILE=' to specify a filename to encrypt):"
	READ(*,'(A)') string
	stringlen = LEN(TRIM(string))
END SUBROUTINE

!Subroutine to ask user for, and then read in, the key for encryption/decryption
SUBROUTINE getkey(key)
	IMPLICIT NONE
	INTEGER, INTENT(OUT) :: key
	INTEGER :: io
	LOGICAL :: keyvalid = .FALSE.
	!keep looping until sensible input switched the keyvalid variable to .TRUE.
	DO WHILE (.NOT. keyvalid)
		WRITE(*,*) 'Please enter key number (1-26) below (negative numbers perform&
& decrypt for that key, 0 goes through all possible keys sequentially):'
		!Read in attempt
		READ(*,*,IOSTAT=io) key
		IF (io .NE. 0) THEN
			!if iostat returns error, key was not an integer (or nothing was entered/etc)
			!inform user, then let loop start again
			WRITE(*,*) 'Invalid key entered. (Non-integer)'
		ELSE IF ((key > -26) .AND. (key < 26)) THEN
			!if key is integer and in correct range, accept the value and switch keyvalid
			keyvalid = .TRUE.
		ELSE
			!case for key value being out of required range
			WRITE(*,*) 'Invalid key entered. (Invalid range)'
		END IF
	END DO
END SUBROUTINE
