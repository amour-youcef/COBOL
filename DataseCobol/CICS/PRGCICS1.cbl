        IDENTIFICATION DIVISION.
        PROGRAM-ID. PRGCICS1.

        DATA DIVISION.
        FILE SECTION.

        WORKING-STORAGE SECTION.
        01 WS-DISP-MESSAGE PIC X(15).
        01 WS-DISP-LENGTH  PIC S9(4) COMP.

        PROCEDURE DIVISION.
      *  0000-MAIN-PARA.
           MOVE 'HELLO CICS !!!!' TO WS-DISP-MESSAGE
           MOVE +15 TO WS-DISP-LENGTH

           EXEC CICS SEND TEXT
           FROM (WS-DISP-MESSAGE)
              LENGTH (WS-DISP-LENGTH)
           END-EXEC

           EXEC CICS
              RETURN
              END-EXEC.