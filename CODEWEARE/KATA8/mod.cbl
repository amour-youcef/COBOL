        IDENTIFICATION DIVISION.
        PROGRAM-ID. MAIN-PROGRAM.
 
        DATA DIVISION.
        WORKING-STORAGE SECTION.
           

           01 A           PIC S9(8).
           01 B           PIC S9(8).
           01 C           PIC S9(8).
           01 D           PIC S9(8).
           01 result      PIC S9(8).
 
       PROCEDURE DIVISION.     
            
            move 55 to A.
            move 44 to B.

           COMPUTE C = FUNCTION MAX(A, B)
           COMPUTE D = FUNCTION MIN(A, B)

           IF D = 0 THEN
               COMPUTE RESULT = -1
           ELSE
               COMPUTE RESULT = FUNCTION REM(C, D)
           END-IF.
           display " RESULT : " RESULT

           if  result = 11 then  display "ok";
           STOP RUN.