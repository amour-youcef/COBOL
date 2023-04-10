       IDENTIFICATION DIVISION.                
        PROGRAM-ID . PARTI14.                   
        ENVIRONMENT DIVISION.                   
        CONFIGURATION SECTION.                  
        SOURCE-COMPUTER. IBM-ZOS.               
        OBJECT-COMPUTER. IBM-ZOS.               
        INPUT-OUTPUT SECTION.                   
        DATA DIVISION. 
        FILE SECTION.  
        WORKING-STORAGE SECTION. 
           01 ws-region.
              02 WS-REGION-id   PIC  x(2).
              02 ws-nom-region  PIC  x(15).                       
        PROCEDURE DIVISION .
           call pgsecond using WS-REGION-id, ws-nom-region.