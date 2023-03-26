       IDENTIFICATION DIVISION.
       PROGRAM-ID. BONJOUR.
       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01 NUM PIC 9(3).
            88 PASS VALUES ARE 041 THRU 100.
            88 FAIL VALUES ARE 000 THRU 40.
       PROCEDURE DIVISION.
       STAT1.
            MOVE 06 TO NUM.
            IF PASS
            DISPLAY "Passed with " NUM "marks".
            IF FAIL
           DISPLAY "FAILED with " NUM "marks".
           STOP RUN.