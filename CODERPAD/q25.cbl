       identification division.
       program-id. helloworld.
       author. youssouf.
       DATA DIVISION.
       WORKING-STORAGE SECTION.
       
       01  MIN   PIC S9(04) COMP .
       01  ITRI  PIC S9(04) COMP .
       01  IND   PIC S9(04) COMP .
       01  NBET  PIC 99 VALUE 50.
       01  RESERV PIC 9(5).
       01  EXEMPLE.
           05  TAB OCCURS 50.
              10 ELT PIC 9(5).

       procedure division.
           MOVE  1 TO MIN TRI   
           PERFORM UNTIL ITRI <NBET 
              ADD 1 TO MIN 
              PERFORM VARYING IND FROM MIN BY IND UNTIL IND NOT > 
           NBELT 
              IF ELT (IND ) <ELT (ITPI)
              THEN 
                  MOVE ELT (ITRI) TO RESERV 
                  MOVE ELT (IND)  TO ELT (ITRI )
                  MOVE RESERV TO ELT (IND )
                  END-IF 
                  END-PERFORM
                  ADD 1 TO ITRI 
                 END-PERFORM.
       
           stop run. 