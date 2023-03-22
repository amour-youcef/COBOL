       identification division.
       program-id. helloworld.
       author. youssouf.
       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01 C    PIC   9(2).
       01 RESULT PIC  9(2).
       procedure division.
       
           display "hello world".


           PERFORM  VARYING  c FROM 1 BY 1 UNTIL C = 6  
           COMPUTE RESULT = RESULT + 1 
           END-PERFORM.

           DISPLAY ' resulr :=  ' RESULT 
           stop run. 