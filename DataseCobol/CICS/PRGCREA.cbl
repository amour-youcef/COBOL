      *======================================================*
      *   SQUELETTE DE PROG CICS EN PSEUDO CONVERSATIONNEL   *
      *======================================================*
      *
      *
      *======================================================*
      *   I D E N T I F I C A T I O N     D I V I S I O N    *
      *======================================================*
      *
       IDENTIFICATION DIVISION.
       PROGRAM-ID. PRGCREA.
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
      *
       01 MON-PROG           PIC X(08) VALUE 'PRGCREA'.
       01 MON-MAPSET         PIC X(08) VALUE 'CREACLI'.
       01 MA-MAP             PIC X(08) VALUE 'MAP1'.
       01 MA-TRX             PIC X(04) VALUE 'T1CA'.
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
              VALUE 'LES CHAMPS AVEC * SONT  OBLIGATOIRES'.
      *- 4
           05 FILLER               PIC X(65)
           VALUE 'LE NUMéRO DU CLIENT NUMERIQUE ENTRE 10000000 ET 50000000'
      *- 5
           05 FILLER               PIC X(65)
              VALUE 'CODE POSTAL INVALIDE'.
      *- 6
           05 FILLER               PIC X(65)
              VALUE 'UN NUMéRO DE TELEPHONE DOIT ETRE NUMERIQUE'.
      *- 7
           05 FILLER               PIC X(65)
              VALUE 'UN NUMERO DE PORTABLE COMMENCE PAR 06/07'.
      *- 8
           05 FILLER               PIC X(65)
              VALUE 'EMAIL INCONNU '.
      *- 10
           05 FILLER               PIC X(65)
              VALUE 'ERREUR GRAVE DANS LE PROGRAMME'.

      *- 11
           05 FILLER               PIC X(65)
              VALUE 'CLIENT EXISTE DEJA'.
      *-
       01  TB-MESS-ERREUR REDEFINES TB-MESSAGES.
           05 MESS-ERR OCCURS 10   PIC X(65).

       01  NUM-MES         PIC S9(4) COMP.

      *------------------------------------------------------*
      *   VARIABLES POUR LE DEBRANCHEMENT AUX PROGRAMMES     *
      *          !!!!      A ADAPTER      !!!!               *
      *------------------------------------------------------*
      *
       01 TB-PGM.
           05 FILLER   PIC X(08)  VALUE 'GESCLI10'.
           05 FILLER   PIC X(08)  VALUE 'PRGCREA'.
           05 FILLER   PIC X(08)  VALUE 'PRGCONS'.
           05 FILLER   PIC X(08)  VALUE 'PRGMODIF'.
           05 FILLER   PIC X(08)  VALUE 'PRGSUP'.

       01 TB-PGM-RED REDEFINES TB-PGM.
           05 PGM OCCURS 5  PIC X(08).

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
           05 FILLER              PIC X(02).
           05 WS-NUM-CLI      PIC 9(4).
           05 WS-NOM-CLI         PIC X(20).
           05 WS-PNOM             PIC X(20).
           05 WS-ADR1-CLI        PIC X(20).
           05 WS-COP-CLI.
              10 WS-DEP-CLI      PIC X(2).
              10 WS-SCOP-CLI     PIC X(3).
           05 WS-VIL-CLI         PIC X(25).
           05 WS-TELF-CLI.
              10 WS-TELF1         PIC X(2).
              10 WS-TELF2         PIC X(8).
           05 WS-MAIL-CLI         PIC X(60).
           05 WS-NUM-MESS         PIC 9(4) COMP.
           05 WS-PROG-APPEL       PIC 9.
           05 FILLER              PIC X(34) VALUE SPACE.
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

       01  WS-TRERR.
           05 FILLER              PIC X(10)
              VALUE       'TRANSACTION IMPREVUE'.
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
       01  INDIC-ERR-NUM          PIC X(01) VALUE '0'.
           88 ERREUR-NUM          VALUE '1'.
      *
       01  INDIC-ERR-CODP         PIC X(01) VALUE '0'.
           88 ERREUR-CODP         VALUE '1'.
      *
       01  INDIC-ERR-MAIL         PIC X(01) VALUE '0'.
           88 ERREUR-TELF         VALUE '1'.
      *
       01  INDIC-ERR-TELM         PIC X(01) VALUE '0'.
           88 ERREUR-TELM         VALUE '1'.
      *
       01  INDIC-ERR-CHOBL        PIC X(01) VALUE '0'.
           88 ERREUR-CHOBL        VALUE '1'.

      *
      *------------------------------------------------------*
      *   DESCRIPTION   DE   LA   MAP                        *
      *------------------------------------------------------*
       01  FILLER      PIC X(16) VALUE 'ECRAN MAP1CIA'.
           COPY MAP1CIA.
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
      *------------------------------------------------------*
      *   DESCRIPTION   DU  FICHIER FCLI : CLIENTS           *
      *------------------------------------------------------*
       01  FILLER      PIC X(16) VALUE 'FICHIER CLIENTS'.
           COPY FCLIENTS.
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
      *---------------------*
       20000-TRAIT-PROGRAMME.
      *---------------------*
           IF EIBCALEN = 0
              EXEC CICS SEND FROM (WS-TRERR)
                        ERASE
              END-EXEC
              EXEC CICS RETURN
              END-EXEC
           ELSE
              MOVE DFHCOMMAREA  TO WS-COMMAREA
              IF PREMIERE-FOIS
                 PERFORM 21000-PREMIERE-FOIS
              ELSE
                 PERFORM 22000-AUTRES-FOIS
              END-IF
           END-IF

           GOBACK
           .
      *----------------------*
       21000-PREMIERE-FOIS.
      *----------------------*
           MOVE '0' TO WS-COM-PREM

           MOVE LOW-VALUE TO MAP1O

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

           MOVE -1 TO NUMCLIL

           PERFORM 21100-INIT-ECRAN
           PERFORM 29800-INIT-ATTRIBUT
           PERFORM 21300-ENVOI-PREMIERE-FOIS
           PERFORM 29900-RETOUR-CICS
           .
      *-------------------*
       21100-INIT-ECRAN.
      *-------------------*
           MOVE EIBTRMID TO TERM
           MOVE EIBTRNID TO TRANS
           MOVE WS-TRTM TO TRTMO
           .
      *-------------------*
       29800-INIT-ATTRIBUT.
      *-------------------*
           MOVE '&' TO NUMCLIA
           MOVE '&' TO NOMCLIA PNMCLIA
           MOVE '&' TO ADSCLIA CODPOSA
           MOVE '&' TO VILLEA
           MOVE '&' TO EMAILCLA
           .
      *-------------------------*
       21300-ENVOI-PREMIERE-FOIS.
      *-------------------------*
           EXEC CICS SEND
                     MAP    (MA-MAP)
                     MAPSET (MON-MAPSET)
                     FROM   (MAP1O)
                     ERASE
                     CURSOR
           END-EXEC
           .
      *-----------------*
       22000-AUTRES-FOIS.
      *-----------------*

           MOVE LOW-VALUE TO MAP1I

           EXEC CICS RECEIVE
                     MAP    (MA-MAP)
                     MAPSET (MON-MAPSET)
                     INTO   (MAP1I)
                     RESP   (C-R)
           END-EXEC

           IF C-R NOT = DFHRESP(NORMAL) AND DFHRESP(MAPFAIL)
              PERFORM 91000-ERREUR-CICS
           END-IF

           IF EIBAID = DFHENTER
              PERFORM 22100-TRAITEMENT-NORMAL
           END-IF

           IF EIBAID = DFHPF3
              PERFORM 22800-RET-MENU
           END-IF

           IF EIBAID = DFHPF12
              PERFORM 22900-FIN-TRANSACTION
           END-IF

           IF EIBAID NOT = DFHPF12 AND DFHPF3 AND DFHENTER AND
              PERFORM 22200-ERREUR-TOUCHE
           END-IF

           PERFORM 22300-ENVOI-AUTRES-FOIS
           PERFORM 29900-RETOUR-CICS

           .
      *------------------------*
       22100-TRAITEMENT-NORMAL.
      *------------------------*

           PERFORM 22110-INIT-COMMAREA
           PERFORM 22120-CONTROLES
           IF NOT ERREUR
              PERFORM 23000-CREATION
      *
      *       CREATION
      
           END-IF

           .
      *-------------------*
       22110-INIT-COMMAREA.
      *-------------------*
           PERFORM 29800-INIT-ATTRIBUT
      *
      * INITIALISATION DES ZONES UTILISEES POUR LES CONTROLES
      *
           IF (NUMCLIL > ZERO) OR (NUMCLIF = EFZ )
              MOVE NUMCLII TO WS-NUM-CLI
      *     ELSE
      *         MOVE '1' TO 
      *        MOVE WS-NUM-CLI TO NUMCLIO
           END-IF

           IF (NOMCLIL > ZERO) OR (NOMCLIF = EFZ)
              MOVE NOMCLII TO WS-NOM-CLI
           ELSE
              MOVE WS-NOM-CLI TO NOMCLIO
           END-IF

           IF (PNMCLIL > ZERO) OR (PNMCLIF = EFZ )
              MOVE PNMCLII TO WS-PNOM
           ELSE
              MOVE WS-PNOM TO PNMCLIO
           END-IF

           IF (ADSCLIL > ZERO) OR (ADSCLIF = EFZ)
              MOVE ADSCLII TO WS-ADR-CLI
           ELSE
              MOVE WS-ADR-CLI TO ADSCLIO
           END-IF

           IF (CODPOSL > ZERO) OR (CODPOSF = EFZ )
              MOVE CODPOSI TO WS-COP-CLI
           ELSE
              MOVE WS-COP-CLI TO CODPOSO
           END-IF

           IF (VILLEL > ZERO) OR (VILLEF = EFZ)
              MOVE VILLEI TO WS-VIL-CLI
           ELSE
              MOVE WS-VIL-CLI TO VILLEO
           END-IF


           IF (EMAILCLIL > ZERO) OR (EMAILCLIF = EFZ)
              MOVE EMAILCLII TO WS-EMAIL-CLI
           ELSE
              MOVE WS-EMAIL-CLI TO EMAILCLIO
           END-IF
           .
      *----------------*
       22120-CONTROLES.
      *----------------*
           MOVE '0' TO INDIC-ERR-NUM
           MOVE '0' TO INDIC-ERR-CODP
           MOVE '0' TO INDIC-ERR-EMAIL



      *-------------------------------------------------------
      *     TRAITEMENT DES CHAMPS OBLIGATOIRES
      *-------------------------------------------------------
           
           IF WS-NUM-CLI = SPACE OR LOW-VALUE 
              MOVE '1' TO INDIC-ERR-NUM
              MOVE 3 TO NUM-MES
           ELSE
              IF WS-NUM-CLI NUMERIC
                 
                    MOVE 8 TO NUM-MES
                 
              
           END-IF

      *
           MOVE '0' TO INDIC-ERR-NUM
           MOVE '0' TO INDIC-ERR-CODP
           MOVE '0' TO INDIC-ERR-EMAIL
           IF INDIC-ERR-NUM OR INDIC-ERR-CODP
              MOVE '1' TO INDIC-ERREUR
              IF INDIC-ERR-NUM
                 MOVE -1  TO NUMCLIL
                 MOVE 'Q' TO NUMCLIA
              END-IF
              IF INDIC-ERR-CODP
                 MOVE -1  TO CODPOSL
                 MOVE 'Q' TO CODPOSA
              END-IF
           END-IF
           IF INDIC-ERR-EMAIL 
              MOVE '1' TO INDIC-ERREUR
                 MOVE -1 TO EMAILCLIL
                 MOVE 'Q' TO EMAILCLIA
              END-IF
           END-IF
           .
      
      *-----------------*
       22130-BRANCHEMENT.
      *-----------------*
           MOVE PGM(WS-CHOIX-NUM) TO NOM-PROG
           MOVE '1'               TO WS-COM-PREM

           EXEC CICS XCTL
               PROGRAM  (NOM-PROG)
               COMMAREA (WS-COMMAREA)
               LENGTH   (LONG-COM)
           END-EXEC
           .
      *--------------------*
       22190-CREAENRG.
      *--------------------*
           MOVE WS-NUM-CLI TO E-NUM-CLI
           MOVE WS-NOM-CLI TO E-NOM-CLI
           MOVE WS-PNOM TO E-PNM-CLI
           MOVE WS-ADR-CLI E-ADR-CLI
           MOVE WS-COP TO E-CODEP-CLI
           MOVE WS-VIL TO E-VILLE-CLI
           MOVE WS-EMAIL-CLI TO E-EMAIL-CLI
      *
           EXEC CICS WRITE FILE(FCLIENT)
                     RIDFLD(E-NUMERO)
                     FROM(E-CLIENT)
                     LENGTH(400)
                     RESP(WS-RESPCR)
           END-EXEC
      *------------------------------------------------
           IF WS-RESPCR = DFHRESP(NORMAL)
           INITIALIZE WS-COMMAREA
              MOVE '1' TO WS-COM-PREM
              MOVE E-NUMERO TO WS-NUM-CLI
              MOVE 10 TO WS-NUM-MESS
              MOVE 0 TO WS-CHOIX-NUM
              PERFORM 22130-BRANCHEMENT
           ELSE
              IF WS-RESPCR = DFHRESP(DUPREC)
                 MOVE '1' TO WS-COM-PREM
                 MOVE 11 TO NUM-MESS
                 MOVE 1 TO WS-CHOIX-NUM
      *          PERFORM 22130-BRANCHEMENT
              ELSE
                  PERFORM  91000-ERREUR-CICS.
              END-IF
           END-IF
      *--------------------*
        22200-ERREUR-TOUCHE.
      *--------------------*
           MOVE 1 TO  NUM-MES
           MOVE '1' TO  INDIC-ERREUR
           MOVE -1 TO  CHOIXL
           IF EIBAID = DFHCLEAR
               PERFORM 22110-INIT-COMMAREA
               EXEC CICS ASKTIME
                         ABSTIME(DATE-ABS)
               END-EXEC
               EXEC CICS FORMATTIME
                         ABSTIME(DATE-ABS)
                         DDMMYY(DATEO)
                         DATESEP('/')
               END-EXEC
      *        SI EFFACEMENT ECRAN, RESTITUTION ECRAN COMPLET
      *         --> SOLLICITATION ENVOI DE PREMIERE-FOIS
               MOVE '1'     TO WS-COM-PREM
           END-IF
           .
      *-------------------------*
       22300-ENVOI-AUTRES-FOIS.
      *-------------------------*
           IF ERREUR
              MOVE MESS-ERR(NUM-MES) TO MESSAGEO
           ELSE
              MOVE SPACE              TO MESSAGEO
           END-IF

           EXEC CICS SEND
                     MAP    (MA-MAP)
                     MAPSET (MON-MAPSET)
                     FROM   (MAP0O)
                     DATAONLY
                     CURSOR
           END-EXEC

           .

      *----------------------*
       22800-RET-MENU.
      *----------------------*

      *----------------------*
       22900-FIN-TRANSACTION.
      *----------------------*
           MOVE 2        TO NUM-MES
           MOVE '1'      TO INDIC-ERREUR

           PERFORM 22300-ENVOI-AUTRES-FOIS.

           EXEC CICS RETURN
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
      *-----------------*
       91000-ERREUR-CICS.
      *-----------------*
           MOVE '1'             TO INDIC-ERREUR
           MOVE  9              TO NUM-MES
           PERFORM 22300-ENVOI-AUTRES-FOIS
           EXEC CICS RETURN
           END-EXEC
           .

      *-----------------*
       23000-CREATION.
      *-----------------*

