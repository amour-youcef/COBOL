       IDENTIFICATION DIVISION.                             
       PROGRAM-ID. EXEVALUATE.   
       
       DATA DIVISION.

       WORKING-STORAGE SECTION.
       01  NOTE-EXAM   PIC  99 VALUE 0. 
       01  NOTE-STAGE  PIC  99 VALUE 0.  
       01  DECISION    PIC X(10) . 
       PROCEDURE DIVISION.                                  
                                    
           EVALUATE NOTE-EXAM ALSO NOTE-STAGE
           WHEN 10 THRU 20 ALSO 10 THRU 20
           MOVE "RECU" TO DECISION
           WHEN 9 THRU 10 ALSO 12 THRU 10
           MOVE "RATTRAPE PAR LE STAGE" TO DECISION
           WHEN 14 THRU 20 ALSO 9 THRU 10
           MOVE "RATTRAPE PAR NOTES EXAM" TO DECISION
           WHEN OTHER
           MOVE "ELIMINE" TO DECISION
           END-EVALUATE.   

              DISPLAY "OK"  DECISION. 

           STOP RUN.                                     