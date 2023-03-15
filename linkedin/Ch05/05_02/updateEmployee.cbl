       IDENTIFICATION DIVISION.
       PROGRAM-ID. UPDATEEMPLOYEE.

       ENVIRONMENT DIVISION.
       INPUT-OUTPUT SECTION. 
       FILE-CONTROL.
	   SELECT EMPLOYEEFILE ASSIGN TO "EMPMASTER.DAT"
        FILE STATUS IS MASTERFILE-CHECK-KEY
		ORGANIZATION IS LINE SEQUENTIAL.
		
       SELECT TRANSFILE ASSIGN TO "EMPTRANS.DAT"
        FILE STATUS IS TRANSFILE-CHECK-KEY
        ORGANIZATION IS LINE SEQUENTIAL.		
       
       SELECT NEWEMPFILE ASSIGN TO "NEWEMPFILE.DAT"
        ORGANIZATION IS LINE SEQUENTIAL.
              
       DATA DIVISION.
       FILE SECTION.
	   FD EMPLOYEEFILE.
	   01 EMPDETAILS.
			88 EMPENDOFFILE VALUE HIGH-VALUES.
			02 EMPID  	     PIC 9(7).
            02 DETAILS       PIC X(68).


       FD TRANSFILE.			
	   01 EMPTRANS.
			88 TRANSENDOFFILE VALUE HIGH-VALUES.
			02 NEWEMPID  	 PIC 9(7).
			02 NEWDETAILS    PIC X(68).
			02 TRANSCODE     PIC X.
		
       FD NEWEMPFILE.			
	   01 NEWEMPRECORD       PIC X(75).
					
   
       WORKING-STORAGE SECTION.
       01  WS-WORKING-STORAGE.
           05 FILLER      PIC X(27) VALUE 
		      'WORKING STORAGE STARTS HERE'.
     
       01  WS-DATE.
           05  WS-YEAR PIC 99.
           05  WS-MONTH PIC 99.
           05  WS-DAY   PIC 99.
		   
	   01  WS-WORK-AREAS.
	       05  MASTERFILE-CHECK-KEY   PIC X(2).
		   05  TRANSFILE-CHECK-KEY  PIC X(2).
			
		01  DETAIL-LINE.
			05 DET-EMP-ID       PIC 9(7).
			05 DET-DETAILS      PIC X(68).


       PROCEDURE DIVISION.
       0100-READ-EMPLOYEES.

		   OPEN INPUT EMPLOYEEFILE
           IF MASTERFILE-CHECK-KEY NOT = "00"
		      DISPLAY "ERR: OPEN FILE ERROR EMPFILE ",
				 MASTERFILE-CHECK-KEY
		      GO TO 9000-END-PROGRAM
		   END-IF.
		   OPEN INPUT TRANSFILE
		   IF TRANSFILE-CHECK-KEY NOT = "00"
		      DISPLAY "ERR: OPEN FILE ERROR TRANSFILE ",
			     TRANSFILE-CHECK-KEY
		   END-IF.	 
			 
		   OPEN OUTPUT NEWEMPFILE.
		   
		   READ EMPLOYEEFILE
			AT END SET EMPENDOFFILE TO TRUE
			END-READ.
			
		   READ TRANSFILE 
		    AT END SET TRANSENDOFFILE TO TRUE
			END-READ.
			
		   PERFORM 0200-PROCESS-EMPLOYEES UNTIL 
		      (EMPENDOFFILE) AND (TRANSENDOFFILE).
		   		   
		   PERFORM 9000-END-PROGRAM.
		   
	   0100-END.
	   
	   0200-PROCESS-EMPLOYEES.
	        EVALUATE TRUE
			  WHEN(EMPID < NEWEMPID)
			    WRITE NEWEMPRECORD FROM EMPDETAILS
				  READ EMPLOYEEFILE 
				    AT END SET EMPENDOFFILE TO TRUE
				  END-READ
				  
			  WHEN (EMPID > NEWEMPID)
			    WRITE NEWEMPRECORD FROM EMPTRANS 
				  READ TRANSFILE
				    AT END SET TRANSENDOFFILE TO TRUE
			      END-READ 
				 
				  
			  WHEN (EMPID = NEWEMPID AND TRANSCODE = 'D')
                  READ TRANSFILE
                      AT END SET TRANSENDOFFILE TO TRUE
                  END-READ	
                  READ EMPLOYEEFILE 
				    AT END SET EMPENDOFFILE TO TRUE
				  END-READ
				  
              WHEN (EMPID = NEWEMPID AND TRANSCODE = 'C')
			      MOVE NEWEMPID TO DET-EMP-ID
				  MOVE NEWDETAILS TO DET-DETAILS
			      WRITE NEWEMPRECORD FROM DETAIL-LINE
                  READ TRANSFILE
                      AT END SET TRANSENDOFFILE TO TRUE
                  END-READ
                  READ EMPLOYEEFILE 
				    AT END SET EMPENDOFFILE TO TRUE
				  END-READ		
       

		    END-EVALUATE.
		  
	   0200-END. 
	   	   
	   9000-END-PROGRAM.
           CLOSE EMPLOYEEFILE.	
		   CLOSE TRANSFILE.
           CLOSE NEWEMPFILE.		   
      
           STOP RUN.
           
          END PROGRAM UPDATEEMPLOYEE.
