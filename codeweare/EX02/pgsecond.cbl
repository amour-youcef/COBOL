       identification division.
       program-id. Flip.
       data division.
      
       linkage section.
       01  d                pic a.
       01  arr.
           05 arrLength     pic 9(3).
           05 xs               occurs 250 times 
                               depending on arrLength.
           10 xs-num        pic 9(3).
       01  result.
           05 resLength     pic 9(3).
           05 res           pic 9(3) occurs 250 times 
                                     depending on resLength.
      
       procedure division using d arr result.
      
            if d equal to 'R' then
             sort xs ascending xs-num
          else
             sort xs descending xs-num
            end-if
             move arr to result
            goback.
       end program Flip.