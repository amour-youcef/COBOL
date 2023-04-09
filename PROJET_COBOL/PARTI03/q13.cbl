        IDENTIFICATION DIVISION.                
        PROGRAM-ID . PARTI13.                   
        ENVIRONMENT DIVISION.                   
        CONFIGURATION SECTION.                  
        SOURCE-COMPUTER. IBM-ZOS.               
        OBJECT-COMPUTER. IBM-ZOS.               
        INPUT-OUTPUT SECTION.                   
        FILE-CONTROL.                           
            SELECT FCLT  ASSIGN TO 'CLIENT.DAT'       
           ORGANIZATION IS INDEXED             
            ACCESS MODE IS RANDOM               
           RECORD KEY IS ID-CPTE               
           FILE STATUS IS FS.                  
        DATA DIVISION.                          
        FILE SECTION.                           
        FD FCLT.                                
        01 REC-CLT.                             
           05  ID-CPTE    PIC X(03).            
           05  ID-REGION  PIC X(02).            
           05  NAT-CPTE   PIC 9(02).       
           05  NOM-CLT    PIC X(10).       
           05  PRN-CLT    PIC X(10).       
           05  DTN-CLT    PIC 9(08).       
           05  SEX-CLT    PIC X(01).       
           05  ACP-CLT    PIC X(02).       
           05  STS-CLT    PIC X(01).       
           05  ADR-CLT    PIC X(10).       
           05  SLD-CLT    PIC 9(10).       
           05  PST-CLT    PIC X(02).       
           05  FILLER     PIC X(19).       
        WORKING-STORAGE SECTION.           
        01 WS-CLT.                         
           05  WSID-CPTE    PIC X(03).     
           05  WSID-REGION  PIC X(02).     
           05  WSNAT-CPTE   PIC 9(02).     
           05  WSNOM-CLT    PIC X(10).     
           05  WSPRN-CLT    PIC X(10).     
           05  WSDTN-CLT    PIC 9(08).     
           05  WSSEX        PIC X(01).     
           05  WSSTS-CLT    PIC X(01). 
           05  WSADR-CLT    PIC X(10). 
           05  WSSLD-CLT    PIC 9(10). 
           05  WSPST-CLT    PIC X(02). 
         01 FS              PIC 99.       
        PROCEDURE DIVISION.                               
           DISPLAY 'AJOUTER NOUVEAU CLIENT'.             
           OPEN  I-O   FCLT.                             
           DISPLAY 'OPEN FILE STATUS  :   '  FS.        
           IF FS = '00' THEN                             
           DISPLAY 'FILE CLIENT OPEN SUCCESSFULL'    
           ELSE                                      
            DISPLAY 'FILE CLIENT OPENNING ERROR'      
            GO TO FIN-PGM                            
            END-IF.                                      
        MAIN-PARA.                                        
            MOVE '500' TO ID-CPTE.                       
            READ FCLT  RECORD INTO WS-CLT                
             KEY IS ID-CPTE                        
           INVALID KEY DISPLAY 'KEY IS NOT EXISTING'    
           NOT INVALID KEY DISPLAY 'KEY IS EXISTING'    
                  GO TO FIN-PGM                    
           END-READ                                     
            MOVE 01 TO ID-REGION.                   
            MOVE  05  TO NAT-CPTE.                      
            MOVE 'AA' TO NOM-CLT.                      
            MOVE 'BB' TO PRN-CLT.                      
            MOVE  11111111  TO DTN-CLT.                
            MOVE 'M'  TO SEX-CLT.                      
            MOVE '10' TO ACP-CLT.                      
            MOVE 'C'  TO STS-CLT.                      
            MOVE 'ADRESSCLT '  TO ADR-CLT.             
            MOVE 1234056 TO SLD-CLT.                   
            MOVE 'CR' TO PST-CLT.                      
            WRITE REC-CLT                                 
              INVALID KEY DISPLAY 'KEY IS INVALID'      
              NOT INVALID KEY DISPLAY 'KEY IS VALID'    
            END-WRITE.                                    
        FIN-PGM.                                           
             CLOSE FCLT.                                   
             STOP RUN.                                     