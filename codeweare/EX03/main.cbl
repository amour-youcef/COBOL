       identification division.
       program-id. tests.
      
       data division.
       working-storage section.
       01  s.
           03  l            pic 9(2).
           03  filler pic x occurs 0 to 30 times depending on l.
       01  result.
           03  rl           pic 9(2).
           03  filler pic x occurs 0 to 60 times depending on rl.
       01  expected.
           03  el           pic 9(2).
           03  filler       pic x occurs 0 to 60 times depending on el.
       01  zr               pic z(3)9.
       01  ze               pic z(3)9.
      
       procedure division.

           perform doTest
      
           move '11Hello World' to s
           move '22HHeelllloo  WWoorrlldd'
                to expected

      
           doTest.
         
           
           call 'Doublechar' using 
               by content s
               by reference result
      
           initialize assertion-message
           evaluate true
           when rl <> el
                move rl to zr
                move el to ze
                string 'Incorrect length' line-feed
                       'Expected ' function trim(ze)
                       ', but got ' function trim(zr)
                into assertion-message
                perform assert-false
            when result <> expected
                string 'Test failed' line-feed
                       'Expected "' expected(3:el) '"'
                        line-feed
                        'Actual  "' result(3:rl) '"'
              into assertion-message
              perform assert-false
            when other
              perform assert-true
           end-evaluate
           .
      
       end program tests.
      
