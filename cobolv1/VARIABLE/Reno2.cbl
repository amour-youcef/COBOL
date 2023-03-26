       IDENTIFICATION DIVISION.
       PROGRAM-ID. BONJOUR.
       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01 WS-DESCRIPTION.
           05 WS-NUM.
              10 WS-NUM1 PIC 9(2) VALUE 20 .
              10 WS-NUM2 PIC 9(2) VALUE 56.
           05 WS-CHAR.
              10 WS-CHAR1 PIC X(2) VALUE "AA".
              10 WS-CHAR2 PIC X(2) VALUE "BB".
              66 WS-RENAME RENAMES WS-NUM2 THRU WS-CHAR2.
       01 WS-NUM3 PIC  S9(4) VALUE 1234.
       01 WS-NUM4 PIC  9(5)V999 VALUE  46245.123.
       01 WS-NUM5 PIC S9(4)V9(2) VALUE  -1234.12 .
       01 WS-NUM6 PIC  PPP999 VALUE .000123.
       PROCEDURE DIVISION.

           DISPLAY "BIENVENUE A CETTE FORMATION".
           
           DISPLAY WS-CHAR2 .              

           DISPLAY WS-CHAR.  
           DISPLAY WS-NUM . 
           DISPLAY "*********".
           DISPLAY WS-RENAME .
           DISPLAY  "***********".
           DISPLAY WS-NUM3 . 
           DISPLAY  WS-NUM4 .
           DISPLAY "****** num5 ".
           DISPLAY WS-NUM5 .
           DISPLAY " num6 : " WS-NUM6 .
           STOP RUN.