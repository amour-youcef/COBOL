       IDENTIFICATION DIVISION. 
       PROGRAM-ID. LESBOUCLE.
       AUTHOR. YOUSSOUF.

       DATA DIVISION .




       PROCEDURE DIVISION.

      *     PERFORM 7 TIMES 
      *     DISPLAY "LE COBOL CETS GENIAL"
      *     END-PERFORM.

           PERFORM 1000-TT-PRINCIPAL-DEB
              THRU 1000-TT-PRINCIPAL-FIN.
           
           PERFORM 9999-FIN-PRINCIPAL-DEB
              THRU 9999-FIN-PRINCIPAL-FIN.

         1000-TT-PRINCIPAL-DEB.

           DISPLAY 'HELLO WORLD'.
           
          1000-TT-PRINCIPAL-FIN.
           EXIT.

          9999-FIN-PRINCIPAL-DEB.

           DISPLAY '*******************************'.
           DISPLAY '*     FIN NORMALE DU PROGRAMME HELLO WORLD'.
           DISPLAY  '******************************'.   

          9999-FIN-PRINCIPAL-FIN.   
           
           STOP RUN.