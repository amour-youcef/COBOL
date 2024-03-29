       IDENTIFICATION DIVISION.
       PROGRAM-ID. TABLES.

       ENVIRONMENT DIVISION.
       INPUT-OUTPUT SECTION.
       FILE-CONTROL.
	      SELECT RAINFALLFILE ASSIGN TO "RAINFALL.DAT"
	     	ORGANIZATION IS LINE SEQUENTIAL.
                      
       DATA DIVISION.
       FILE SECTION.
	    FD RAINFALLFILE.
	       01 RAINFALLDETAILS.
		     	88 ENDOFFILE VALUE HIGH-VALUES.
		     	02 CITY-NAME  	PIC X(15).
		    	02 RAINFALL.
				03 RAIN-AMOUNT 	PIC 99V9    
				   OCCURS 12 TIMES.		
   
       WORKING-STORAGE SECTION.   
       01  WS-REPORT-TITLE.
           05  FILLER     PIC X(20) VALUE SPACES.
           05  FILLER     PIC X(30) 
		        VALUE 'RAINFALL BY CITY IN INCHES'.		   
       01  WS-HEADING-LINE.
	       05  FILLER     PIC X(16) VALUE 'CITY'.
		   05  FILLER     PIC X(4) VALUE ' JAN'.
		   05  FILLER     PIC XX.
	       05  FILLER     PIC X(4) VALUE ' FEB'.
		   05  FILLER     PIC XX.
	       05  FILLER     PIC X(4) VALUE ' MAR'.
		   05  FILLER     PIC XX.
		   05  FILLER     PIC X(4) VALUE ' APR'.
		   05  FILLER     PIC XX.
	       05  FILLER     PIC X(4) VALUE ' MAY'.
		   05  FILLER     PIC XX.
	       05  FILLER     PIC X(4) VALUE ' JUN'.
		   05  FILLER     PIC XX.
	       05  FILLER     PIC X(4) VALUE ' JUL'.
		   05  FILLER     PIC XX.
	       05  FILLER     PIC X(4) VALUE ' AUG'.
		   05  FILLER     PIC XX.
		   05  FILLER     PIC X(4) VALUE ' SEP'.
		   05  FILLER     PIC XX.
	       05  FILLER     PIC X(4) VALUE ' OCT'.
		   05  FILLER     PIC XX.
	       05  FILLER     PIC X(4) VALUE ' NOV'.
		   05  FILLER     PIC XX.
	       05  FILLER     PIC X(4) VALUE ' DEC'.
       01  WS-HEADING-LINE2.
	       05  FILLER     PIC X(16) VALUE '----------------'.
		   05  FILLER     PIC X(4) VALUE ' ---'.
		   05  FILLER     PIC XX.
	       05  FILLER     PIC X(4) VALUE ' ---'.
		   05  FILLER     PIC XX.
	       05  FILLER     PIC X(4) VALUE ' ---'.
		   05  FILLER     PIC XX.
		   05  FILLER     PIC X(4) VALUE ' ---'.
		   05  FILLER     PIC XX.
	       05  FILLER     PIC X(4) VALUE ' ---'.
		   05  FILLER     PIC XX.
	       05  FILLER     PIC X(4) VALUE ' ---'.
		   05  FILLER     PIC XX.
	       05  FILLER     PIC X(4) VALUE ' ---'.
		   05  FILLER     PIC XX.
	       05  FILLER     PIC X(4) VALUE ' ---'.
		   05  FILLER     PIC XX.
		   05  FILLER     PIC X(4) VALUE ' ---'.
		   05  FILLER     PIC XX.
	       05  FILLER     PIC X(4) VALUE ' ---'.
		   05  FILLER     PIC XX.
	       05  FILLER     PIC X(4) VALUE ' ---'.
		   05  FILLER     PIC XX.
	       05  FILLER     PIC X(4) VALUE ' ---'.
	        01  WS-DETAIL-LINE.
	       05  WS-DET-CITY PIC X(15).
		   05  WS-DET-AMT OCCURS 12 TIMES.
		       07  FILLER      PIC XX.   
			   07  WS-DET-RAIN PIC 99.9.
	       01  WS-VALUES.
	       05  WS-MONTH    PIC 99. 	   

       PROCEDURE DIVISION.
       
	   0100-BEGIN.
		    
		       OPEN INPUT RAINFALLFILE.
		       READ RAINFALLFILE
		    	AT END SET ENDOFFILE TO TRUE
		    	END-READ.
		      DISPLAY WS-REPORT-TITLE.
		     DISPLAY WS-HEADING-LINE.	
		     DISPLAY WS-HEADING-LINE2.	
		     PERFORM 0200-PROCESS-RECORDS UNTIL ENDOFFILE.
		     CLOSE RAINFALLFILE.
		     PERFORM 0300-STOP-RUN.
	   
	          0200-PROCESS-RECORDS.
		    	MOVE CITY-NAME TO WS-DET-CITY.
		    	PERFORM VARYING WS-MONTH FROM 1 BY 1 
			   UNTIL WS-MONTH = 13
			   MOVE RAIN-AMOUNT(WS-MONTH) TO 
			      WS-DET-RAIN(WS-MONTH)
		      END-PERFORM.
			   DISPLAY WS-DETAIL-LINE.
			
			   READ RAINFALLFILE 
			   AT END SET ENDOFFILE TO TRUE
			   END-READ.
	   
	         0300-STOP-RUN.	
			
           STOP RUN.
           
          END PROGRAM TABLES.
