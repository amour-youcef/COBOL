       identification division.
       program-id. helloworld.
       author. youssouf.
       DATA DIVISION.
       WORKING-STORAGE SECTION.

       01  IND PIC S9(04) COMP .
       01  FIN-RECH PIC X VALUE "N".
           88 FIN-RECH-OUI VALUE "0".
           88 FIN-RECH-NON VALUE "N".
       01 EXEMPLE.
           05 TAB OCCURS 1000 INDEXED BY IDX.
           10 ELT PIC  x(6).

       procedure division.

      *     PERFORM VARYING IDX FROM 1 BY 1 UNTIL ELT (IDX)="TROUVE"
      *     OR IDX > 1000
      *      display (IDX)
      *      END-PERFORM.

      *     MOVE  "abklkjdmlklmkklmklkmlk" TO TAB .

           SET IDX TO 1.
           SET IDX TO IND .
           SEARCH TAB AT END SET FIN-RECH-OUI TO TRUE  
           WHEN ELT (IDX) ="TROUVE"
           DISPLAY ELT (IDX)
           END-SEARCH 


           SEARCH ALL TAB 
           AT END SET FIN-RECH-OUI TO TRUE  
           WHEN ELT (IDX) ="TOUVE"
           DISPLAY ELT (IDX )
           END-SEARCH 

       
           stop run. 