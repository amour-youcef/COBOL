       IDENTIFICATION DIVISION.
       PROGRAM-ID.  CONDITION.
       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01 WS-A PIC 9 VALUE 2.
       PROCEDURE DIVISION.
       A-PARA.
           DISPLAY "IN A-PARA"
           GO TO B-PARA.
       B-PARA.
           DISPLAY "IN B-PARA ".
           GO TO C-PARA D-PARA DEPENDING ON WS-A.
       C-PARA.
           DISPLAY "IN C-PARA ".
       D-PARA.
           DISPLAY "IN D-PARA ".
            STOP RUN.