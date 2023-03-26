       IDENTIFICATION DIVISION.
       PROGRAM-ID. BONJOUR.
       DATA DIVISION.
       WORKING-STORAGE SECTION.

       01 PRIX PIC 9(4) VALUE 0000.
       
       01  VAR1 PIC 9(4) VALUE  50.
       01  VAR2 PIC 9(4) VALUE  20.
       01  VAR3 PIC 9(4) VALUE  70.
       01  VAR4 PIC 9(4).
       01  VAR5 PIC 9(4).   
       PROCEDURE DIVISION. 

           ADD 100 TO VAR1.
           ADD  VAR1  TO  PRIX .   
           DISPLAY VAR1.
           DISPLAY PRIX .

           DISPLAY "***** eme operation".

           ADD VAR1 VAR2 GIVING VAR3.

           DISPLAY VAR3 .   

           DISPLAY " 3eme operation ".
           ADD VAR1 VAR2 var3 GIVING VAR3 VAR4 VAR5.
           
           DISPLAY " var 4  : "  VAR4  " var 5 : " var5 .
           STOP RUN.