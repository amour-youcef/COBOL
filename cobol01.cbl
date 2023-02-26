       identification division.
       program-id. Solde.
       author. youssouf.
       
       DATA DIVISION. 
       WORKING-STORAGE SECTION.
       01  SOLDE PIC S9(4).
       01  WS-ZONE1.
           05 WS-VAR1     PIC 9(9) USAGE COMP-3.
           05 WS-VAR2     PIC 9(5)v9 COMP-3.
           05 WS-VAR3     PIC 9(3)v9 PACKED-DECIMAL.  
       01  WS-SALAIRE1    PIC ZZZZ9.
       01  WS-SALAIRE2    PIC ****9.

       01  WS-SALAIRE3    PIC 9999.99.
       01  WS-SALAIRE4    PIC ZZZZ9.99.

       01  WS-SALAIRE5    PIC 9B999.99.
       01  WS-SALAIRE6    PIC ZZBZZ9.99.  

       01  WS-SOLDE1      PIC   +++B++9.99.
       01  WS-SOLDE2      PIC   +++B++9.99.
       01  WS-SOLDE3      PIC   ---B--9.99.
       01  WS-SOLDE4      PIC   ---B--9.99.

       procedure division.
           MOVE +1986 TO SOLDE.
           DISPLAY SOLDE.
           DISPLAY  WS-VAR1.

           MOVE   159 TO WS-SALAIRE1.
           MOVE   159 TO WS-SALAIRE2.

           DISPLAY 'ws salaire 1 :    ' WS-SALAIRE1 .
           DISPLAY 'salaire 2    :    ' WS-SALAIRE2 .   

           MOVE ZERO TO WS-SALAIRE3.
           MOVE ZERO TO WS-SALAIRE4.
           
           DISPLAY 'ws salaire 3 :    ' WS-SALAIRE3 .
           DISPLAY 'salaire 4    :    ' WS-SALAIRE4 . 
           
           MOVE 1596.99 TO WS-SALAIRE5.
           MOVE 1788.56 TO WS-SALAIRE6.
           
           DISPLAY 'ws salaire 5 :    ' WS-SALAIRE5 .
           DISPLAY 'salaire 6    :    ' WS-SALAIRE6 . 

           MOVE  +1699.99    TO    WS-SOLDE1.
           MOVE  -1699.99    TO    WS-SOLDE2.
           MOVE  +1699.99    TO    WS-SOLDE3.
           MOVE  -1999.99    TO    WS-SOLDE4.
           DISPLAY 'solde 1 : ' WS-SOLDE1. 
           DISPLAY 'solde 2 : ' WS-SOLDE2.    
           DISPLAY 'solde 3 : ' WS-SOLDE3.    
           DISPLAY 'solde 4 : ' WS-SOLDE4.    



           stop run.