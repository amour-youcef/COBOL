       IDENTIFICATION DIVISION.
       PROGRAM-ID. MAIN-PROGRAM.
 
       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01 N           PIC 9(7).
       01 RESULT      PIC 9(8).
 
       PROCEDURE DIVISION.
           MOVE 9 TO N
           INITIALIZE RESULT
           CALL 'SUB-PROGRAM' USING N, RESULT .
          
           DISPLAY 'I am Main Program' .
            
            DISPLAY 'result :  ' , RESULT .
           STOP RUN.