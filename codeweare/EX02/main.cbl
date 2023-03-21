          identification division.
       program-id. tests.
      
       data division.
       working-storage section.
       01  d                pic a.
       01  arr.
           05 l             pic 9(3).
           05 xs            pic 9(3) occurs 250 times 
                                      depending on l.
       01  result.
           05 rl            pic 9(3).
           05 r             pic 9(3) occurs 250 times  depending on rl.
       01  expected.
           05 el            pic 9(3).
           05 e             pic 9(3) occurs 250 times  depending on el.
       01  i                usage index.
       01  x-str            pic x(10).
       01  x-delim          pic x.
       01  fixed-test       pic x(100).
       01  fixed-exp        pic x(100).
       01  nDisp            pic z(19)9.
      
       procedure division.

           move '4,5,6,7,1' to fixed-test
           move '1,4,5,6,7' to fixed-exp
           move 'R' to d

          move 0 to l el
          if fixed-test <> ' '
              set i to 1
              perform with test after until x-delim = space
                  unstring fixed-test 
                      delimited by ',' or space 
                      into x-str delimiter in x-delim
                      with pointer i
                  add 1 to l
                  compute xs(l) = function numval(x-str)
              end-perform
           end-if
      
          if fixed-exp <> ' '
              set i to 1
              perform with test after until x-delim = space
                  unstring fixed-exp 
                      delimited by ',' or space 
                      into x-str delimiter in x-delim
                      with pointer i
                  add 1 to el
                  compute e(el) = function numval(x-str)
              end-perform
           end-if
           perform doTest.
           
      
           doTest.
           testcase 'Testing d = "' d '"'.
           
           call 'Flip' using 
               by content   d  arr
               by reference result
      
           initialize assertion-message
           if expected <> result
              perform assert-false
              perform displayArrays
           else
              perform assert-true
           end-if
           .
      
       displayArrays.
           if l = 0
              display 'arr      = [ ]'
           else
             display 'arr      = [' no advancing
               perform varying i from 1 until i > l
                 move xs(i) to nDisp
                 display function trim(nDisp) no advancing
                 if i < l display ', ' no advancing
                 else     display ']' end-if
             end-perform
           end-if
      
           if rl = 0
              display 'result   = [ ]'
           else
             display 'result   = [' no advancing
               perform varying i from 1 until i > rl
                 move r(i) to nDisp
                 display function trim(nDisp) no advancing
                 if i < rl display ', ' no advancing
                 else     display ']' end-if
             end-perform
           end-if
      
           if el = 0
              display 'expected = [ ]'
           else
             display 'expected = [' no advancing
               perform varying i from 1 until i > el
                 move e(i) to nDisp
                 display function trim(nDisp) no advancing
                 if i < el display ', ' no advancing
                 else     display ']' end-if
             end-perform
           end-if
           .
      
       end program tests.
      