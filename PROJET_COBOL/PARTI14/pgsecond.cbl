       IDENTIFICATION DIVISION.                                   
        PROGRAM-ID. pgsecond.                                       
        ENVIRONMENT DIVISION.                                      
        CONFIGURATION SECTION.                                     
        SOURCE-COMPUTER. IBM-ZOS.                                  
        OBJECT-COMPUTER. IBM-ZOS.       
        INPUT-OUTPUT SECTION. 
        FILE-CONTROL. 
            SELECT INPUT-FILE ASSIGN TO 'INPUT.FILE'.
            SELECT OUTPUT-FILE ASSIGN TO 'OUTPUT.FILE'.
        DATA DIVISION.
        FILE SECTION. 
        
        WORKING-STORAGE SECTION.   
        FD fprint.                       
        01 LS-LENGHT   PIC  s9(4) COMP .
        01 LS-REGION-ID PIC  x(2).
        01 LS-NOM-region.                                                                               
        LINKAGE SECTION. 
        01 page-ctr     pic 9(3) VALUE 1.
        01 LINE-ctr     PIC  9(3) VALUE 1.
        01 max-lines    PIC  9(3) VALUE  15.
        01 end-of-file  PIC  x VALUE  'N'.
        01 WSID-REGION-record.
           02 WSID-REGION-id  PIC  x(2).
           02 ws-nom-region  PIC x(15). 

       01 REGION-record.
           02 region-id    PIC  9(2).
           02 nom-region   PIC  x(15).
                    
        PROCEDURE DIVISION USING ID-REGION  NOM-REGION.
        0100-BEGIN.       
           OPEN INPUT INPUT-FILE.
           OPEN OUTPUT OUTPUT-FILE
           PERFORM  0200-PROCESS-RECORDS.
           PERFORM print-region UNTIL END-OF-END.
           CLOSE INPUT-FILE.
           STOP RUN .
           
           0200-PROCESS-RECORDS.
           READ fregion 
               AT end move 'y' TO  end-of-file 
           END-READ.        

           0300-STOP-RUN.	