       IDENTIFICATION DIVISION.                                         
       PROGRAM-ID. PERFORM_CONDITION.                                   
       DATA DIVISION.                                                   
       WORKING-STORAGE SECTION.                                         
       01  CNT  PIC  9  VALUE 0.                                        
       PROCEDURE DIVISION.                                              
       A-PARA.                                                          
           PERFORM B-PARA VARYING CNT FROM 1 BY 1 UNTIL CNT=5.    
           STOP RUN.                                                     
       B-PARA.                                                           
            DISPLAY 'IN B-PARA :' CNT .                                       
                                                               