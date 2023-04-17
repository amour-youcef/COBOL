       IDENTIFICATION DIVISION.                                   
        PROGRAM-ID. SUB-PROGRAM.                                       
        ENVIRONMENT DIVISION.                                      
        CONFIGURATION SECTION.                                     
        SOURCE-COMPUTER. IBM-ZOS.                                  
        OBJECT-COMPUTER. IBM-ZOS.       
        INPUT-OUTPUT SECTION. 
        FILE-CONTROL. 
           SElECT  FREGION ASSIGN to region.
           select  fprint ASSIGN TO ddprint.
        DATA DIVISION.
        FILE SECTION. 
        01 REGION-record.
           02 region-id    PIC  9(2).
           02 nom-region   PIC  x(15).
        FD fprint.  
        WORKING-STORAGE SECTION.                         
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
        PROCEDURE DIVISION USING ws-region  ws-nom-region .       
           OPEN INPUT fregion.
           PERFORM  read-region-section
           PERFORM print-region UNTIL end-of-file 
           CLOSE region-file.
           STOP RUN .
           
           read-region-section.
           READ fregion 
               AT end move 'y' TO  end-of-file 
           END-READ.        