       IDENTIFICATION DIVISION. 
       PROGRAM-ID. LESBOUCLE.
       AUTHOR. YOUSSOUF.

       DATA DIVISION .
       
       WORKING-STORAGE SECTION.
       01  WS-CPT   PIC   9  VALUE 0.
       01  I        PIC   9  VALUE 0 .  
       PROCEDURE DIVISION.

           PERFORM UNTIL WS-CPT > 3 
             DISPLAY "nous APPenoms a utilisie les boucle"
             DISPLAY " ws-CPT : " WS-CPT 
             ADD 1 TO WS-CPT 
             END-PERFORM

             PERFORM WITH TEST BEFORE UNTIL I < 4
              DISPLAY "I = " I
              ADD 1 TO I 
             END-PERFORM  
              STOP RUN.
  