       IDENTIFICATION DIVISION.
       PROGRAM-ID. HELLO.

       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01 WS-entreprise.
           05 WS-direction OCCURS  4 TIMES.           
              10 WS-personnel PIC  X(10) VALUE SPACES.    
              10 WS-EMP-PROJ OCCURS 8 TIMES.    
        15 WS-prenom PIC 9(5) VALUE ZEROS.  
        15 WS-EMP-nom  PIC X(5) VALUE ZEROS.  
       PROCEDURE DIVISION.                         
       MAIN-PARA.                                  
           MOVE 'BANKA11111ARUNA' TO WS-direction(1). 
           MOVE 'MARKA22222BALAB' TO WS-direction(2). 
           DISPLAY '***********************'.   
           DISPLAY WS-direction (1).                   
           DISPLAY '***********************'.   
           DISPLAY WS-prenom(1,1).              
           STOP RUN.                 