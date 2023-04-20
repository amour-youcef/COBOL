        IDENTIFICATION DIVISION.
        PROGRAM-ID. MAIN-PROGRAM.
 
        DATA DIVISION.
        WORKING-STORAGE SECTION.
           

         01 n            pic S9(3).
         01 result       pic S9(3) sign leading.
 
       PROCEDURE DIVISION.     
            
            EVALUATE n
               WHEN <= 0    COMPUTE result = n
               WHEN < 13    COMPUTE result = n - 1
               WHEN OTHER   COMPUTE result = n - 2
           END-EVALUATE.
           STOP RUN.