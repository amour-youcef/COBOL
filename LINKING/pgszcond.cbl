       IDENTIFICATION DIVISION.
       PROGRAM-ID. SUB-PROGRAM.
 
       DATA DIVISION.
       LINKAGE SECTION.
       01 LS-EMPLOYEE-ID PIC 9(3).
       01 LS-EMPLOYEE-NAME PIC A(25).
 
       PROCEDURE DIVISION USING LS-EMPLOYEE-ID, LS-EMPLOYEE-NAME.
           DISPLAY 'I am Sub Program'.
           MOVE 110 TO LS-EMPLOYEE-ID.
           EXIT PROGRAM.