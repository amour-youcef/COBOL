       IDENTIFICATION DIVISION. 
       PROGRAM-ID. LESBOUCLE.
       AUTHOR. YOUSSOUF.

       DATA DIVISION .
       
       WORKING-STORAGE SECTION.

       01  ws-CPT   PIC   9  VALUE 0.



       PROCEDURE DIVISION.

      *     PERFORM 7 TIMES 
      *     DISPLAY "LE COBOL CETS GENIAL"
      *     END-PERFORM.

           PERFORM 8000-AFFICHAGE-DEB
              THRU 8000-AFFICHAGE-FIN.
              UNTIL ws-CPT > 3.

              STOP RUN.

           8000-AFFICHAGE-DEB.
           DISPLAY "NOUS APPRENONS A UTILISER LES BOUCLE".
           
   