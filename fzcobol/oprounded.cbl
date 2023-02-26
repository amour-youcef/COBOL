       IDENTIFICATION DIVISION.
       PROGRAM-ID. CALCUL.
       DATA DIVISION.
       WORKING-STORAGE SECTION.
     
       01 W1         PIC   9(2) VALUE 72.
       01 W2         PIC   9(2) VALUE 45.
       01 RESULTAT   PIC   9(3) VALUE 0.
          

       PROCEDURE DIVISION.
           
           ADD W1 TO W2 GIVING RESULTAT 
           ON SIZE ERROR 
           DISPLAY "ON SIZE ERROR - ERRUR DE TAILLE".

           DISPLAY RESULTAT.

              GOBACK .
           STOP RUN.          