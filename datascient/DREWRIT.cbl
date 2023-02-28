        IDENTIFICATION DIVISION.                     
       PROGRAM-ID. DREWRIT.                         
       ENVIRONMENT DIVISION.                        
       INPUT-OUTPUT SECTION.                        
       FILE-CONTROL.                                
           SELECT EMPLOYE ASSIGN TO IN1             
           ORGANIZATION IS INDEXED                  
           ACCESS IS RANDOM                         
           RECORD KEY IS ID-EMPLOYE .                
      *    FILE STATUS IS FS.                       
       DATA DIVISION.                               
       FILE SECTION.                            
       FD EMPLOYE.    
                              
       01 ENR-EMPLOYE.                          
           05 ID-EMPLOYE PIC 9(3).               
           05 NAME-EMPLOYE  PIC A(15).           
           05 TITRE-EMPLOYE   PIC X(3).          
       WORKING-STORAGE SECTION.                                     
       01 WS-EMPLOYE.                                               
           05 WS-ID-EMPLOYE  PIC 9(3).                              
           05 WS-NAME        PIC A(15).                             
           05 WS-CLASS       PIC X(3).                              
       PROCEDURE DIVISION.                                          
           OPEN I-O EMPLOYE.                                        
           MOVE '560' TO ID-EMPLOYE.                                
           READ EMPLOYE                                             
           KEY IS ID-EMPLOYE                                    
           INVALID KEY DISPLAY 'KEY IS NOT EXISTING'            
           END-READ.                                            
           MOVE 'JEAN ' TO NAME-EMPLOYE.                        
           REWRITE EMPLOYE                                
           END-REWRITE.                                         
           CLOSE EMPLOYE.                                       
           STOP RUN.                                            