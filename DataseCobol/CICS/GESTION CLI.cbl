      *======================================================*
      *       PROGRAMME  CICS EN PSEUDO CONVERSATIONNEL      *
      *======================================================*
      
      *======================================================*
      *   I D E N T I F I C A T I O N     D I V I S I O N    *
      *======================================================*
      *
       IDENTIFICATION DIVISION.
       PROGRAM-ID. GESCLI10.
      *
      *======================================================*
      *   E N V I R O N M E N T       D I V I S I O N        *
      *======================================================*
       ENVIRONMENT DIVISION.
       CONFIGURATION SECTION.
       SOURCE-COMPUTER. IBM-390.
       OBJECT-COMPUTER. IBM-390.

      *======================================================*
      *           D A T A         D I V I S I O N            *
      *======================================================*
       DATA DIVISION.

      *------------------------------------------------------*
       WORKING-STORAGE SECTION.
      *------------------------------------------------------*
      *
       01 FILLER             PIC X(16) VALUE 'DEBUT WORKING'.
       01 MON-PROG           PIC X(08) VALUE 'GESCLI10'.
       01 MON-MAPSET         PIC X(08) VALUE 'MAP0CIA'.
       01 MA-MAP             PIC X(08) VALUE 'MAP0'.
       01 MA-TRX             PIC X(04) VALUE 'T0CA'.
      *
      *------------------------------------------------------*
      *   MESSAGES D'ERREUR                                  *
      *------------------------------------------------------*
       01  TB-MESSAGES.
      *- 1
           05 FILLER               PIC X(65)
              VALUE 'TOUCHE INTERDITE'.
      *- 2
           05 FILLER               PIC X(65)
              VALUE 'FIN TRANSACTION'.
      *- 3
           05 FILLER               PIC X(65)
              VALUE 'CHOIX OBLIGATOIRE'.
      *- 4
           05 FILLER               PIC X(65)
              VALUE 'CHOIX NON NUMERIQUE'.
      *- 5
           05 FILLER               PIC X(65)
              VALUE 'CHOIX DOIT ETRE COMPRIS ENTRE 1 ET 5'.
      *- 6
           05 FILLER               PIC X(65)
              VALUE 'ERREUR GRAVE DANS LE PROGRAMME'.

      *- 7 
           05 MESS-CREATION.
              10 FILLER            PIC X(17)
                 VALUE 'ENREGISTREMENT : '.
              10 CODE-CREATION     PIC X(4).
              10 FILLER            PIC X(5)
                 VALUE ' CREE'.

      *- 8  
           05 MESS-MODIF.
             10 FILLER            PIC X(17)
                VALUE 'ENREGISTREMENT : '.
             10 CODE-MODIF        PIC X(4).
             10 FILLER            PIC X(8)
                VALUE ' MODIFIE'.

      *- 9  
           05 MESS-SUPPRES.
             10 FILLER            PIC X(17)
                VALUE 'ENREGISTREMENT : '.
             10 CODE-SUPPRES      PIC X(4).
             10 FILLER            PIC X(9)
                VALUE ' SUPPRIME'.

                  
       01  TB-MESS-ERREUR REDEFINES TB-MESSAGES.
           05 MESS-ERR OCCURS 9    PIC X(65).

       01  NUM-MES         PIC S9(4) COMP.

      *------------------------------------------------------*
      *   VARIABLES POUR LE DEBRANCHEMENT AUX PROGRAMMES     *
      *          !!!!      A ADAPTER      !!!!               *
      *------------------------------------------------------*
      *
       01 TB-PGM.
           05 FILLER   PIC X(08)  VALUE 'CREACLI'.
           05 FILLER   PIC X(08)  VALUE 'CONSCLI'.
           05 FILLER   PIC X(08)  VALUE 'MODIFCLI'.
           05 FILLER   PIC X(08)  VALUE 'SUPCLI'.

       01 TB-PGM-RED REDEFINES TB-PGM.
           05 PGM OCCURS 4  PIC X(08).

       01 NOM-PROG             PIC X(08).
      *
      *------------------------------------------------------*
      *   DESCRIPTION DETAILLEE DE LA ZONE DE COMMUNICATION  *
      *------------------------------------------------------*
      *
       01  FILLER      PIC X(16) VALUE 'COMMAREA'.
      *
       01  WS-COMMAREA.
           05 WS-COM-PREM         PIC X(01).
              88 PREMIERE-FOIS  VALUE '1'.
           05 WS-CHOIX.
              10 WS-CHOIX-NUM     PIC 9(01).
           05 WS-NUM-CLIENT       PIC X(8).
           05 FILLER              PIC X(118).
           05 WS-NUM-MESS         PIC 9(4) COMP.
           05 WS-PROG_APPEL       PIC 9.
           05 FILLER              PIC X(72) VALUE SPACE.
            
      *
       01  LONG-COM               PIC S9(4) COMP VALUE +200.
      *
       01  C-R                    PIC S9(8) COMP.
      *
      *------------------------------------------------------*
      *   VARIABLES DIVERSES                                 *
      *------------------------------------------------------*
      *
       01  EFZ-X80                PIC S9(4) COMP VALUE +128.
       01  FILLER REDEFINES EFZ-X80.
           05 FILLER              PIC X.
           05 EFZ                 PIC X.
      *
       01  DATE-ABS               PIC S9(18) COMP.
       01  WS-TRTM.
           05 TRANS               PIC X(4).
           05                     PIC X VALUE '/'.
           05 TERM                PIC X(4).
      *
      *------------------------------------------------------*
      *   VARIABLES BOOLEENNES                               *
      *------------------------------------------------------*
      *
       01  FILLER      PIC X(16) VALUE 'BOOLEENS'.
      *
       01  INDIC-ERREUR     PIC X(01) VALUE '0'.
           88 ERREUR     VALUE '1'.
      *
       01  INDIC-ERR-CHOIX        PIC X(01) VALUE '0'.
           88 ERREUR-CHOIX        VALUE '1'.
      *
      *
      *------------------------------------------------------*
      *   DESCRIPTION   DE   LA   MAP                        *
      *------------------------------------------------------*
       01  FILLER      PIC X(16) VALUE 'ECRAN MAP0CIA'.
           COPY MAP0CIA.
      *
      *------------------------------------------------------*
      *   DESCRIPTION   DES  TOUCHES   FONCTIONS             *
      *------------------------------------------------------*
       01  FILLER      PIC X(16) VALUE 'TOUCHE FONCTION'.
           COPY DFHAID.
      *
      *------------------------------------------------------*
      *   DESCRIPTION   DES  ATTRIBUTS                       *
      *------------------------------------------------------*
       01  FILLER      PIC X(16) VALUE 'ATTRIBUTS'.
           COPY DFHBMSCA.
      *
      *======================================================*
      *          L I N K A G E     S E C T I O N             *
      *======================================================*
      *
       LINKAGE SECTION.
       01  DFHCOMMAREA.
           05 FILLER           PIC X(200).
      *
      *======================================================*
      *     P R O C E D U R E     D I V I S I O N            *
      *======================================================*
      *
       PROCEDURE DIVISION.
      *
      *---------------------*
       10000-DEBUT-PROGRAMME.
      *---------------------*
           EXEC CICS HANDLE CONDITION
               ERROR(91000-ERREUR-CICS)
           END-EXEC

           .
      *----------------------*
       21000-PREMIERE-FOIS.
      *----------------------*

           MOVE LOW-VALUE TO MAP0O

           EXEC CICS ASKTIME
                     ABSTIME(DATE-ABS)
           END-EXEC

           EXEC CICS FORMATTIME
                     ABSTIME(DATE-ABS)
                     DATESEP('/')
                     DDMMYYYY(DATEO)
                     TIME(HEUREO)
                     TIMESEP(':')
           END-EXEC

           MOVE EIBTRMID TO TERM
           MOVE EIBTRNID TO TRANS
           MOVE WS-TRTM TO TRTMO
           MOVE -1 TO CHOIXL

           PERFORM 21100-INIT-ECRAN

           PERFORM 21300-ENVOI-PREMIERE-FOIS
           PERFORM 29900-RETOUR-CICS
           .
      *-------------------*
       21100-INIT-ECRAN.
      *-------------------*
           MOVE '.' TO CHOIXO
 
           .
      *-------------------------*
       21300-ENVOI-PREMIERE-FOIS.
      *-------------------------*
           EXEC CICS SEND
                     MAP    (MA-MAP)
                     MAPSET (MON-MAPSET)
                     FROM   (MAP0O)
                     ERASE
                     CURSOR
           END-EXEC
           .
      *-----------------*
       29900-RETOUR-CICS.
      *-----------------*
            EXEC CICS RETURN
                      TRANSID  (MA-TRX)
                      COMMAREA (WS-COMMAREA)
                      LENGTH   (LONG-COM)
            END-EXEC

            .
