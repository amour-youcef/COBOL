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
              
              SUBTRACT 20 FROM VAR1.
              DISPLAY  VAR1 .

              SUBTRACT 20 FROM VAR1 GIVING VAR2.

              DISPLAY " var 2 : " VAR2 .

              SUBTRACT 10 20 15 FROM VAR3 GIVING VAR4.

              DISPLAY " var 3 : " VAR3  " var 4 : " var4 .

              SUBTRACT 1 2 5 FROM VAR1 VAR2 VAR3.

              DISPLAY " var 1 " VAR1  " var2 " var2 " var3 " var3.
           STOP  RUN .