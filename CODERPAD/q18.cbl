       identification division.
       program-id. helloworld.
       author. youssouf.
       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01 VAR-1 PIC  X(5) VALUE  'PL/I'.
       01 VAR-2 PIC  X(10).
       01 VAR-3 PIC  X(3).
       01 RESULT PIC  X(5).
       procedure division.
       
           display "hello world".

           MOVE  'COBOL' TO RESULT .
           MOVE  VAR-1  TO VAR-2 .
           MOVE  VAR-2  TO VAR-3 .
           MOVE  VAR-3  TO RESULT.
           
          
           DISPLAY  'result : ' RESULT .   
           

              
           
           stop run. 