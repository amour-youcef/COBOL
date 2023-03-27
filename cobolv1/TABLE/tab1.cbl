       identification division.
       program-id. helloworld.
       author. youssouf.
       DATA DIVISION.
       WORKING-STORAGE SECTION.
       
       01 ANNEE.
            05 MOIS OCCURS 12 TIMES PIC X(10).
       01 TAB-NOTES OCCURS 25.
            02 NOTE-MATHS PIC 99v99.
            02 NOTE-FRANCAIS PIC 99v99.
            02 NOTE-PHYSIQUE PIC 99v99.

       01 TABLE-TEST.
            05 VART PIC A(5) OCCURS 20 TIMES.   

       01 TABLE-TRAVAIL.
            05 VAR1 PIC A(10) VALUE 'TUTORIALS' OCCURS 5 TIMES.   

       PROCEDURE DIVISION.
           MOVE  "12345467891011121314151617181920" TO TABLE-TEST .
              
              DISPLAY "TABLE-TRAVAIL : "TABLE-TRAVAIL.
              DISPLAY " test ****"
           DISPLAY VAR1(3).
               



           STOP RUN. 


