000100 IDENTIFICATION DIVISION.                                      
000200 PROGRAM-ID. MFPROG1.                                          
000300 ENVIRONMENT DIVISION.                                         
000400 CONFIGURATION SECTION.                                         
000500 SOURCE-COMPUTER. IBM-3090 WITH DEBUGGING MODE.                
000600 PROCEDURE DIVISION.                                           
000700 MAIN-PARA.                                                    
000800     DISPLAY 'COBOL PROGRAMMING LANGUAGE'                      
000900     DISPLAY 'DEBUGGING MODE ACTIVATED'                        
001000*    THIS IS LINE IS COMMENTED AS IT CONTAINS '*' ON POSITION 7
001100     DISPLAY 'LINE CONTIN'                                      
001200-            'UATION'                                         
001300     STOP RUN.  