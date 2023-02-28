       IDENTIFICATION DIVISION.            
       PROGRAM-ID. DEVLEC.  

       ENVIRONMENT DIVISION.               
       INPUT-OUTPUT SECTION.               
       FILE-CONTROL.                       
           SELECT EMPLOYE ASSIGN TO 'input.txt'  
           ORGANIZATION IS SEQUENTIAL    
           ACCESS IS SEQUENTIAL.       
      *     FILE STATUS IS FS.    
   
       DATA DIVISION.                            
       FILE SECTION.                             
       FD EMPLOYE.                               
       01 ENR-EMPLOYE.                 
           05 ID-EMPLOYE   PIC A(15).            
           05 NAME-EMPLOYE PIC A(15).            
           05 TITRE-EMPLOYE PIC X(3).            
       WORKING-STORAGE SECTION.                  
       01 WS-EMPLOYE.                            
           05 WS-EMPLOYE-ID  PIC A(3).           
           05 WS-NAME-EMPLOYE PIC A(15).         
           05 WS-TITRE-EMPLOYE PIC X(3).         
       PROCEDURE DIVISION.   

           OPEN EXTEND EMPLOYE.                  
           MOVE '560' TO ID-EMPLOYE.          
           MOVE 'JEAN' TO NAME-EMPLOYE.       
           MOVE '120'  TO TITRE-EMPLOYE.      
           WRITE ENR-EMPLOYE                 
           END-WRITE.                       
           CLOSE EMPLOYE.  

           STOP RUN.                      