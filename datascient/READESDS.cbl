       IDENTIFICATION DIVISION.                              
       PROGRAM-ID. READESDS.                                 
       ENVIRONMENT DIVISION.                                 
       CONFIGURATION SECTION.                                
       SOURCE-COMPUTER. IBM-ZOS.                             
       OBJECT-COMPUTER. IBM-ZOS.                             
       INPUT-OUTPUT SECTION.                                 
       FILE-CONTROL.                                         
           SELECT EMPLOYEE  ASSIGN TO EMPLOYE                 
           ORGANIZATION IS SEQUENTIAL                        
           ACCESS MODE IS SEQUENTIAL                         
      *     RECORD KEY IS                     
           FILE STATUS IS FS.                                
       
           SELECT FPRINT  ASSIGN TO EEEE                  
           ORGANIZATION IS SEQUENTIAL                        
           ACCESS MODE IS SEQUENTIAL                         
           FILE STATUS IS PFS.                               
       DATA DIVISION.                                        
       FILE SECTION.
       FD EMPLOYEE.                                          
       01 FILE-EMPLOYEE.                                    
           02 ID-EMP     PIC  X(5).                         
           02 NOM        PIC  X(10).                        
           02 PRENOM     PIC  X(10).                        
           02 ADRESSE    PIC  X(8).                         
           02 DEBIT      PIC  X(10).                        
           02 CREDIT     PIC  X(10).                        
           02 SALAIRE    PIC  X(10).                        
       FD FPRINT.                                           
       01 REC-PRT.                                          
            05  ENR-PRT  PIC X(72).                          
       WORKING-STORAGE SECTION.                             
       01 LIGNE01.                                         
           05 FILLER   PIC  X(80)  VALUE '-'.               
       01 LIGNE02.                                         
           05 FILLER   PIC  X      VALUE '!'.               
           05 TIDEMP   PIC  X(6)   VALUE 'ID-EMP'.          
           05 FILLER   PIC  X      VALUE '!'.               
           05 TNOM     PIC  X(10)  VALUE 'NOMEMP'.  
           05 FILLER   PIC  X      VALUE '!'.         
           05 TPRNOM  PIC  X(10)   VALUE 'PRENOM'.     
           05 FILLER   PIC  X      VALUE  '!'.         
           05 TADDR    PIC  X(8)   VALUE 'ADRESSE'.   
           05 FILLER   PIC  X      VALUE '!'.         
           05 TDEBIT   PIC  X(10)  VALUE 'DEBIT'.     
           05 FILLER   PIC  X      VALUE '!'.         
           05 TCREDI   PIC  X(10)  VALUE 'CREDIT'.    
           05 FILLER   PIC  X      VALUE '!'.         
           05 TSAL     PIC  X(10)  VALUE 'SALAIRE'.   
           05 FILLER   PIC  X      VALUE '!'.         
       01 LIGNE03.                                   
           05 FILLER   PIC  X      VALUE '!'.         
           05 WIDEMP   PIC  X(6).                     
           05 FILLER   PIC  X      VALUE '!'.         
           05 WNOM     PIC  X(10).                    
           05 FILLER   PIC  X      VALUE '!'.         
           05 WPRENOM  PIC  X(10).                    
           05 FILLER   PIC  X      VALUE '!'.   
           05 WADDR    PIC  X(8).                    
           05 FILLER   PIC  X      VALUE '!'.        
           05 WDEBIT   PIC  9(10).                   
           05 FILLER   PIC  X      VALUE '!'.        
           05 WCREDI   PIC  9(10).                   
           05 FILLER   PIC  X      VALUE '!'.        
           05 WSAL     PIC  9(10).                   
           05 FILLER   PIC  X      VALUE '!'.        
       01 SEPARATION PIC X(71).                     
       01 FS  PIC 99.                                
       01 PFS PIC 99.                                
       01 FI  PIC A(1).                              
       01 I   PIC 99.                                
       PROCEDURE DIVISION.                           
             DISPLAY 'CHARGEMENT DES DONNEE'.          
            OPEN INPUT EMPLOYEE.                      
              IF FS ='00' THEN                          
            DISPLAY 'CHARGEMENT REUSSI'          
            ELSE
                DISPLAY 'ERREUR LORS DU CHARGEMENT'       
             DISPLAY 'NUMERO ERREUR1 :'                 
            DISPLAY FS                                
            STOP RUN                                  
            END-IF.                                        
             OPEN OUTPUT FPRINT.                            
           IF FS ='00' THEN                               
            DISPLAY 'CHARGEMENT REUSSI'               
           ELSE                                           
           DISPLAY 'ERREUR LORS DU CHARGEMENT'       
           DISPLAY 'NUMERO ERREUR2 :'                 
           DISPLAY FS                                
           STOP RUN                                  
           END-IF.                                        
           MOVE LIGNE01 TO REC-PRT. 
           WRITE REC-PRT.                                 
           MOVE LIGNE02 TO REC-PRT.                                 
           WRITE REC-PRT.  
           MOVE LIGNE03 TO REC-PRT. 
           WRITE REC-PRT. 
           PERFORM UNTIL FI = 'Y'                         
           READ EMPLOYEE RECORD INTO FILE-EMPLOYEE
             AT END MOVE 'Y' TO FI    
             NOT AT END MOVE LIGNE03  TO REC-PRT
           END-READ                     
           END-PERFORM.                 
           MOVE LIGNE01 TO REC-PRT.
           WRITE REC-PRT.               
           CLOSE EMPLOYEE.              
            CLOSE FPRINT.                
            STOP RUN.                                                                                                                                      