       identification division.
       program-id. helloworld.
       author. youssouf.
       DATA DIVISION.
       WORKING-STORAGE SECTION.

       01 VAR-1 PIC  $z(6)V99-.
       01 VAR-2 PIC  $(7).99-.
       01 VAR-3 PIC  -$Z(6).99.
       01 RESULT PIC $Z(6).99-.

       procedure division.
       
           display "hello world".

           MOVE  000232.45 TO VAR-1  .
           MOVE  000232.45 TO VAR-2  .
           MOVE  000232.45 TO VAR-3  .
           MOVE  000232.45 TO RESULT   .
          
           DISPLAY  'VAR1 : ' VAR-1  .   
           DISPLAY  'VAR2 : ' VAR-2  . 
           DISPLAY  'VAR3 : ' VAR-3  .
           DISPLAY  'result : ' VAR-2  .  
           


              
           
           stop run. 