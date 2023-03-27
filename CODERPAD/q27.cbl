       identification division.
       program-id. helloworld.
       author. youssouf.
       DATA DIVISION.
       WORKING-STORAGE SECTION.
       
       01  W-DATA  PIC X(15) VALUE "****30,41 ***".
       01  VALUE ZERO .
           05 COMPTEUR1 PIC 99.
           05 COMPTEUR2 PIC 99.
           05 COMPTEUR3 PIC 99.
      
       procedure division.
           INSPECT W-DATA TALLYING COMPTEUR1 FOR ALL "*".
           DISPLAY COMPTEUR1 .

           INSPECT W-DATA TALLYING COMPTEUR2 FOR LEADING "*"

           DISPLAY COMPTEUR2 .

           INSPECT W-DATA(COMPTEUR2+ 1:)

                    TALLYING COMPTEUR3 FOR CHARACTERS
                    BEFORE INITIAL "*"
           DISPLAY COMPTEUR3            
       
           stop run. 