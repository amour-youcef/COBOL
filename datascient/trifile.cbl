       IDENTIFICATION DIVISION.                    
       PROGRAM-ID. TRIFILE.                        
       ENVIRONMENT DIVISION.                       
       CONFIGURATION SECTION.                      
       SOURCE-COMPUTER. IBM-ZOS.                   
       OBJECT-COMPUTER. IBM-ZOS.                   
       INPUT-OUTPUT SECTION.                       
       FILE-CONTROL.                               
           SELECT FILE-IN  ASSIGN TO FINPUT.       
           SELECT FILE-OUT ASSIGN TO FOUTPUT.      
           SELECT FILE-WK  ASSIGN TO FWORK.        
       DATA DIVISION.                              
       FILE SECTION.                               
       FD FILE-IN                                 
           LABEL RECORDS ARE STANDARD              
           BLOCK CONTAINS 800 CHARACTERS           
           RECORDING MODE IS F                     
           RECORD CONTAINS 80 CHARACTERS.          
       01 PERS-INP.   
         02 FILLER   PIC X(80).                    
       FD FILE-OUT                                  
           LABEL RECORDS ARE STANDARD               
           BLOCK CONTAINS 800 CHARACTERS           
           RECORDING MODE IS F                      
           RECORD CONTAINS 80 CHARACTERS.           
       01 PERS-OUT.                                 
          02 FILLER   PIC X(80).                    
       SD FILE-WK.                                  
       01 PERS-WRK.                                 
            02 ID-PERS-WRK   PIC 9(06).               
            02 INF-PERS-WRK  PIC X(74).               
       PROCEDURE DIVISION.                          
       DEBUT.                                       
           SORT FILE-WK                             
           ON ASCENDING KEY ID-PERS-WRK         
           USING FILE-IN                       
           GIVING FILE-OUT.                    
           IF SORT-RETURN > 0  DISPLAY "SORT FILED"  
           DISPLAY "FIN DU TRI FILE PERSONNEL".      
           STOP RUN .                                                                                 