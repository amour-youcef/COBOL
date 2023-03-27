       identification division.
       program-id. helloworld.
       author. youssouf.
       DATA DIVISION.
       WORKING-STORAGE SECTION.
       
       01  W-GROUPE  PIC X(7) VALUE "GROUPE".
       01  W-SII     PIC X(3) VALUE "SII".
       01  W-LIBELLE PIC X(30).

       procedure division.
           DISPLAY  " exemple 01".
           STRING  "TEST CONcatenation dapres un exemple" W-GROUPE 
           (1:6)
           "SII" DELIMITED BY SIZE INTO W-LIBELLE.
           DISPLAY W-LIBELLE .
           DISPLAY  " exemple 02".
           DISPLAY " test concatination dapres un exemple:" W-GROUPE 
           W-SII 
           DISPLAY  "exemple 03".

           DISPLAY "test concatination dapres un exemple :"
       
           stop run. 