       IDENTIFICATION DIVISION.
       PROGRAM-ID. CALCUL.
       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01 GP-1 .
           02 A     PIC   9(2) VALUE 50.
           02 B     PIC   9(2) VALUE 60.
           02 C     PIC   9(2) .
           02 D     PIC   9(2).
       01 WS-DESCRIPTION.
         05 WS-DATE1 VALUE '124'.
           10 WS-YEAR PIC X(4).
                    10 WS-MONTH PIC X(2).
                  10 WS-DATE PIC X(2).
                 05 WS-DATE2 REDEFINES WS-DATE1 PIC 9(8).
       PROCEDURE DIVISION.
           DISPLAY "WS-DATE1 : "WS-DATE1.
           DISPLAY "WS-DATE2 : "WS-DATE2.

           ADD A TO C .

           display C 
           display C  

           STOP RUN.          