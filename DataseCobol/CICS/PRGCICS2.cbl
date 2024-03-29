      IDENTIFICATION DIVISION.
      PROGRAM-ID. PRGCICS1.

      DATA DIVISION.
      FILE SECTION.

      WORKING-STORAGE SECTION.
      01 WS-INVIT        PIC X(28).
      01 WS-INVIT-LENGTH PIC S9(4) COMP.

      01 WS-PRENOM  PIC X(15).
      01 WS-PRENOM-LENGTH  PIC S9(4) COMP.
      01 WS-AFFICHAGE.
           05 FILLER       PIC X(16) VALUE 'VOTRE PRENOM : '.
           05 WS-PNOM      PIC X(15).
      01 WS-LENGTH-AFF   PIC S9(4) COMP.

       PROCEDURE DIVISION.
       0000-MAIN-PARA.
      * PREMIER AFFICHAGE
           MOVE 'MERCI DE SAISIR VOTRE PRENOM' TO WS-INVIT
           MOVE +28 TO WS-INVIT-LENGTH

           EXEC CICS SEND TEXT
           FROM (WS-INVIT)
           LENGHT(WS-INVIT-LENGTH)
           END-EXEC
      * SAISIE
           MOVE +15 TO WS-PRENOM-LENGTH
           EXEC CICS RECEIVE
           INTO(WS-PRENOM)
           LENGTH(WS-PRENOM-LENGTH)
           END-EXEC

           AFFICHAGE DU PRENOM SAISIE
           MOVE WS-PRENOM TO WS-PNOM
           MOVE +31 TO WS-LENGTH-AFF
           EXEC CICS SEND
              FROM(WS-AFFICHAGE)
           LENGTH(WS-LENGTH-AFF)
           END-EXEC

      *FIN DU PROGRAMME
           EXEC CICS
           RETURN
              END-EXEC.