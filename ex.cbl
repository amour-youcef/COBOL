       IDENTIFICATION DIVISION.
       PROGRAM-ID. PGMEDIT.
       ENVIRONMENT DIVISION. 
       CONFIGURATION SECTION.
       SOURCE-COMPUTER. IBM-ZOS.
       OBJECT-COMPUTER. IBM-ZOS.
       INPUT-OUTPUT SECTION. 
       File-Control.
                  SELECT FPRINT ASSIGN TO DDPRINT
                     ORGANIZATION is SEQUENTIAL
                     ACCESS MODE is SEQUENTIAL
                     FILE STATUS is FS.
       DATA DIVISION.  
       FILE SECTION. 
       FD  FPRINT.
       01  REC-PRT.
           05 ENG-PRT  PIC   x(130).
       WORKING-STORAGE SECTION. 
       01  WS-RECPRT.
           05  WDATE              PIC XX/XX/XXXX.
           05  FILLER             PIC X(5).
           05  NUMCARTE           PIC 99999.
           05  FILLER             PIC X(5).
           05  VAL-CARTE          PIC +9999.99. 
           05  FILLER             PIC X(5).
           05  VAL-HORAIRE        PIC +9999.99.
           05  FILLER             PIC X(5).
           05  MONT-CARTE1        PIC +,+++,+++,++.
           05  FILLER             PIC X(5).
           05  MONT-CARTE2        PIC ZZZZZ.ZZ.
           05  FILLER             PIC X(5).
           05  MONT-CARTE3        PIC **.***,***,**.
           05  FILLER             PIC X(5).
           05  MONT-CARTE4        PIC $B,***,***,**BBDB.
       01  FS                     PIC 99. 
       PROCEDURE DIVISION .
           display 'debut chargement donnee'.
           OPEN OUTPUT FPRINT.
           IF FS = '00' THEN 
              display 'FILE OPEN SUCCESSFUL'
              ELSE
                 display ' FILE OPENNING ERROR' END-IF.
           MOVE   12022023    TO WDATE.
           MOVE   12345       TO NUMCARTE.
           MOVE   1234.678    TO VAL-CARTE.
           MOVE   152023      TO VAL-HORAIRE.
           MOVE   122235      TO MONT-CARTE1.
           MOVE   54545       TO MONT-CARTE2.
           MOVE   78989       TO MONT-CARTE3.
           MOVE   -254        TO MONT-CARTE4.
           MOVE   WS-RECPRT   TO REC-PRT.
           WRITE REC-PRT.
           CLOSE FPRINT.
           display 'amour dit zerrouk youssouf'.
           STOP RUN.                         

       