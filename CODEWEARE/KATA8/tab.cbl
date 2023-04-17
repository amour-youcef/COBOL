       IDENTIFICATION DIVISION.
       PROGRAM-ID. MAIN-PROGRAM.
 
       DATA DIVISION.
       WORKING-STORAGE SECTION.

       01 MONTH-TABLE.
           02 MONTH-NAME PIC  X(9) OCCURS 12 TIMES .
                      
 
       PROCEDURE DIVISION.         
           MOVE  1 to MONTH-NAME (1).

           DISPLAY MONTH-NAME (1) .
           STOP RUN.