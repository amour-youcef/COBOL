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

       01 MAP1I.
           05 FILLER PIC X(12).
           05 TRTML PIC S9(04) COMP.
           05 TRTMF PIC X.
           05 TRTMI PIC X(9).
           05 DATEL PIC S9(04) COMP.
           05 HEUREL PIC S9(04) COMP  .
           05 HEUREF PIC X.
           05 HEUREI PIC X(08) COMP.
           05 CHOIXL PIC S9(04) COMP .
           05 CHOIXF PIC X.
           05 CHOIXI PIC X(01).
           05 MESSAGEL PIC X S9(04) COMP.
           05 MESSAGEF PIC X.
           05 MESSAGEI PIC  X(65). 
       01 MAP1O REDEFINES MAP1I.
           05 FILLER PIC X(12).préfixe TIOA
           05 FILLER PIC XX.
           05 NOMA PIC X.
           05 NOMO PIC X(20).
           05 FILLER PIC XX.
           05 NUMEROA PIC X.
           05 NUMEROO PIC X(05).
           05 FILLER PIC XX.
           05 SOLDEA PIC X.
           05 SOLDEO PIC ZZZ9,99.
           05 FILLER PIC XX.
           05 MESSAGEA PIC X.
           05 MESSAGEO PIC X(79).
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