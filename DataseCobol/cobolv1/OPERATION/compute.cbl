       IDENTIFICATION DIVISION.
       PROGRAM-ID. BONJOUR.
       DATA DIVISION.
       WORKING-STORAGE SECTION.

       01 VAR1 PIC 9(3) VALUE 500.
       01 VAR2 PIC 9(3) VALUE 600.
       01 VAR22 PIC 9(3).

       01 VAR3 PIC 9(3) VALUE 700.

       PROCEDURE DIVISION. 
              
           COMPUTE VAR22 = VAR1 + 9**2.
           COMPUTE VAR22 ROUNDED = 15.325 + 40.555

           DISPLAY VAR22 .
           COMPUTE VAR1 = VAR2 + VAR3 ON SIZE ERROR MOVE 0 TO VAR1.
            COMPUTE VAR1 = VAR2 + VAR3 .
           DISPLAY  VAR1 .   
           STOP  RUN .