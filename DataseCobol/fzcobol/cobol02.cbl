       IDENTIFICATION DIVISION. 
       program-id. OPERATION.
       author. youssouf.

       DATA DIVISION.
       WORKING-STORAGE SECTION. 

       01  NUM1    PIC  9(4) VALUE 10.
       01  NUM2    PIC  9(4) VALUE 15.  
       01  NUM3    PIC  9(4).
       
       01  NUM4    PIC  9(4) VALUE 53.
       01  NUM5    PIC  9(4) VALUE 5.  
       01  NUM6    PIC  9(4).
       01  NUM7    PIC   9(4).  
       01  RESULTAT PIC 9(4).
       PROCEDURE DIVISION.
           DISPLAY "exemple sur les operation".

           MULTIPLY NUM1   BY NUM2 GIVING NUM3 .
           
           DISPLAY "le resultat de num2 : " NUM2 .
           DISPLAY " num 3 : " NUM3.

           DISPLAY "Exemple sur DIVIDE".

      *     DIVIDE NUM5 INTO NUM4 . 
           
      *     DISPLAY "le resultat de division : NUM 4 " NUM4 , 
      *                                      " num 5 :" NUM5

      *     DIVIDE  NUM4 BY NUM5 GIVING NUM6 .

      *     DISPLAY " resulta devision by giv : " NUM6.                                   
           
           DIVIDE NUM4 BY NUM5 GIVING NUM6 REMAINDER NUM7.      
           DISPLAY " NUM 6 : " NUM6 "    NUM7 : " NUM7.

           COMPUTE RESULTAT = (10 * 15) + (100/4).
           DISPLAY "RESULTAT : " RESULTAT 

      *     COMPUTE WS-RES = 9,564 + 11,335.
                stop run. 