       IDENTIFICATION DIVISION.
       PROGRAM-ID. RepeatStr.
     
       DATA DIVISION.
       WORKING-STORAGE SECTION. 
       01  i  usage index.
       LINKAGE SECTION.
       01  n        PIC 9(2).
       01  s.

           05 s-length    PIC  9(2).
           05 s-char      PIC  X OCCURS  0 TO 50 times 
                          DEPENDING ON s-length.

       01  result.
           05 res-length     PIC 9(4).
           05 res-char.
               07        PIC X OCCURS 0 TO 3000 times
                          DEPENDING ON res-length .             
       
       PROCEDURE DIVISION USING n s result.

           SET i TO 1 
           COMPUTE res-length = n * s-length
           PERFORM n TIMES 
              STRING  s-char DELIMITED BY SIZE
                    INTO res-char
                    WITH POINTER i 
               END-STRING        
              end-perform.


              GOBACK.

              END PROGRAM RepeatStr. 
