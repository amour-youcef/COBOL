       identification division.
       program-id. helloworld.
       author. youssouf.
       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01 num1 PIC  9(5).
       01 num2 PIC  9(3).
       01 num3 PIC  +9(3).99.
       01 num4 PIC   +9(3)V9(2).
       procedure division.
       
           display "hello world".
           MOVE +123.45 to num1 .
           MOVE +123.45 to num2 .
           MOVE +123.45 to num3 .
           MOVE +123.45 to num4 .


           DISPLAY  ' num1 :  ' num1 .
           DISPLAY  ' num2 :  ' num2 .
           DISPLAY  ' num3 :  ' num3 .
           DISPLAY  ' num4 :  ' num4 .   
           
           stop run. 