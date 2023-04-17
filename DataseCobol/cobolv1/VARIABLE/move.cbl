       IDENTIFICATION DIVISION.
       PROGRAM-ID. BONJOUR.
       DATA DIVISION.
       WORKING-STORAGE SECTION.

       01 PRIX PIC 9(4) VALUE 0000.
       01 NOM PIC X(5) VALUE "XXXXX".

       01 var1 PIC 9(4).
       01 var2 PIC 9(4).

       01  var3 PIC x(4). 
       01  var4 PIC x(4).

       01  var5 PIC 9999.99.
       01  var6 PIC 9999.99.


       PROCEDURE DIVISION.

           DISPLAY "BIENVENUE A CETTE FORMATION".

           MOVE 1200 TO PRIX          
           DISPLAY PRIX .
           MOVE 12345 TO PRIX.
           DISPLAY PRIX .
           
           MOVE "ABCDEF" TO NOM.

           DISPLAY NOM .  

           DISPLAY  "test numrique".
           MOVE  12 TO  var1 .
           MOVE  var1  TO  var2 .
           DISPLAY  " var1 : "var1  "  var2 : " var2.
           DISPLAY  "test alpha numeriq".
           MOVE  "aaa" TO  var3 .
           MOVE  var3 TO  var4 .

           DISPLAY  " var 3 " var3  " var4 " var4.
           DISPLAY  "decimel".
           MOVE 12.33 TO  var5 .
           MOVE  var5 TO  var6 .

           DISPLAY  " var5 ", var5 " var6 " var6. 
           STOP RUN.