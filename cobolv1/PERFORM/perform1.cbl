       IDENTIFICATION DIVISION.
       PROGRAM-ID. PERFOR.
       PROCEDURE DIVISION.
       A-PARA.
           PERFORM DISPLAY "IN A-PARA"
           END-PERFORM.
           PERFORM M-PARA THRU E-PARA.
       B-PARA.
           DISPLAY 'IN B-PARA'.
           STOP RUN.
       M-PARA.
           DISPLAY "IN M-PARA".
       C-PARA.
           DISPLAY 'IN C-PARA'.
       D-PARA.
           DISPLAY 'IN D-PARA'.
       E-PARA.
           DISPLAY 'IN E-PARA'.