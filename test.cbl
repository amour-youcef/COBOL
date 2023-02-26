       IDENTIFICATION DIVISION.                           
       PROGRAM-ID. CALCUL.                                
       DATA DIVISION.                                     
       WORKING-STORAGE SECTION.                           
       01 WS-DESCRIPTION.                                 
           05 WS-DATE1 VALUE '20140831'.                    
              10 WS-YEAR  PIC X(4).                       
              10 WS-MONTH PIC X(2).                       
              10 WS-DATA  PIC X(2).                       
           05 WS-DATE2 REDEFINES WS-DATE1 PIC 9(8).       
        01 WEIGHT           PIC   999.                     
       01 HEIGHT-NCHES    PIC   999.                      
       01 MM               PIC   999V99.                  
       01 GP-1.                                           
       02  VARADD  PIC 9(5).                          
       02  A    PIC   9(2)  VALUE 50.                 
       02  B   PIC   9(2)  VALUE 60.                      
       02  C   PIC   9(2)  VALUE 60.         
        02  D   PIC   9(2) VALUE  71.         
       02  E   PIC   9(3)  VALUE  30.        
        02  F   PIC   9(3)   VALUE  90.       
       PROCEDURE DIVISION.  
           DISPLAY ' EXMPEL SUR MOVE'.           
           MOVE 1200 TO VARADD.  
           DISPLAY 'VARADD : ' VARADD. 

           DISPLAY ' EXMPEL SUR ADD '.           
           ADD 120 TO VARADD.  
           DISPLAY 'VARADD : ' VARADD.
     
           ADD 1 TO VARADD.                    
           DISPLAY  'VARADD: ' VARADD.      
                                     
                      
           SUBTRACT 10 FROM C.                   
           DISPLAY 'C  :  ', C .                 
           MULTIPLY  A BY B C.                   
           DISPLAY 'B  :  ', B .                 
           DIVIDE    A INTO B GIVING F.          
           DISPLAY 'F :  ', F.                   
              STOP RUN.  