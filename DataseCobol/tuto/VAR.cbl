       IDENTIFICATION DIVISION.                         
       PROGRAM-ID.  VAR.                                
       AUTHOR. FORMAT.                               
       DATA DIVISION.                                   
       WORKING-STORAGE SECTION.                        
       01 NUM1    PIC S9(5)V9(2).                       
       01 NUM2    PIC PPP999.                           
       01 NUM3    PIC S9(3)V9(2)  VALUE -425.56.        
       01 NAME    PIC A(6)        VALUE 'ABCDEF'.       
       01 IDD      PIC X(10)      VALUE 'ABCD12135$'.  
       77 TOTAL-JOUR PIC 9(6)V99  VALUE 1254. 
       PROCEDURE DIVISION.                              
           DISPLAY 'NUM1   : '  NUM1.                   
           DISPLAY 'NUM2   : '  NUM2.                   
           DISPLAY 'NUM3   : '  NUM3.                   
           DISPLAY 'NAME   : '  NAME.                   
           DISPLAY 'ID     : '  IDD .
           DISPLAY 'Tatal -jour : ' TOTAL-JOUR .                   
           STOP RUN.                                    