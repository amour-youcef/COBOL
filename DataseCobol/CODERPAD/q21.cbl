       identification division.
       program-id. helloworld.
       author. youssouf.
       DATA DIVISION.
       WORKING-STORAGE SECTION.

       01 VAR-1 PIC  $z(6)V99-.
       01 VAR-2 PIC  $(7).99-.
       01 VAR-3 PIC  -$Z(6).99.
       01 RESULT PIC $Z(6).99-.
       
       01 A PIC  9(1) VALUE  0.
       procedure division.
       
           display "hello world".

           EVALUATE A 
           WHEN  A=0 DISPLAY "A = 0 "
           WHEN  A=5 display "A = 5 "
           WHEN OTHER  DISPLAY " AS IS NOT 0 NOR 5"
           END-EVALUATE 

      *     EVALUATE A
      *     WHEN 0 DISPLAY "A = 0 "
      *     WHEN 5 display "A = 5 "
      *     WHEN OTHER  DISPLAY " AS IS NOT 0 NOR 5"
      *     END-EVALUATE 
              
      *     EVALUATE TRUE 
      *     WHEN A = 0 DISPLAY "A = 0 "
      *     WHEN A = 5 display "A = 5 "
      *     WHEN OTHER  DISPLAY " AS IS NOT 0 NOR 5"
      *     END-EVALUATE 
       
           stop run. 