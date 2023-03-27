       identification division.
       program-id. helloworld.
       author. youssouf.
       DATA DIVISION.
       WORKING-STORAGE SECTION.
       
       01 TABLE-TEST.
            05 VAR1 OCCURS 10 TIMES.   
                 10 VAR2 PIC A(10).
                 10 VAR3 OCCURS 5 TIMES.
                    15 WS-D PIC X(6).

       01 EMP-COMPT PIC 9(3).
       01 EMP-INFO OCCURS 1 TO 999 TIMES
                    DEPENDING ON EMP-COMPT.
              05 EMP-ID PIC X(5).
       05 EMP-NOM PIC X(20).             
       PROCEDURE DIVISION.

               



           STOP RUN. 


