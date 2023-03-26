       IDENTIFICATION DIVISION.
       PROGRAM-ID. BONJOUR.
       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01 VAR1 PIC 9(3).
       01 VAR2 PIC 9(3).
       01 MAX PIC  9(3).
       01 MIN PIC  9(3).

       01 MOYENNE-GENERALE PIC  99v99.
           88 RECU VALUE  10 THRU 20.
           88 COLLE VALUE  0 THRU 9.99.

       
       PROCEDURE DIVISION.
           DISPLAY "BIENVENUE A CETTE FORMATION".
           
           MOVE  0 TO  MOYENNE-GENERALE .

           IF RECU  THEN DISPLAY "test ok "
           ELSE DISPLAY " nul pour test"
           END-IF 

           DISPLAY MOYENNE-GENERALE .

           DISPLAY " 2 eme example de condition"

           MOVE 300 TO VAR1 .
           MOVE 200 TO VAR2 .
              IF VAR1 > VAR2 THEN
              MOVE VAR1 TO MAX
              MOVE VAR2 TO MIN
              ELSE
              MOVE VAR1 to MIN
              MOVE VAR2 to MAX
              END-IF. 

              DISPLAY " var 1 : " VAR1  "  var2 : " var2.
              DISPLAY  " max : " MAX  " min : " MIN. 
           STOP RUN.