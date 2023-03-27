       IDENTIFICATION DIVISION.
       PROGRAM-ID. TABLE-INDICE.
       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01 TABLE-TEST.
          05 VAR1 OCCURS 3 TIMES.
              10 VAR2 PIC 9(3).
              10 VAR3 OCCURS 2 TIMES.
              15 VAR4 PIC A(3).
       PROCEDURE DIVISION.
            MOVE '12ABCDEF34GHIJKL56MNOPQR' TO TABLE-TEST.
            DISPLAY "TABLE-TEST : "  TABLE-TEST.
            DISPLAY "VAR1(1) :" VAR1(1) "var1(2) " var1(2) "***" var1(3).
            DISPLAY "VAR3(1,1) : "   VAR3(1,1).
            DISPLAY "VAR3(1,2) : "   VAR3(1,2).
            DISPLAY "VAR3(2,1) : "   VAR3(2,1).
            DISPLAY "VAR1(2) : "     VAR1(2).
            DISPLAY VAR2 (1) .
           STOP  RUN .