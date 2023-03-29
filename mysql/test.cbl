        IDENTIFICATION DIVISION. 
        PROGRAM-ID. EXSTRING.
        DATA DIVISION. 
        WORKING-STORAGE SECTION. 
        01 SALUTATION   PIC X(21).
        01 ZONE1        PIC X(7) VALUE 'BONJOUR'.
        01 ZONE2        PIC x(13) VALUE  'tout le monde'.
        01 POINTEUR     PIC 9(2).

        PROCEDURE DIVISION .
           MOVE 1 TO POINTEUR.   
           STRING ZONE1, ZONE2
           DELIMITED BY SIZE 
           INTO SALUTATION 
           WITH POINTER  POINTEUR
           END-STRING 

           DISPLAY  SALUTATION 

           STOP RUN .