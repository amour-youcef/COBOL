//COMPLNK   JOB (1234567),'MFB',CLASS=L,MSGCLASS=X,       
//        MSGLEVEL=(1,1),NOTIFY=TRAIN01                   
//STEP01 EXEC PGM=MFPROG1                               
//STEPLIB DD DSN=ENDV.TEST.LOADLIB,DISP=SHR          
//SYSOUT DD SYSOUT=A                                    
// 