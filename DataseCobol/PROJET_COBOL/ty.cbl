        IDENTIFICATION DIVISION.
        PROGRAM-ID. TRI-REGION.

        ENVIRONMENT DIVISION.
        INPUT-OUTPUT SECTION.
        FILE-CONTROL.
           SELECT INPUT-FILE ASSIGN TO 'INPUT.FILE'.
           SELECT OUTPUT-FILE ASSIGN TO 'OUTPUT.FILE'.

        DATA DIVISION.
        FILE SECTION.
       FD INPUT-FILE.
       01 INPUT-RECORD.
           05 REGION PIC X(2).
           05 FILLER PIC X(78).
       FD OUTPUT-FILE.
       01 OUTPUT-RECORD.
           05 REGION PIC X(2).
           05 FILLER PIC X(78).

       WORKING-STORAGE SECTION.
       01 SORT-WORK-AREA.
           05 SORT-KEY PIC X(2).
           05 FILLER   PIC X(78).
       01 END-OF-FILE-SWITCH PIC X(3) VALUE 'NO '.

       PROCEDURE DIVISION.
       MAIN-LOGIC.
           OPEN INPUT INPUT-FILE
           OPEN OUTPUT OUTPUT-FILE
           PERFORM UNTIL END-OF-FILE-SWITCH = 'YES'
           READ INPUT-FILE INTO INPUT-RECORD
           IF NOT AT END
            MOVE REGION TO SORT-KEY
            WRITE OUTPUT-RECORD
           ELSE
            MOVE 'YES' TO END-OF-FILE-SWITCH
              END-IF
              END-PERFORM
              CLOSE INPUT-FILE
            CLOSE OUTPUT-FILE
              STOP RUN.


      