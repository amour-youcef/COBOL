       IDENTIFICATION DIVISION.
       PROGRAM-ID. MAIN-PROGRAM.
 
       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01 EMPLOYEE-ID PIC 9(3) VALUE 102.
       01 EMPLOYEE-NAME PIC A(25) VALUE 'GEEKSFORGEEKS'.
 
       PROCEDURE DIVISION.
           CALL 'SUB-PROGRAM' USING EMPLOYEE-ID, EMPLOYEE-NAME.
           DISPLAY 'I am Main Program'.
           DISPLAY 'Employee Id : ' EMPLOYEE-ID.
           DISPLAY 'Employee Name : ' EMPLOYEE-NAME.
           STOP RUN.