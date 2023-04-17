//COMPLNK   JOB (1234567),'MFB',CLASS=L,MSGCLASS=X,       
//        MSGLEVEL=(1,1),NOTIFY=TRAIN01                   
//*-------------------------------------------------------
//* DECLARATION OF VARIABLES                              
//*-------------------------------------------------------
// SET WSPC=500                                           
// SET MEM=MFPROG1                                        
// SET SRC=ENDV.TEST.SRCLIB                            
// SET LOAD=ENDV.TEST.LOADLIB                          
//*-------------------------------------------------------
//*COMPILE STEP                                           
//*-------------------------------------------------------
//COBSTEP  EXEC PGM=IGYCRCTL,REGION=2048K                 
//SYSPRINT DD SYSOUT=A                                    
//SYSLIN   DD DSN=&LOADSET,DISP=(MOD,PASS),UNIT=SYSDA,    
//            SPACE=(800,(&WSPC,&WSPC))                   
//SYSIN    DD DSN=&SRC(&MEM),DISP=SHR                     
//SYSUT1   DD SPACE=(800,(&WSPC,&WSPC),,,ROUND),UNIT=SYSDA
//SYSUT2   DD SPACE=(800,(&WSPC,&WSPC),,,ROUND),UNIT=SYSDA
//SYSUT3   DD SPACE=(800,(&WSPC,&WSPC),,,ROUND),UNIT=SYSDA
//SYSUT4   DD SPACE=(800,(&WSPC,&WSPC),,,ROUND),UNIT=SYSDA
//SYSUT5   DD SPACE=(800,(&WSPC,&WSPC),,,ROUND),UNIT=SYSDA
//SYSUT6   DD SPACE=(800,(&WSPC,&WSPC),,,ROUND),UNIT=SYSDA
//SYSUT7   DD SPACE=(800,(&WSPC,&WSPC),,,ROUND),UNIT=SYSDA
//*-------------------------------------------------------
//*LINK EDIT STEP                                         
//*-------------------------------------------------
//LKEDSTP  EXEC PGM=IEWL                            
//SYSLIB   DD DSN=CEE.SCEELKED,DISP=SHR             
//SYSLIN   DD DSN=&&LOADSET,DISP=(OLD,DELETE)       
//         DD DDNAME=SYSIN                          
//SYSLMOD DD DSN=&LOAD(&MEM),                       
//        DISP=SHR                                  
//SYSPRINT DD SYSOUT=A                              
//SYSUT1   DD SPACE=(1024,(50,50)),UNIT=SYSDA  