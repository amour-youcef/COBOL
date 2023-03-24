       IDENTIFICATION DIVISION.
       PROGRAM-ID. SUB-PROGRAM.
 
       DATA DIVISION.
       LINKAGE SECTION.
        01 N           PIC 9(7).
        01 RESULT      PIC 9(8).
 
       PROCEDURE DIVISION USING N, RESULT .
           
           DISPLAY 'I am Sub Program'.

           IF FUNCTION  MOD (N, 2) = 0 
              MULTIPLY N BY 8 GIVING RESULT 
           else MULTIPLY N By 9 GIVING  RESULT 

           END-IF.        
           
           EXIT PROGRAM.