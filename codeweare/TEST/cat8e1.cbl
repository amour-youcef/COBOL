       identification division.
       program-id. NoSpace.
      
       data division.
       linkage section.
       01 strng.
          03  strLen  pic 9(2).
          03  sChar   pic x 
              occurs 0 to 80 times depending on strLen.
       01 result.
          03  resLen  pic 9(2).
          03  resChar pic x
              occurs 0 to 80 times depending on resLen.
      
       procedure division using strng result.
      *     initialize result
      *     goback.
       end program NoSpace.