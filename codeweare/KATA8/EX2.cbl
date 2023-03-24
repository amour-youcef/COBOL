       identification division.
       program-id. helloworld.
       author. youssouf.
       DATA DIVISION.
       WORKING-STORAGE SECTION.
         01 first-name  pic x(40).
         01 last-name   pic x(40).
          01 name        pic x(40).
          01 result      pic x(40).
       procedure division.
           
            move 'john McClane' to name .
           unstring name delimited by " " 
           into first-name last-name
           string function trim(last-name), " ", first-name 
           delimited by size into result
           
           DISPLAY  'ok' name .

             DISPLAY  'ok' result  .
           stop run. 