        IDENTIFICATION DIVISION.
        PROGRAM-ID. MAIN-PROGRAM.
 
        DATA DIVISION.
        WORKING-STORAGE SECTION.
           
           77 i             pic 9(3).
           77 str-pos       pic 9(3).
           77 temp-string   pic x(100).
           77 numbers-value pic x(10) value "0123456789".

           01 s           pic x(100).
       PROCEDURE DIVISION.     
             move "*22222*" to s.
             move s to temp-string.
            
          perform varying i from 1 by 1 until i greater than 10
            inspect temp-string replacing all numbers-value(i:1) by "0"
          end-perform.
      
          move space to s.
          set str-pos to 0.
            
          perform varying i from 1 by 1 
          until i greater than function length(s)
            
            if temp-string(i:1) is not equal "0"
              add 1 to str-pos
              move temp-string(i:1) to s(str-pos:1)
            end-if
      
          end-perform.
      
          display s
           
           STOP RUN.