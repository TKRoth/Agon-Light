   10 REM *****************************
   20 REM **                         **
   30 REM **      Digitak clock      **
   40 REM **                         **
   50 REM 99            by           **
   60 REM **                         **
   70 REM **  Thomas Krueger-Reimer  **
   80 REM **                         **
   90 REM *****************************
  100 :
  110 REM **************
  120 REM * Initialize *
  130 REM **************
  140 REM
  150 DIM LIN%(9,8),SEG$(4),TAG$(6,1)
  160 RD$=CHR$(17)+CHR$(128)+" ":SD$=CHR$(17)+CHR$(138)+" "
  170 FOR L%=0 TO 4
  180   READ S$:SEG$(L%)=EVAL(S$)
  190 NEXT
  200 FOR Z%=0 TO 9
  210   FOR L%=0 TO 8
  220     READ LIN%(Z%,L%)
  230   NEXT:NEXT
  240 FOR Z%=0 TO 6
  250   FOR L%=0 TO 1
  260     READ TAG$(Z%,L%)
  270   NEXT:NEXT
  280 :
  290 REM ************
  300 REM * Get time *
  310 REM ************
  320 REM
  330 MODE 2:CLS
  340 COLOUR 10:INPUT "Set time  ",S$
  350 IF S$="N" OR S$="n" THEN 520
  360 CLS
  370 COLOUR 9:PRINT "Year   : ";
  380 COLOUR 10:INPUT "",Y%
  390 COLOUR 9:PRINT "Month  : ";
  400 COLOUR 10:INPUT "",M%
  410 COLOUR 9:PRINT "Day    : ";
  420 COLOUR 10:INPUT "",D%
  430 PRINT
  440 COLOUR 9:PRINT "Hour   : ";
  450 COLOUR 10:INPUT "",HZ%
  460 COLOUR 9:PRINT "Minute : ";
  470 COLOUR 10:INPUT "",MZ%
  480 COLOUR 9:PRINT "Second : ";
  490 COLOUR 10:INPUT "",SZ%
  500 Y%=Y%-1980
  510 VDU 23,0,&87,1,Y%,M%,D%,HZ%,MZ%,SZ%
  520 :
  530 REM ***************
  540 REM * Output loop *
  550 REM ***************
  560 REM
  570 CLS:REPEAT:COLOUR 10
  580   S$=TIME$
  590   HZ%=VAL(MID$(S$,17,1))
  600   HE%=VAL(MID$(S$,18,1))
  610   MZ%=VAL(MID$(S$,20,1))
  620   ME%=VAL(MID$(S$,21,1))
  630   SZ%=VAL(MID$(S$,23,1))
  640   SE%=VAL(MID$(S$,24,1))
  650   FOR L%=0 TO 8
  660     PRINT TAB(1,L%+10);
  670     PRINT SEG$(LIN%(HZ%,L%));:COLOUR 128:PRINT " ";
  680     PRINT SEG$(LIN%(HE%,L%));:COLOUR 128:PRINT " ";
  690     IF L%=2 OR L%=6 THEN PRINT SD$;RD$; ELSE PRINT "  ";
  700     PRINT SEG$(LIN%(MZ%,L%));:COLOUR 128:PRINT " ";
  710     PRINT SEG$(LIN%(ME%,L%));:COLOUR 128:PRINT " ";
  720     IF L%=2 OR L%=6 THEN PRINT SD$;RD$; ELSE PRINT "  ";
  730     PRINT SEG$(LIN%(SZ%,L%));:COLOUR 128:PRINT " ";
  740     PRINT SEG$(LIN%(SE%,L%));:COLOUR 128:PRINT " ";
  750   NEXT
  760   D$=LEFT$(S$,3):FOR L%=0 TO 6
  770     IF D$<>TAG$(L%,0) THEN 790
  780     D$=TAG$(L%,1)
  790   NEXT:D$=D$+", "
  800   D$=D$+MID$(S$,6,2)+"/"
  810   D$=D$+MID$(S$,9,2)+"/"
  820   D$=D$+MID$(S$,12,4)
  830   D$="     "+D$+"     "
  840   PRINT TAB((40-LEN(D$))/2,29);
  850   COLOUR 9:PRINT D$;
  860 UNTIL FALSE
  870 :
  880 REM ********************
  890 REM * Data for display *
  900 REM ********************
  910 REM
  920 DATA RD$+RD$+RD$+RD$+RD$
  930 DATA RD$+RD$+RD$+RD$+SD$
  940 DATA SD$+RD$+RD$+RD$+RD$
  950 DATA SD$+RD$+RD$+RD$+SD$
  960 DATA RD$+SD$+SD$+SD$+RD$
  970 :
  980 DATA 4,3,3,3,0,3,3,3,4
  990 DATA 0,1,1,1,0,1,1,1,0
 1000 DATA 4,1,1,1,4,2,2,2,4
 1010 DATA 4,1,1,1,4,1,1,1,4
 1020 DATA 0,3,3,3,4,1,1,1,0
 1030 DATA 4,2,2,2,4,1,1,1,4
 1040 DATA 4,2,2,2,4,3,3,3,4
 1050 DATA 4,1,1,1,0,1,1,1,0
 1060 DATA 4,3,3,3,4,3,3,3,4
 1070 DATA 4,3,3,3,4,1,1,1,4
 1080 :
 1090 DATA Mon,Monday,Tue,Tuesday
 1100 DATA Wed,Wednesday,Thu,Thursday
 1110 DATA Fri,Friday,Sat,Saturday
 1120 DATA Sun,Sunday
