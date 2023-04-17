       IDENTIFICATION DIVISION.
       PROGRAM-ID. HELLO.
       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01 TABLE-TEST.
            05 VAR1 OCCURS 3 TIMES INDEXED BY I.
               10 VAR2 PIC A(2).
               10 VAR3 OCCURS 2 TIMES INDEXED BY J.
                  15 VAR4 PIC X(3).
       PROCEDURE DIVISION.
            MOVE '12ABCDEF34GHIJKL56MNOPQR' TO TABLE-TEST.
            SET I J TO 1.
            DISPLAY VAR3(I,J).
            SET I J UP BY 1.
            DISPLAY VAR3(I,J).

            STOP RUN .