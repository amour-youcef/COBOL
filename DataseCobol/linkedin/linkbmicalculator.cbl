       identification division.
       program-id. "BMICALCILATOR".
       author. youssouf.
      * is program reads input from the user
       ENVIRONMENT DIVISION.
       
       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01  WEIGHT            PIC   999.
       01  HEIGHT_INCHES     PIC   999.
       01  BMI               PIC   999V99.
       procedure division.
       0100-START-HERE.
           display "Enter height in inches : ".
           ACCEPT HEIGHT_INCHES.
           DISPLAY "ENTER Weight in pounds : ".
           ACCEPT WEIGHT.

           COMPUTE BMI = WEIGHT * 703 / (HEIGHT_INCHES * HEIGHT_INCHES).
           DISPLAY "The BMI IS : ", BMI , "%".

           stop run.    

           END PROGRAM BMICALCILATOR.