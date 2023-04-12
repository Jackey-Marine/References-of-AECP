MODULE pp311
    CONST jointtarget jpos11:=[[-3.85367,16.5839,10.7529,-3.04389,73.0483,180.681],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
    PERS robtarget g1:=[[505.75,42.84,221.63],[0.00180267,0.998308,-0.0559077,-0.015889],[-1,-1,1,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
    !??1????
    PERS robtarget g11:=[[422.45,131.13,228.89],[0.0017671,0.99831,-0.0558665,-0.0158864],[-1,-1,1,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
    !??1????
    !    PERS robtarget g2:=[[0,0,0],[1,0,0,0],[0,0,1,0],[0,0,0,0,0,0]];
    !    PERS robtarget g22:=[[0,0,0],[1,0,0,0],[0,0,1,0],[0,0,0,0,0,0]];
    !    PERS robtarget g3:=[[0,0,0],[1,0,0,0],[0,0,1,0],[0,0,0,0,0,0]];
    !    PERS robtarget g33:=[[0,0,0],[1,0,0,0],[0,0,1,0],[0,0,0,0,0,0]];
    var num counter:=1;

    CONST num length:=40;
    !????40mm
    CONST num width:=40;
    !????  40mm
    CONST num height:=40;
    !????17mm




    PROC teacher()
        !for cycle
        MoveAbsJ jpos11,v300,fine,tool0;
        !?????????
        MoveJ Offs(g1,0,0,60),v300,z10,tool0;
        !??????g1 ??60mm?
        FOR i FROM 1 TO 20 DO
            Movel g1,v300,z10,tool0;
            !??????g1 ?????
            Reset dovacoff;
            set dovacon;
            !?
            MoveJ Offs(g1,0,0,60),v300,z10,tool0;
            MoveJ Offs(g11,0,0,60),v300,z10,tool0;
            !??????g11 ??60mm?
            Movel g11,v300,z10,tool0;
            Reset dovacon;
            Set dovacoff;
            !?
            MoveJ Offs(g11,0,0,60),v300,z10,tool0;
            counter:=counter+1;

            IF counter<=5 THEN
                !??? 4?
                g1:=Offs(g1,0,40,0);
                !g1????,???g1??y????40mm
                g11:=Offs(g11,0,41,0);
                !g11????,???g11??y????41mm
                MoveJ Offs(g1,0,0,60),v300,z10,tool0;

            ELSEIF counter>5 THEN
                !??? 4?
                g1:=Offs(g1,40,-40*4,0);
                !g1????,???g1??x????40mm
                g11:=Offs(g11,41,-40*4,0);
                !g11????,???g11??x????41mm
                MoveJ Offs(g1,0,0,60),v300,z10,tool0;
                counter:=1;

            ELSE
            ENDIF
        ENDFOR
    ENDPROC
ENDMODULE