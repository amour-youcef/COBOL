       IDENTIFICATION DIVISION.               
       PROGRAM-ID . PARTI10.                  
       ENVIRONMENT DIVISION.                  
       INPUT-OUTPUT SECTION.                  
       FILE-CONTROL.                          
            SELECT FREG  ASSIGN TO REGION      
            ORGANIZATION IS SEQUENTIAL         
              ACCESS MODE IS SEQUENTIAL          
           FILE STATUS IS FS.                 
           SELECT OUTFILE ASSIGN TO ROUT      
           ORGANIZATION IS SEQUENTIAL         
           ACCESS IS SEQUENTIAL.              
       DATA DIVISION.                         
       FILE SECTION.                          
       FD OUTFILE.                            
       01 REC-OUTFILE PIC X(80).              
       FD FREG.                               
           01 REC-FREG.                           
            05  COMPT  PIC X(3).
                  05  REG    PIC X(2).        
            05  NAT    PIC 99.          
            05  NOMC   PIC A(10).       
              05  PREN   PIC A(10).       
              05  DATEC  PIC 9(8).        
           05  SEXE   PIC A.           
           05  ACTP   PIC X(2).        
           05  STSO   PIC 9.           
           05  ADRE   PIC A(10).       
           05  SOLD   PIC 9(10).       
           05  POTI   PIC AA.          
           05  FILLER PIC X(19).       
       01 WS-REG.                     
            05  WCOMPT  PIC X(3).       
           05  WREG    PIC X(2).       
           05  WNAT    PIC 99.         
           05  WNOMC   PIC A(10).      
           05  WPREN   PIC A(10).      
           05  WDATEC  PIC 9(8).       
           05  WSEXE   PIC A.    
           05  WACTP   PIC X(2).                              
           05  WSTSO   PIC 9.                                 
           05  WADRE   PIC A(10).                             
           05  WSOLD   PIC 9(10).                             
           05  WPOTI   PIC AA.                                
           05  WFILLER PIC X(19).                             
        01 FS PIC 99.                                          
        01 EOL PIC A(1) VALUE 'N'                              
        01 OLDREG PIC 99.                                      
        PROCEDURE DIVISION.                                    
           OPEN  I-O FREG.                                     
           OPEN EXTEND OUTFILE.                                
           MOVE 0 TO REG.                                      
           START FREG KEY IS >= REG                            
           READ REG INTO WREG                                  
           MOVE WS-REG INTO REC-OUTFILE                        
           WRITE REC-OUTFILE                                   
           MOVE WREG TO FIN                                    
           PERFORM UNTIL EOL ='Y'                              
           READ REG INTO WREG AT END MOVE 'Y' TO EOL    
              NOT AT END MOVE WREG TO  REC-OUTFILLE         
            WRITE REC-OUTFILLE AFTER ADVANCING 02 LINES   
           MOVE WREG TO FIN                              
            ELSE WRITE REC-OUTFILLE                       
            END-IF                                        
           END-READ                                      
            END-PEFORM                                    
            STOP RUN.                                                                  