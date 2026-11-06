local CF=(function()
local CF={}
CF[1]={name="Rounded",big={h=82,w=[=[fW``ebc_ecD]=],c={71,23,69,75,59,60,82,53,95,80,25},r=[=[@$-$<%5$9&;$8'=$6(A$5)C$4*E$3+G$2,I$1-K$0.L$0/M$/04$I05$.14$K13$.22$L23$M32$-32%-51$N42%,62$O61$O72$,71%P81%Q:0$+91&+<0$Q;1'R?0$*=1'*A0%R@1+SH0,)C16*V0%RQ1*RX0%*X1'+\0$QZ1&Q]0$+]1&P^1&,`1%,b2$Oa1%-c1$Nc1$-d2$Md2$.e2$Le2$.f3$Kf3$/g4$Ig4$/hN$0iL$1jJ$2kI$2lH$3mF$4nD$6o@$7p>$9q:$;r6$?s/$>$)$<%-$:&0$8'3$6(5$4)7$2*:$0+<$.,>$--?$,.@$+/A%*1B%*33$+40$+5.$,6+$.7($;31_<o/%=q-$>r+$?s)$;$.$7%6$5&:$3'>$1(A$0)D$.*G$-+I$,,J$+-L$*.N%)06$D05$)14$G12$)22$H22$)31$I31$*4/$J40$*5.$+6,$-7($K50&L8/,KA/%JC0$JD/$IE0%HG0$GH1$FI1%EK1$DL2$CM2$BN2$AO3$@P3$?Q3$>R3$=S3$<T3$;U4$:V4$9W4$8X4$7Y4$6Z4$5[4$4\4$3]4$2^4$1_4$0`4$/a4$.b4$-c4$,d4$+e4$*f5$)gQ$)hS$(iU&(lV%)nT%*pR$+qP$-rM$:$/$6%7$3&<$1'@$0(C$.)F$-*H$,+J$+,L$*-N$*.O%*04$C07$*11$F14$*2/$H23$+3-$I32$,4*$.5&$J41%K60*K=/$J>0%I@0$HA1$FB2$DC4$>D9$9E=$7F=$7G<$6H;$6I9$6J<$6K>$6L@$7M@$7NA$9O@$>P<$DQ7$GR5$IS3$JT3$KU2$LV1$MW1&NZ0(M_1%La2$*b)$Lb1$)c,$Kc2$(d.$Jd3$(e0$Ie3$'f3$Gf5$'g6$Dg7$'hT$'iS$(jQ%)lO$*mL$,nI$-oG$/pC$1q?$4r9$9s0$L$)$K%+$J&-$I'/$H(1$G)2%F+3$E,4%D.5$C/6%B17$A28%@49$?5:%>7;$=8<$=9/$<:/$;;0$;</$:=/$9>0$9?/$8@0$7A0$7B/$6C0$5D0$5E/$4F0$3G0%2I0$1J0%0L0$/M0%.O0$-P1$-Q0$,R0$+S1$+T0$*U0$)V1$)W0$(X1$J9/C(Y0$IY7$'Z[$'[\%']]((b[$)cY$+dV$Ie0.Jp/$Jq.$Kr,$Ms)$2%E$0&I$/'K$.(M$-)N(-.M$,/M$,0L$,10',5/*+<0'>A0$;B6$+@/'9C:$+DJ$+EK$+FL$+GN%+IO$+JP$+KQ$+L3$FL6$,M0$IM4$-N-$JN3$.O*$KO3$LP2$MQ2%NS1&OV1*O]0$N^1&.a%$Ma2$+b*$*c-$Lb2%)d/$Kd3$)e1$Ie4$)f3$Gf6$)g6$Dg8$)hR%*jP$*kO$+lM$,mK$.nH$/oF$1pB$3q>$6r8$:s0$D$($C%+$B&-$A'/$@(0%?*1$>+2%=-2%</2$;02%:22$932%852$861$772$682$691$5:2$4;2%3=2$3>1$2?2$1@2$1A1$AA-$0BB$0CD$/DG$/EH$.FK$.GL$-HN$-IO$,JQ$,KR$+L9$FL8$+M6$JM5$+N4$LN3$*O4$MO3$*P3$NP2$*Q2$OQ2$)R2%PR1%PT2$)T1&(W1))]0$QU1.)^1&P`2$)a2$Pa1$*b1$Ob2$*c2$Nc3$*d3$Md3$+e3$Le4$+f5$Kf4$,g6$Hg7$,hR$-iP$.jO$/kM$0lK$1mI$2nF$3oD$5p@$7q<$9r8$=s0$+%M$*&Q$)'S$((U$')V'(-U%)/T$*0R$M1/$L20$L3/$K40$K5/$J60%J8/$I90$I:/$H;0%G=0%F?0&EB0%DD0%CF1$CG0%BI0%AK0%@M1$@N0$?O1$?P0%>R1$>S0$=T1$=U0$<V1%;X1%;Z0$:[1%9]1%8_1&7b1%6d1%5f2$5g1$4h2$4i1%3k2$3l1%3n0%3p/$4q.$5r,$7s($>$/$:%7$7&<$5'@$4(C$3)E$1*H$0+K$/,L$/-M$..8$E.8$-/4$I/4$-03$K03$-12$L12$,22$M22$,31%N31%,50$O50$+61'O61(,:0'O;0&,>1$N>1$-?0$N?0$-@1$M@1$.A1$LA1$.B2$KB2$/C3$IC3$0D6$DD7$1EI$2FG$3GE$5HA$6I?$4JC$2KF$1LI$0MK$/NM$.O6$FO7$-P4$JP4$,Q3$LQ3$,R2$MR2$+S2$NS2$+T1$OT1$*U1%PU1%QW0$)W1()\0$)]1(QX1-Pb2$)b2%Pc1$*d2$Od2$*e3$Ne3$+f3$Mf3$+g4$Lg4$,h6$Jh5$,iS$-jQ$.kO$/lM$0mK$1nI$2oG$4pC$6q?$9r9$=s1$=$/$9%7$6&<$4'@$3(C$1)F$0*I$/+K$.,M$--O$,.P$+/R$+07$G07$*15$J14$)24$K24$)33$L33$)42$M43$N52$(52%O61%(71%'92$':1+P81.OC2$(B1&OD1$(E2$(F3$NE2%)G2$MG3$)H3$LH3$*I4$KI4$*J5$IJ6$+K7$FK8$,LR$,MQ$-NP$.ON$/PM$0QK$2RI$3SG$5TE$8UA$;V.$GV2$GW1$FX1$EY2$EZ1$D[2$C\2$C]1$B^2$A_2%@a2$?b2%>d2$=e3$=f2$<g2%;i2$:j2%9l2$9m1%9o0$:p.%;r,$=s($0.)$./-$-0/$,11$,22$+33$+44)+:3$,;2$-<0$.=.$/>,$2?&$0S*$.T-$-U/$,V1$,W2$+X3$+Y4)+_3$,`2$-a0$.b.$/c+$]=]},sm={h=26,w=[=[8366767677-]=],c={25,8,21,22,18,21,28,16,31,25,8},r=[=[*$*$)%,$(&.$''0$&(($0('$0)($&)'%%+($1*'%1,(%2.'(13($%,',%5($&6'$14'&&7($07($'8($/8($'90$(:.$);+$,<%$*$'$(%)$'&+$%'-%&)&$*)(5+;&$,<$$)$)$'%-$&&/$%'1$%('$.(($%)&$/)'$0*&%/,'&./'$-0($,1($+2($*3($)4($(5($'6($&7($%8)$%92&)$)$'%-$&&/$%'1$%('$.(($/)''--($).+$)/*$)0,$*1,$/2($03''%7&$/7($$8)$.8)$$92$%:0$';,$*<&$/$&$.%(%-')$,(*%+*+$*+'$*,&$)-'$(.'%'0'$&1'%%3'$/+',$44$$55%%73$/8''0<$$'$.$&%0&&('&&+&%%-'$*-*$%.0$%/1$&0'$.0)$'1$$/1($02((%7&$/7($%8($.8)$%91$&:/$';-$+<%$-$%$,%'$+&($+''$*(($))($)*'$(+($(,'$'--$&.0$&/1$%0*$.0)$%1($01($12'%14(%%2'(16'$%7($07($&8($/8)$&91$':/$);+$,<%$%$1$$%3%%'2$0(&$/)'%.+'%
CF[2]={name="Serif",big={h=79,w=[=[lVdciee`jeB]=],c={75,26,66,81,41,68,82,49,101,82,26},r=[=[A$0$>%6$;&;$9'?$8(B$6)E$5*2$J*2$4+2$L+2$3,2$L,3$2-3$M-2$1.3$N.2$0/4$N/3$003$N04$O13$/14%O24$.34$O35$P44$-45&P55%P76$,75%Q85%+96'Q:6'Q>7%*=6'R@6&RC72)A75RR6&*S6'QU7%*W7$+X6&QW6'Q[5$P\6$,[5&-^5%P]5&P`4$.`4%Oa5$Ob4$/b4%Oc3$0d3$Nd4$1e3$Ne3$2f2$Mf3$2g3$Mg2$3h2$Lh2$4i2$Ki2$6j2$Jj2$7kD$8lB$:m>$<n:$>o5$Bp-$B%($@&*$>',$<(.$:)0$8*2$6+4$4,6$2-8$0.:$./<$,0>$*1@$(2B%(4&$149$258$367S2f8%2h9$1i:$0j<$/k?$,lD$*mI%*oH$<$/$9%6$6&;$5'>$3(B$2)D$1*F$0+H$/,J$.-L$-.M$,/O$,0P$+1Q$+2,$;2A$*3*$>3?$*4($?4>$*5'$A5<$)6'$*7%$B6;%+8$$C8:$D99$D::%E<8)EB7&EE6%DG6%DI5$CJ5%BL5$BM4$AN4$@O4$@P3$?Q3$>R3$=S3$<T2$;U2$:V1$9W1$8X0$7Y0$6Z/$5[.$Z[&$3\.$Y\'$2]-$X]($1^,$V^*$/_,$S_-$.`Q$,aS$+bT$)cV%)eU))kT(>$-$9%6$6&<$4'@$2(C$1)F$0*H$/+J$.,L$
CF[3]={name="Bold",big={h=81,w=[=[fW``ebc_ecD]=],c={71,24,71,75,50,59,82,48,90,79,25},r=[=[@#-$<$5$9%;$8&=$6'A$5(C$4)E$3*G$2+I$1,K$0-L$0.M$//4$I/5$.04$K03$.12$L13$M22$-22%-41$N32%,52$O51$O62$,61%P71%Q90$+81&+;0$Q:1'R>0$*<1'*@0%R?1+SG0,)B16*U0%RP1*RW0%*W1'+[0$QY1&Q\0$+\1&P]1&,_1%,a2$O`1%-b1$Nb1$-c2$Mc2$.d2$Ld2$.e3$Ke3$/f4$If4$/gN$0hL$1iJ$2jI$2kH$3lF$4mD$6n@$7o>$9p:$;q6$?r/$?$+$=%.$;&1$9'3$7(5$5)7$3*9$2+:$0,<$.->$,.@$+/A%*1B%*33$*42$*50$*6.$*7,$*8*$*9($*:'$;31`;p0$<q.$;#.$7$6$5%;$3&?$1'B$0(E$/)G$.*I$-+K$,,L$+-N$+.O$*/6$C/7$)04$F05$)12$H13$)21$I22$*3/$J32$+4-$-5*$K41%/6'$17$$L60%L81&M;0$L<0(KA1$KB0$JC1%IE1%HG1$GH2$FI2%EK2$DL2$CM3$BN3$AO3$@P3$?Q4$>R4$=S4$<T4$<U3$;V3$:W3$9X3$8Y3$7Z3$6[4$5\4$4]4$3^4$2_4$1`4$0a4$/b4$.c4$-d4$,e4$+fQ%*hS$)iT%(kU((pT$)qR$:#/$6$7$3%=$2&?$0'C$.(F$-)I$,*K$++L$*,N$)-P%)/4$C/7$)02$F04$*1/$H13$+2-$I22$,3+$-4)$J31%/5%$K50*K</$J=0%I?0$H@1$GA1$EB2$AC6$6D@$6E>$6F=$6G;$6H9$6I<$6J>$6K@$6LA$6MB$6NC$BO8$FP5$HQ4$JR2$KS2$LT1%MV1'NZ0%M\1'L`2$,a'$La1$+b)$Kb2$*c,$Jc3$)d.$Id3$(e1$Ge5$(f4$Df7$'gT$'hS$(iQ%)kO$*lM$,mI$-nG$/oC$1p?$4q:$8r1$L$,$K%.$J&/$I'0%H)1$G*2%F,3$E-4%D/5$C06%B27$A38%@59$?6:%>8;$=9/%<;/$<<.$;=/$:>/$:?.$9@/$8A/%7C/$6D/%5F/$4G0$4H/$3I/$2J0$2K/$1L0$0M0$0N/$/O0$.P0$.Q/$-R0$,S0%+U0$*V0%J9/B)X1$IX9$(YZ$(Z[$'[\+'c[$Id00Jq.$/$K$-%N,,.O$,/N$,00',4/*+;0(>@0$;A6$9B:$+@/'8C=$+DK$+EL$+FN$+GO%*IQ$*JR$*K4$FK7$+L1$IL4$,M.$JM4$.N+$KN3$2O%$LO2$MP2%NR1%OT0$OU1*O\0$N]1&/`%$M`2$.a'$-b*$La2%,c,$Kc3$+d/$Id4$*e2$Ge6$)f6$Df8$)gS$)hR$)iQ$*jO$+kM$,lK$.mH$0nE$1oB$3p>$6q8$:r1$C$/$A%1$@&2$?'3$?(2$>)2%=+2$<,2%;.2$;/1$:02$912$921$832$841$751$662$671$581%4:1$3;2$3<1$2=1$1>2$1?1$A@/$0@1%?A5$/BG$/CH$.DK$-EM$-FN$-GO$,HQ$,IR$+J9$GJ7$+K6$JK5$*L5$LL4$*M4$MM3$*N3$NN2$*O2$OO2$)P2%PP1%)R1&)U0$QR1)RX0%(V1))\1&QZ1(P_2$)_2%P`1$Oa2$*a2%Nb3$*c3$Nc2$+d3$Ld4$+e5$Ke4$,f7$Hf7$-gQ%.iO$/jM$0kK$1lI$2mG$4nC$5oA$7p=$:q7$=r1$)$S$'%W+'-V%(/T$M0/$L10$L2/$K30$K4/$J50%I70%I9/$H:0%G<0%F>0%F@/$EA0%DC0%CE0%BG1$BH0%AJ0%@L1$@M0$?N1$?O0%>Q1$>R0$=S1$=T0$<U1%;W1%;Y0$:Z1$:[0$9\1%8^1%7`1&6c1%5e1%4g2$4h1%3j1%2l2$2m1$1n2$1o1%1q/$>#/$:$7$8%<$6&@$4'C$3(F$1)I$0*K$0+L$/,M$.-7$F-7$..3$J.4$-/3$K/3$-02$,12$M02%,21%N21%O41*,40,O;0%,=1$N=1$->0$N>0$-?1$M?1$.@1$L@1$.A2$KA2$/B3$IB3$0C6$EC6$1DI$2EG$3FE$5GA$6H?$4IC$3JF$1KI$0LK$/MN$.N6$GN6$-O4$JO4$,P3$LP3$,Q2$NQ2$+R2$OR1$+S1$OS2$*T1%PT1%*V0$QV1(R[0$)W1-Q\1()a2$*b1$Pa2%*c2$*d3$Oc2%+e3$Ne3$+f4$Lf4$,g5$Jg6$,hS$-iQ$.jO$/kN$0lK$1mI$2nG$4oC$6p?$9q9$=r1$=#/$9$6$6%<$4&@$2'D$1(F$0)H$/*K$.+M$-,N$,-P$+.R$+/7$G/7$*05$I05$*13$K14$)23$L23$)32$M33$N42$(42%O51%(61%'82$'91,P71/(B1%OC1%(D2%NE2$)F2$MF3$)G3$MG2$*H3$KH4$*I4$JI5$+J6$HJ6$+KS$,LR$-MP$.NO$/OM$0PL$1QJ$3RH$5SE$7T3$IT1$;U+$HU1$GV1%FX1$EY2$EZ1$D[1%C]1$B^2$B_1$A`1$@a2$@b1$?c2$>d2$>e1$=f2$=g1$<h2$;i2%:k2$9l2%8n2%7p2$8q/$0-)$..-$-//$,01$,12$+23$+34)+93$,:2$-;0$.<.$/=,$2>&$0R*$.S-$-T/$,U1$,V2$+W3$+X4)+^3$,_2$-`0$.a.$/b+$]=]},sm={h=26,w=[=[8366767677-]=],c={25,8,21,23,17,23,28,15,30,27,8},r=[=[*$*$)%,$(&.$''0$&(($0('$0)($&)'%%+($1*'%1,(%2.'(13($%,',%5($&6'$14'&&7($07($'8($/8($'90$(:.$);+$,<%$+$&$)%)$(&*$&',$%(-$%)'$%*&$*)(6)$)$'%-$&&/$%'1$%('$.(($&)%$/)($0*'&/-'%./($-0($,1($+2)$*3)$*4($)5($(6($'7($&8)$%92&)$)$'%-$&&/$%'1$%('$.(($&)%$/)''.-'$).+$)/*$)0,$)1-$/2($03''%7&$/7($%8'$.8)$$92$%:0$';-$+<%$0$%$/%'$.&($-')%,)*$+*+$++&$*,'$)-'%(/'$'0'%&2'$%3'$/+',%43$$55&/8'''$/$&%0&&('&&+&%%-'$*-*$%.0$%/1$%0($.0)$'1$$/1($02(%14'$05(%&7%$/7($%8($.8)$%91$&:/$(;,$+<%$-$&$,%'$+&($*'($*('$))($)*'$(+'$',($'
CF[4]={name="Slab",big={h=78,w=[=[hWbcgee`geB]=],c={65,16,70,85,41,59,79,45,90,79,26},r=[=[?$0$;%8$9&<$7'@$6(B$4)F$3*H$2+J$1,L%0.N$//P$/06$H07$.16$J16$.25$K25$-35$L35$-44$M44$,55$M55$,64%N64%N85$+84&*;5$O94&O<5$*<4(P=4(PB5$QC43)A46PS5$)T5$PT4(*U4(+Z4&OY4'N]4%,]4&M_5$-`4$M`4$-a5$La5$.b5$Kb5$.c6$Jc6$/d7$Hd7$/eP$0fN$1gL%2iJ$3jH$4kF$6lB$7m@$9n<$<o6$@p.$:%/$7&2$5'4$3(6$1)8$/*:$-+<$*,?+*4-$*5*$*6($*7&$*8$$544S*dJ.*oI$<$/$9%6$6&;$4'?$3(A$1)D$0*G$/+H$.,J$
CF[5]={name="Inline",big={h=81,w=[=[fW``ebc_ecA]=],c={136,33,123,132,97,100,165,86,179,161,37},r=[=[@#-$<$5$9%:$8&=$6'A$5(-$K(-$4)+$N)+$3**$P**$2+*$@+-$Q+*$1,)$=,3$S,)$0-)$;-7$T-($0.($:.9$T.)$//)$9/;$U/)$.0)$80*$J0+$V0($71*$L1)$V1)$.1(%62)$M2)$W2($63($N3)$W3)$-3(%54)$O4($55($X4(%,5(%P5(%,7'$46(&Y6(&Q7(&Z9'$+8(&39(%R:'$+;'$3;'$Z:(&R;(&S>'$[='%*<('2<('*@'%2@'%S?()[?(*\F'-TE'/)B(61B(6[P()*U'%2U'%SQ()SW'$[V'&*W('2W('RX(&+['$R['$ZY(&Z\'$3[(&Q\(%+\(&Y](%4^(%P^(%Y_'$4`)$O`)$,_(&5a($Oa($X`(%5b)$Nb)$-b(%6c)$Mc)$Wb(%7d)$Ld)$.d(%7e+$Je+$Vd(%/f($8f.$Ff.$Uf($/g)$9g:$Tg)$0h)$;h6$Sh)$1i)$<i4$Ri)$1j*$?j.$Qj*$2k*$Pk*$3l+$Nl+$4m-$Km-$6nA$7o>$9p:$;q6$?r/$@$$$D$'$>%&$<&($:'*$8(,$6).$5*/$3+1$1,,$/-,$-.,$<,(&+/,$;/)$+0+$90+$+1)$71-$+2'$52/$+3%$331$14,$/5,$-6,$,7+$+8*$+9)$+:'$+;%$<4(aD%(p;#.$7$6$4%;$2&?$0'B$/(.$G(-$.),$J)+$,*,$K*+$+++$;+-$M+)$*,*$8,3$N,)$)-*$6-7$O-)$).)$4.:$P.($(/)$3/<$)0'$20+$F0*$Q/(%*1%$11*$H1)$02*$I2)$R1(%/3)$S3'$.4)$J3(%.5($/6&$07$$K5('L9'$K:((S4(.K?'$S?'$J@(%R@(&IB(%HD(%QC(&GF($FG)$PF(%FH($OH($EI($NI)$DJ)$NJ($CK)$MK)$LL)$BL)%LM($AN)$KN)$@O)$JO)$?P)$IP)$>Q)$=R)$HQ)%<S*$GS)$;T*$FT)$:U*$EU)$:V)$DV)$9W)$CW)$8X)$BX*$7Y)$BY)$6Z)$AZ)$5[)$@[)$4\)$?\)$3])$>])$2^)$=^)$1_*$<_)$0`*$;`)$/a*$:a)$.b*$9b*$-c*$8c*$,d*$7d*$+e*$6eE$*f*$)g*$5fF%(h*$4hG$(i)$3iH$(j(&(mS(;#/$7$6$4%<$2&@$0'C$.(/$H(,$-),$J)+$,*+$L**$*++$;+.$N+)$*,*$8,4$O,)$*-($6-8$P-)$+.&$4.;$,/$$2/>$Q.(%10,$G0*$/1,$I1)$R0(%.2+$S2'$.3*$J2(%/4'$05%$K4(*S3(+S;'$J;(%I=)$H>)$R<(&G?)$E@+$Q?(%DA+$PA($AB-$OB)$:C2$NC)$5D6$MD*$5E5$LE*$5F7$KF*$5G?$9H:$BI1$FJ/$IK-$5L.$LL+$5M3$NM*$5N6$ON*$5O9$PO*$:P5$RP($BQ/$RQ)$FR,$SR)$HS+$JT*$TS(%KU)$LV)$MW($UU(&NX'$NY((N^'$VX'*-_%$,`&$M_(%,a'$La)$U_(&+b*$Kb)$Ub'$,c*$Jc)$-d+$Id*$Tc(%.e,$Fe,$Se($(f%$/f1$Af0$Rf)$'g($0g?$Qg)$'h)$2h<$Ph)$'i*$4i8$Oi*$(j*$8j0$Nj*$)k+$Lk+$*l,$Jl,$+m.$Gm.$-nF$/oC$1p>$3q:$7r2$K$&%J&'$I'(%H))$G**%F,+$E-,%D/-$C0.$C1($B2)$A3)$A4($@5)$?6)$I1()?7($>8)$H7)%=9)$G9*$=:($<;)$F:+%;<)$E<,$;=($:>)$D=-%9?)$C?($9@($B@)$8A)$BA($8B($AB($7C($@C)$6D)$@D($6E($?E)$5F($>F)$4G)$>G($4H($=H)$3I($<I)$2J)$<J($2K($;K)$1L($:L)$0M)$:M($0N($9N)$/O($8O)$.P)$8P($.Q($7Q)$-R($6R)$,S)$6S($,T($5T)$+U)$4U)$*V)$4V($*W($3W)$I?(<Q$(W)X)$(Y)$2X?%(Z($1Z@$'[)$0[A$QX2''\($']'&I\('Q\(''`J'Q`2'Id(1Qd(1/$K$/%L&.(L$.)(*6,E'60D$61'&.0'(54(+-5(+5<''=?-$5@9$-='(4A=$4B?$4CA$4D*$ID-$LE,$NF+$4E(&>G,$PG*$4H9$QH)$,B(+4I<$RI)$4J=$SJ)$4K?$TK($,J'&4L+$HL,$-M&$3M($JM*$UL(%/N$$3N&$LN)$3O$$MO)$VN(%WP'$NP(%WQ(&OR(&PU'&PX($PY'&XT'+O\(&/_$$W\('.`&$N_(%.a'$Ma($-b)$Lb)$V`(&-c+$Kc)$Uc($.d,$Jd)$Td)$0e,$Ge,$Te($*f%$1f1$Bf0$Sf)$*g&$3g=$Rg)$)h($4h;$Qh)$(i+$7i6$Pi*$)j+$:j0$Oj*$*k,$Mk+$,l,$Kl,$-m.$Hm.$/nE$1oB$3p>$6q8$:r0$A$'$J$($@%($I%($?&)$H&)$?'($H'($>()$G()$>)($G)($F*)$=*(%F+($<,($;-)$E,(%;.($D.($:/)$C/)$:0($C0($91)$B1)$92($B2($83)$A3)$84($A4($75(%@5(%67($?7($58)$>8)$59($>9($4:)$=:)$4;($=;($3<)$<<)$3=($<=($2>)$;>)$2?($;?.$1@)$:@5$1A($:A8$0B($9B;$/C)$8C>$/D($8D*$ID/$.E)$7E)$ME,$.F($7F($OF+$-G)$6G)$AG)$QG*$-H($6H($<H2$RH*$,I)$5I<$TI)$5J>$UJ)$,J(%4K@$VK($4L.$IL,$VL)$+L(%3M,$LM*$WM($+N'$3N+$MN*$3O)$NO)$XN(%*O(%2P)$OP)$YP'$*Q'$PQ($2Q(%YQ(%QR(%RT'$ZS'%1S(')R())X'%1W''RU(,ZU(,)Z((1[('Z^'$*_'$Q^(%2_(%P`)$3a($Pa($Y_(&*`(&3b)$Ob)$4c)$Nc)$Xb(%+c(%4d*$Ld*$,e($5e,$Je+$Wd(%,f)$6f0$Ef/$Vf($-g)$7g<$Ug)$.h)$9h9$Th)$.i*$;i5$Si)$/j*$>j/$Rj*$0k+$Pk+$1l,$Nl,$2m.$Km-$4nC$5o@$7p<$:q7$>r/$'$W'',W$'-V%'/U$L0($L1'$T0(%K2(%S2(%S4'$J4(%R5($J6'$R6'$I7($I8'$Q7(%Q9'$H9(%P:($P;'$G;(%G='$O<(%F>(%N>(%N@'$E@(%MA(%DB(%DD'$LC(%LE'$CE(%KF(%BG(%JH(%AI(%@K)$IJ(&@L(%HM(%?N(%>P(%GO(&=R)$FR(%=S(%ET(%<U(%EV'$;W)$;X($DW(%:Y)$CY(%:Z(%9\(%B[(&8^)$8_($A^(%7`)$7a(%@`(&6c)$6d($?c(%5e)$5f($>e(%4g)$=g)$4h($=h(%3i)%3k($<j(%2l)$;l)$2m($;m(%1n)%:o(%0p)%9q($>#/$:$7$7%=$5&A$4'C$2(.$K(.$1),$N),$0*+$P*+$0+)$>+/$R+*$/,)$;,5$S,)$.-)$:-7$T-)$..($8.;$U.)$7/=$-/(%60+$J0+$V/(%61)$L1)$52)$M2)$W1(%,1(&53($N3($X3'%X5(',4')44(*O4(*X9'%5;'$O;'$,:(&5<($N<($W;(%6=($M=($-=(%6>)$L>)$V=(%-?)$7?)$J?*$U?)$.@)$8@*$I@*$T@)$/A($9A+$GA+$TA($/B)$;B5$RB*$0C*$=C1$QC*$1D*$?D-$PD*$2E+$AE-$NE+$4F+$DF3$5G,$FG0$6H-$IH,$4I2$KI,$2J+$<J-$NJ+$1K+$>K-$OK+$0L*$>L0$QL*$/M)$;M5$SM)$.N)$:N,$EN,$TN)$-O)$8O,$HO+$UO)$,P)$7P+$JP*$VP)$,Q($6Q*$KQ*$WQ($5R)$MR)$+R(%4S)$NS)$XR(%4T($OT($*T(%YT(%*V'$3U(%PU(%QW(&ZV(')W(')['&RZ''[Z'(2W(-Q^(&)^('3a($Pa($Z_(&3b)$Ob)$Zb'$4c)$Nc)$*b(&4d*$Md*$Yc(%+e($5e+$Ke+$Xe($+f)$6f-$Hf-$Wf)$,g)$7g=$-h)$8h;$Vg)%-i*$:i7$Ti*$.j*$<j3$Sj*$/k+$Ak)$Qk+$0l,$Ol,$1m.$Lm.$3nE$4oC$7p>$9q9$=r1$<#/$8$7$6%;$4&?$2'C$1(-$I(-$0)+$L),$.*+$N*+$-++$=+.$P+*$-,)$:,4$Q,*$,-)$7-9$R-)$+.)$6.;$S.)$+/($5/>$T/)$40+$H0,$U0($*0(%31*$J1*$U1)$22)$L2)$V2($)2(%13)$M3)$14($N4($05)$W3(&(4(&O5(%X6'$(7'$06(%P7((X7((Y<'$Q<'&'8(-/8(-(B'$P?('X=()0B(%0D)$OC(%XC'%(C(&1E($NE)$1F)$MF)$WE(%)F(%2G*$LG*$WG'$*H($3H*$JH,$*I)$4I,$GI.$VH(%+J($5J@$+K)$6K>$UJ(%,L)$8L<$TL)$-M)$:M3$KM($TM($.N*$>N+$JN)$SN)$/O*$JO($SO($0P,$IP)$RP)$1Q/$HQ)$RQ($3R>$QR)$4S<$QS($6T9$9U6$PT(%>V0$OV($EW)$NW)$EX($NX($DY)$MY)$DZ($MZ($C[)$L[)$C\($L\($B])$K])$B^($K^($A_(%J_(%@a($Ia($?b)$Hb)$?c($Hc($>d)$Gd)$>e($Ge($=f)$Ff)$=g($Fg($Eh)$<h(%Ei($;j(%Dj(%:l($Cl($9m)$Bm)$9n($Bn($8o)$Ao)$8p($Ap($7q($@q($1-%$..+$-/-$,0/$+11$+2)$42($+3($+4'$*5($53('+6(%47($+81$,9/$-:-$.;+$0<'$/T*$-U-$,V/$+W1$+X)$3X)$+Y($4Y($+Z'$*[($+\'$5Z(&+]($4]($+^1$,_/$-`.$.a+$0b'$]=]},sm={h=26,w=[=[8366767677,]=],c={47,11,41,45,39,33,53,34,61,50,11},r=[=[*$*$)%&$/%&$(&%$,&&$1&%$''%$*'*$2'%$&(%$)(%$0(%$3($$))$$1)$$3)%$&)$%(*%$1*%%4*$%%+%%(+$%%-$*'-%*4,%+2,$,%4%%(4$%15%$44$%&6$$(6%$16$$&7%$)7$$07%$36%%'8$$)8&$/8%$'9%$+9($28%%(:%$0:&$);+$,<%$-$$$*%%$(&'$&'&$+'$$&($$)(&$')&$&*%$+)$6-%%:)$)$'%'$-%'$&&%$+&%$0&%$%'%$('*$%($$'(%$.(%$1'%%&)%$/)%'2)$'/-$$..%$1-%%./$$-0%$0/%%,1%$/1%$+2%$.2%$*3%$-3%$)4%$-4$$(5%$,5%$'6%$+6%$&7%$*7%$%8&$)8-$%9%$(9.$%:$$%;1$)$)$'%'$.%&$%&&$+&&$0&%$%'$$('+$1'%$'(%$/($$')$$/)%&2($'.,%$1,%$,-&$1-$$).($0.%$*/*$)0$$/0&$)1)$11%$-2&$22$$/3%$23%$04%%34$%06'$&7%$/7%$27%$'8&$-8&$28$$$9%$(9*$19%$%:&$/:&$';,$*<&$1$$$/$$%.&%$-'&%,)%$/)$$+*%$++$$.*%%*,%$-,&$)-%$,-%$).$$,.$$(/%$+/%$'0%$*0%$'1$$*1$$&2%$)2%$%3%$(3%$/-$*1%%2%4$$(4+$14($'5,$15'$$5%%.6%$16%$$7/$17($/8$'18%''$/%)'-$&&%()($&&+'$(,%$(-,$(.%$/.&$(/*$1/%$&,$((0,$20%$(1$$01%%31$%13$&33%&06%$36$$&7%$07$$'8&$.8&$27%%%9%$)9)$19%$&:&$/:&$';-$+<%$,$$$/$$$.%%$+%%%.&$$*'%$-'%$*($$-($$))%$,)%$)*$$(+%$+*%%(,$$*,%$'-%$*-*$'.$$).%$0.&$&/%$)/*$2/%$&0$$(0,$30$$%1%$(1%$01%$31%$12%%24$$%2$''2%'(6$$15%%42$(%6%%(7%$07%$37%$&8$$)8&$/8%$38$$&9%$*9)$29%$':&$0:&$);,$,<%$$$3$%%2$$'3$/(%%2($%/*$$1*%$.+%$1+$$.,$$0,%$--%$0-$$-.$$/.%%,/%%/0$$,1$$.1%$+2%$.2$$+3$$-3%%*4%%-5$$,6%$)6%%,7$$)8$$(9%$+8%%(:$$';%$*:%%*$*$(%'$/%&$'&%$,&&$1&%$&'%$*'*$2'%$)(%$0(%%1*$$&($'()%&0+%$3(%'&,%$),%$/,%$3,$$'-%$*-)$2-%$(.%$,.&$0.&$(/'$//&$'0&$+0'$10%$&1%$*1&$.1&$21%$&2$$)2%$02%$32%$%3%$(3%$13$$43$%%4$&(4$&14%&45%%(7%$17$$47$$%7%%)8%$/8&$38%$&9%$*9)$29%$':&$1:%$(;-$,<%$)$*$'%'$.%'$&&&$+&&$1&%$&'$$)'*$2'%$%(%$((%$/(%$3($$%)$$')%$0)%$$*%''*$'1*$'%.$$'.%$0.%$3)%)%/%$(/%$//&$3/$$&0%$)0+$20%$'1%$/1%$21$$(2+$12%$*3)$13$$04%$-4%%05$$,6%$/6%$,7$$+8%$.7%%+9$$*:%$-9%%*;$$,;%$'&$$&''$%(%%((%%&*&$&2&$&3'$%4%$(4%$&5'$'6%$]=]}}
CF[6]={name="Arabic",big={h=81,w=[=[ON[b[U^__[E]=],c={25,33,49,52,76,65,35,88,88,62,39},r=[=[5I%$5J'$4K*$4L+$3M.$2N0$2O2$1P4$1Q5$0R7$0S8$/T:%.V;$-W;%-Y:$/Z8$0[6$2\3$3]2$5^/$6_.$8`+$9a)$;b'$<c%$5)$$3*'$1+)$0,+$/-,$...$-//$-00%,22&,53&,84$-93$-:4$.;3%/=2$/>3$0?2%0A3$1B2%2D1$2E2$3F1&4I1&5L0&6O0&7R/(8W.&8Z/&9]-,:f,':j+):p*%>r&$4)&$Q)'$2*($1+*$0,+$/--$Q*)'...$-/0%P.*&,11$O1+%,22%N3,$N4+$M5,$,43&L6-$,74$K7.$-83$J8/$-96$H91$-:K$.;J%/=I$/>H$0?G$0@F$1AE$1BD$2CC$2DB$2EA$3F?$3G>$4H;$4I8$4J1$5K0$5L1%6N0'7R0(8W/)9].,:f,*:m+(>r&$6)$$X)&$4*&$J*&$2+)$1,*$0-,$H+)&X*)'/.-$H.*$.//%I/)&-11%X.*(I2*%-32%,54$W3+&H4+&V6,$-63%G7-$U7-$-84$F8<$-95$E9=$.:S%/<R%0>P&1AN$1BM$2CL$2DK$3E=$PE+$3F<$RF'$4G:$4H9$4I6$5J0$5K1%6M0&7P0(8U/(9Z.):`-,:i,);o*&?r&$D$$$B%'$A&($?'*$=(,$<).$;*/$9+0$8,1$7-2$6.3$5/4$404$315$226$136$046$055$/65$/74$/82$.92$.:0$.;/$-<.$-=,$->+$-?,$,@/$,A1$,B3$,C6$,D9$,E;$,F<$+G=$,H<$,I=$-J<$.K<$/L;$0M:$2N7$3O5$6P2$8Q/$9R-$9S,$8T,$8U+$7V,$6W,$6X+$5Y+%4[+$4\*$3]+$3^*%2`+$2a,$2b-$2c0$Rc&$2dF$2eG%2gF$3hD%4jB$4kA$5l?$6m=$7n<$8o:$:p6$<q3$@r-$</)$:0-$91/$723$734$645$557$469$37:$38;$29<$2:=$1;>$0<?$0=@$/>A%/@.$>@2$.A-$@A1$.B,$BB/$CC.$-C,%-E+$DD-%EF,$,F+%EG-$,H*$+I+$FH,%+J*&GJ+'*M*&*P)&HN*+GV+$GW*$)S*)FX+$)Y+$EY,$)Z,$DZ-$)[-$C[.$)\.$B\/$)]1$?]1$)^G%*`E%*bD$*cC$+dB$+eA$+f@$,g>$-h<$-i;$.j9$0k5$2l2$5m,$*(%$))*$)*/$D*+$)+G%(-I''1I'&5J%'7H$*8E$-9B$2:0$E:*$D;+*CB,)CH-*CO.(CT/$DU.%DW/&DZ0%E\0&E_1%Fa1%Fc2%Ge2&Hh0$Hi/$Hj.$Ik,%Im+$Jn)$Jo($Jp'$Kq%$-)$$+*&$T*%$)+)$S+&$(,*$S,'$'-,$R-)$'.-$R.*$&/.$Q/,$%00%Q0-%%21$P2/$P30$$32%O42%$53%O61$N72$$74%N81$M92$%94&M:1%&<4$L<1$'=3$'>4$L=0%(?3%K?0%KA/$)A3%JB0$*C3%+E2$JC/&+F3$,G2$IF/%,H3$IH.$HI/$-I2%.K2$HJ.%HL-$/L1%GM.$0N1%1P0$GN-&1Q1$FQ-%2R0%2T1$FS,%EU-$3U0%4W0%EV,&EY+$5Y/%DZ,$6[/%7].$D[+&7^/$D^*$7_7$8`6$8a5$9b4%9d3$:e2%:g1$;h0&<k.%=m,$=n+$=o)$>p'$>q%$>r$$C)$$B*%$@+($?,)$=-+$<.-$;/.%;1/$:20%:41$952%973$884$895%7;6$7<7$7=*$?=/$6>+&@>/&5A,$@A0$5B+$AB/$AC0%4C,&3F-$BE0%BG1$3G,%CH0$2I-%CI1%1K.$DK1%1L-%DM2$0N.$EN1$0O-$EO2%/P.%.R/$FQ2%.S.$FS3$GT2$GU3$-T/&HV2$,W/%HW3%+Y0$+Z/$IY3%*[0%J[3%J]4$)]0%K^3$(_1$K_4$'`1%&b2$L`4&&c1$Mc4%%d2%Ne3%$f2%%h0$Og2%&i/$'j.$Pi0%Qk/$(k,%Ql.$)m*$*n)$Rm,%+o'$So*$,p&$Sp)$-q$$Tq&$Tr$$7'($5(-$3)1$2*3$1+5$0,7$/-9$..:$./;$-0<$,1>%+3@%*5A$*6,$863$)7+$:72$)8*$;81$<90$)9)%=:/$(;*&>;.&(>+$(?,$(@.$?>-&(A1$?A.$(BE%)DD&*GC%+IB%,KA$-L@$.M?$0N=$2O<$5P-$@P.$AQ-&AT.&AW/&AZ0&B]0%B_1%Ca1&Cd2$De1$Df2%Eh1$Ei0$Ej/$Fk-$Fl,$Fm+$Gn)$Go($Gp'$Hq%$Hr$$1+$$1,&$0-)$/.+$//-$.0/$.10$-22$-33$,45%+65$*76$+84$-92$/:/$0;-$2<+$3=)$5>&$6?%$1U%$1V&$0W)$/X+$/Y-$.Z/$.[1$-\3%,^5$+_6$+`5%,b3$.c0$/d/$1e,$2f+$4g($5h&$6i%$]=]},sm={h=26,w=[=[1046425554-]=],c={8,12,14,17,21,21,12,22,25,18,12},r=[=[)/$$(0&$(1($'2*$&3+$'4)$(5($*6%$'&&$&''$&((%&*)$'+(%(-'$(.($)/''*3&$*4'%*6&(+;%$(%$$'&&$1%%&&''%&)($0(&%&*/$'+.%(-,$(.+$(/($)0'(*5&(*:%$'%%$&&&$.%%&&''%.(&$3%%'&)($.)*$&*2%',0$'-/$(.*$(/'$(0($)1'(*6&&*9%%-$$$+%&$*&'$)'($(()$'))$'*'$'+%$&,'$&-)$&.+%'0+$)1($*2&$)3&$)4%$(5%%(7.%)9,$):+$+;($*''$)()$()*$(*+$'+,$',&$,,($&-&$--'$&.%%..&%%0&$/0%&%1%&.3&$%4&$-4'$%5.%&7,$&8+$(9($%&-$%'.$$(/$$).$&*,$-+%)-1&'-5'$.6&$.7'&/:%$/;$$1&%$$&&%1'&$0('$0)($#((&0*'$$+(%/+'%/-&$%-(%&/'$..'%&0($.0&%'1'%(3'%-2&&)5)&*8'%+:%$+;$$+&%$*''&)*)%),%$,,'%(-&%,.($'/'$-/'%'0&%-1($&2'$&3&$.2(%%4'%/4(%/6)$$6'%#8($07(%$9&$19'$%:%$1:&$2;$$)%&$(&($''*$&(+$&),$+*'$%*%%%,&$,+&%%--%&/,%(1*$-2&&-5'&-8($.9'$.:&$.;%$'&%$&''$&(($%))$&*'$(+%$'3%$&4'$&5($%6)$'7&$(8%$]=]}}
return CF
end)()
local S=(function()
local S={}
S.W,S.H=480,800
S.KEYS={'imsak','subuh','terbit','dhuha','dzuhur','ashar','maghrib','isya'}
S.IS_WAJIB={false,true,false,false,true,true,true,true}
S.WAJIB_IDX={2,5,6,7,8}
S.LANGS={
id={
code='ID',
app_title='MuslimInk',
labels={'Imsak','Subuh','Terbit','Dhuha','Dzuhur','Ashar','Maghrib','Isya'},
jumat='Jumat',
hari={'Minggu','Senin','Selasa','Rabu','Kamis','Jumat','Sabtu'},
bulan={
'Januari','Februari','Maret','April','Mei','Juni',
'Juli','Agustus','September','Oktober','November','Desember'
},
bulan_short={'Jan','Feb','Mar','Apr','Mei','Jun','Jul','Agu','Sep','Okt','Nov','Des'},
hijri_bulan={
'Muharram','Safar','Rabiul Awal','Rabiul Akhir',
'Jumadil Awal','Jumadil Akhir','Rajab',"Sya'ban",
'Ramadhan','Syawal',"Dzulqa'dah",'Dzulhijjah'
},
next_card='MENUJU WAKTU SHALAT',
next_card_tom='MENUJU SHALAT (BESOK)',
next_badge='Berikutnya',
sec_today='JADWAL HARI INI',
sec_tomorrow='JADWAL BESOK',
now_prayer='Saatnya waktu shalat!',
footer_info='Sumber: Kemenag RI (equran.id) - Offline',
btn_loc='Lokasi',
btn_refresh='Perbarui',
btn_month='Sebulan',
btn_lock_on='Lock: Aktif',
btn_lock_off='Lock: Mati',
btn_hijri='Atur H',
btn_prev='< Seb',
btn_cancel='Batal',
btn_next='Ber >',
btn_back='Kembali',
btn_next_mo='Bln Depan',
btn_this_mo='Bln Ini',
btn_download='Unduh',
btn_done='Selesai',
hijri_title='Koreksi Tanggal Hijriah',
hijri_cur='Koreksi saat ini: ',
hijri_day=' hari',
no_data_title='Jadwal Belum Tersedia',
no_data_l1='Pastikan Wi-Fi menyala, lalu ketuk',
no_data_l2='"Perbarui" atau "Ganti Lokasi" di bawah.',
lock_no_data='Jadwal Bulan Ini Belum Ada',
lock_no_l1='Buka aplikasi Jadwal Sholat & Wi-Fi',
lock_no_l2='untuk memilih lokasi dan unduh jadwal.',
pick_prov='Pilih Provinsi',
pick_kab='Kab/Kota: ',
month_title='Jadwal ',
month_empty_1='Data ',
month_empty_2=' Belum Ada',
month_empty_sub='Ketuk tombol "Unduh" di bawah untuk memuat.',
col_day='Tgl',
col_headers={'Tgl','Imsak','Subuh','Dzuhur','Ashar','Magrib','Isya'},
quotes={
{'Dirikanlah shalat, sesungguhnya shalat','mencegah perbuatan keji dan mungkar.',"QS. Al-'Ankabut: 45"},
{'Sungguh Aku ini Allah, tiada Tuhan selain','Aku, maka sembahlah Aku & dirikan shalat.','QS. Thaha: 14'},
{'Maka sesungguhnya bersama kesulitan','ada kemudahan.','QS. Al-Insyirah: 5'},
{'Ingatlah, hanya dengan mengingat Allah','hati menjadi tenteram.',"QS. Ar-Ra'd: 28"},
{'Jadikanlah sabar dan shalat','sebagai penolongmu.','QS. Al-Baqarah: 45'},
{'Sungguh shalat itu adalah kewajiban yang','ditentukan waktunya bagi orang beriman.','QS. An-Nisa: 103'},
{'Peliharalah semua shalatmu, dan berdirilah','karena Allah dengan khusyuk.','QS. Al-Baqarah: 238'},
{'Amalan yang paling dicintai Allah adalah','shalat tepat pada waktunya.','HR. Bukhari & Muslim'},
{'Allah tidak membebani seseorang melainkan','sesuai dengan kesanggupannya.','QS. Al-Baqarah: 286'},
{'Maka ingatlah kepada-Ku, Aku pun akan','ingat kepadamu. Bersyukurlah kepada-Ku.','QS. Al-Baqarah: 152'},
},
},
en={
code='EN',
app_title='MuslimInk',
labels={'Imsak','Fajr','Sunrise','Dhuha','Dhuhr','Asr','Maghrib','Isha'},
jumat="Jumu'ah",
hari={'Sunday','Monday','Tuesday','Wednesday','Thursday','Friday','Saturday'},
bulan={
'January','February','March','April','May','June',
'July','August','September','October','November','December'
},
bulan_short={'Jan','Feb','Mar','Apr','May','Jun','Jul','Aug','Sep','Oct','Nov','Dec'},
hijri_bulan={
'Muharram','Safar',"Rabi' al-Awwal","Rabi' al-Thani",
'Jumada al-Ula','Jumada al-Thani','Rajab',"Sha'ban",
'Ramadan','Shawwal',"Dhu al-Qi'dah",'Dhu al-Hijjah'
},
next_card='NEXT PRAYER TIME',
next_card_tom='NEXT PRAYER (TOMORROW)',
next_badge='Next',
sec_today="TODAY'S SCHEDULE",
sec_tomorrow="TOMORROW'S SCHEDULE",
now_prayer='Time for prayer!',
footer_info='Source: Kemenag RI (equran.id) - Offline',
btn_loc='Location',
btn_refresh='Refresh',
btn_month='Monthly',
btn_lock_on='Lock: On',
btn_lock_off='Lock: Off',
btn_hijri='Hijri',
btn_prev='< Prev',
btn_cancel='Cancel',
btn_next='Next >',
btn_back='Back',
btn_next_mo='Next Mo',
btn_this_mo='This Mo',
btn_download='Fetch',
btn_done='Done',
hijri_title='Hijri Date Adjustment',
hijri_cur='Current offset: ',
hijri_day=' day(s)',
no_data_title='Schedule Not Downloaded',
no_data_l1='Turn on Wi-Fi, then tap "Refresh"',
no_data_l2='or "Location" below to download.',
lock_no_data='Monthly Schedule Not Found',
lock_no_l1='Open the Prayer Times app with Wi-Fi on',
lock_no_l2='to choose your city and download times.',
pick_prov='Select Province',
pick_kab='City/Regency: ',
month_title='Schedule: ',
month_empty_1='No Data for ',
month_empty_2='',
month_empty_sub='Tap "Fetch" below to download this month.',
col_day='Day',
col_headers={'Day','Imsak','Fajr','Dhuhr','Asr','Magrib','Isha'},
quotes={
{'Establish prayer; indeed, prayer prohibits','immorality and wrongdoing.',"QS. Al-'Ankabut: 45"},
{'Indeed, I am Allah. There is no deity','except Me, so worship Me & pray.','QS. Ta-Ha: 14'},
{'For indeed, with hardship','comes ease.','QS. Ash-Sharh: 5'},
{'Unquestionably, by remembering Allah','hearts are assured.',"QS. Ar-Ra'd: 28"},
{'And seek help through patience','and prayer.','QS. Al-Baqarah: 45'},
{'Indeed, prayer has been decreed upon','the believers at specified times.','QS. An-Nisa: 103'},
{'Maintain with care the obligatory prayers','and stand before Allah devoutly.','QS. Al-Baqarah: 238'},
{'The deed most beloved to Allah is','prayer offered on time.','HR. Bukhari & Muslim'},
{'Allah does not charge a soul except','with that within its capacity.','QS. Al-Baqarah: 286'},
{'So remember Me; I will remember you.','And be grateful to Me.','QS. Al-Baqarah: 152'},
},
},
}
function S.L(cfg)
local code=(cfg and cfg.lang=='en')and 'en' or 'id'
return S.LANGS[code]
end
function S.read(name)
local ok,s=pcall(function()return ctx.storage:read(name)end)
return(ok and type(s)=='string' and #s>0)and s or nil
end
function S.write(name,s)
pcall(function()ctx.storage:write(name,s)end)
end
function S.load_cfg()
local raw=S.read('settings.txt')
local t={}
if raw then
for k,v in raw:gmatch('([%w_]+)=([^\r\n]*)')do t[k]=v end
end
local cf=tonumber(t.cfont)or 1
if cf<1 or cf>6 then cf=1 end
return{
country=(t.country and t.country ~='')and t.country or 'Indonesia',
prov=(t.prov and t.prov ~='')and t.prov or 'DKI Jakarta',
kab=(t.kab and t.kab ~='')and t.kab or 'Kota Jakarta',
lat=tonumber(t.lat)or -6.21,
lon=tonumber(t.lon)or 106.85,
tz=tonumber(t.tz)or 7,
fajr_ang=tonumber(t.fajr_ang)or 20.0,
isha_ang=tonumber(t.isha_ang)or 18.0,
asr_factor=tonumber(t.asr_factor)or 1.0,
isha_fixed_min=tonumber(t.isha_fixed_min)or nil,
method=(t.method and t.method ~='')and t.method or 'Kemenag',
method_id=tonumber(t.method_id)or 3,
adj=tonumber(t.adj)or 0,
lock=(t.lock=='true'),
lang=(t.lang=='en')and 'en' or 'id',
cfont=cf,
qrefresh=(tonumber(t.qrefresh)and tonumber(t.qrefresh)>=1 and tonumber(t.qrefresh)<=4)and tonumber(t.qrefresh)or 1,
maghrib=(t.maghrib ~='false'),
has_saved=(raw ~=nil and t.prov ~=nil and t.prov ~=''),
}
end
function S.save_cfg(cfg)
local s='country=' ..(cfg.country or 'Indonesia')..
'\nprov=' ..(cfg.prov or '')..
'\nkab=' ..(cfg.kab or '')..
'\nlat=' .. tostring(cfg.lat or -6.21)..
'\nlon=' .. tostring(cfg.lon or 106.85)..
'\ntz=' .. tostring(cfg.tz or 7)..
'\nfajr_ang=' .. tostring(cfg.fajr_ang or 20.0)..
'\nisha_ang=' .. tostring(cfg.isha_ang or 18.0)..
'\nasr_factor=' .. tostring(cfg.asr_factor or 1.0)..
'\nisha_fixed_min=' .. tostring(cfg.isha_fixed_min or '')..
'\nmethod=' ..(cfg.method or 'Kemenag')..
'\nmethod_id=' .. tostring(cfg.method_id or 3)..
'\nadj=' .. tostring(cfg.adj or 0)..
'\nlock=' .. tostring(cfg.lock and true or false)..
'\nlang=' ..(cfg.lang=='en' and 'en' or 'id')..
'\ncfont=' .. tostring(cfg.cfont or 1)..
'\nqrefresh=' .. tostring(cfg.qrefresh or 1)..
'\nmaghrib=' .. tostring(cfg.maghrib ~=false)
S.write('settings.txt',s)
end
function S.days(y,m,d)
local yy=m<=2 and(y - 1)or y
local era=yy // 400
local yoe=yy - era*400
local doy=(153*(m+(m>2 and -3 or 9))+2)// 5+d - 1
return era*146097+yoe*365+yoe // 4 - yoe // 100+doy - 719468
end
function S.civil(z)
local zz=z+719468
local era=zz // 146097
local doe=zz - era*146097
local yoe=(doe - doe // 1460+doe // 36524 - doe // 146096)// 365
local doy=doe -(365*yoe+yoe // 4 - yoe // 100)
local mp=(5*doy+2)// 153
local d=doy -(153*mp+2)// 5+1
local m=mp<10 and(mp+3)or(mp - 9)
return yoe+era*400+(m<=2 and 1 or 0),m,d
end
function S.month_len(y,m)
if m==12 then return 31 end
return S.days(y,m+1,1)- S.days(y,m,1)
end
function S.wday(day)
return(day+4)% 7
end
function S.lunation_start_day(k)
local T=k / 1236.85
local jde=2451550.09766+29.530588861*k
+0.00015437*T*T - 0.000000150*T*T*T
local deg2rad=math.pi / 180.0
local M=(2.5534+29.10535670*k - 0.0000014*T*T)*deg2rad
local Mp=(201.5643+385.81693528*k+0.0107582*T*T)*deg2rad
local F=(160.7108+390.67050284*k - 0.0016118*T*T)*deg2rad
local corr=-0.40720*math.sin(Mp)+0.17241*math.sin(M)
+0.01608*math.sin(2*Mp)+0.01039*math.sin(2*F)
+0.00739*math.sin(Mp - M)- 0.00514*math.sin(Mp+M)
+0.00208*math.sin(2*M)- 0.00111*math.sin(Mp - 2*F)
local conj_unix_days=(jde+corr)- 2440587.5
return math.floor(conj_unix_days+2.04)
end
function S.hijri(day,adj,lang_tbl)
local L=lang_tbl or S.LANGS.id
local d=day+(adj or 0)
local k=math.floor((d+2440587.5 - 2451550.09766)/ 29.530588861)
while S.lunation_start_day(k+1)<=d do k=k+1 end
while S.lunation_start_day(k)>d do k=k - 1 end
local hd=d - S.lunation_start_day(k)+1
local total_m=k+1420*12+9
local hy=total_m // 12
local hm=(total_m % 12)+1
if hm<1 then hm=1 elseif hm>12 then hm=12 end
return hy,hm,hd,tostring(hd).. ' ' .. L.hijri_bulan[hm] .. ' ' .. tostring(hy).. ' H'
end
function S.hijri_event_day(hy,hm,hd,adj)
local k=(hy - 1420)*12+(hm - 10)
return S.lunation_start_day(k)+(hd - 1)-(adj or 0)
end
function S.hcal_cache_name(hy,hm)
return string.format('hc%04d%02d.txt',hy,hm)
end
function S.generate_hijri_month(hy,hm,adj)
local k=(hy - 1420)*12+(hm - 10)
local s_d=S.lunation_start_day(k)-(adj or 0)
local e_d=S.lunation_start_day(k+1)-(adj or 0)
local m_days=e_d - s_d
if m_days<29 then m_days=29 elseif m_days>30 then m_days=30 end
local days={}
for hd=1,m_days do
local u_day=s_d+(hd - 1)
local gy,gm,gd=S.civil(u_day)
local wd=S.wday(u_day)
days[hd]={
hd=hd,
gd=gd,
gm=gm,
gy=gy,
wd=wd,
u_day=u_day,
holiday='',
}
end
return days,m_days
end
function S.parse_htog_json(body,hy,hm)
if type(body)~='string' then return nil end
local lines={'# hcal|' .. tostring(hy).. '|' .. tostring(hm)}
local count=0
for h_part,g_part in body:gmatch('"hijri"%s*:%s*({.-"method"%s*:%s*"[^\"]-"})%s*,%s*"gregorian"%s*:%s*({.-"lunarSighting"%s*:%s*%a+%s*})')do
local hd=tonumber(h_part:match('"day"%s*:%s*"0?(%d+)"'))
local gd=tonumber(g_part:match('"day"%s*:%s*"0?(%d+)"'))
local gm=tonumber(g_part:match('"month"%s*:%s*{.-"number"%s*:%s*(%d+)'))
local gy=tonumber(g_part:match('"year"%s*:%s*"(%d+)"'))
local hols=h_part:match('"holidays"%s*:%s*%[(.-)%]')or ''
local hol_name=hols:match('"(.-)"')or ''
if hd and gd and gm and gy then
lines[#lines+1]=string.format('%d=%d,%d,%d,%s',hd,gd,gm,gy,hol_name)
count=count+1
end
end
if count==0 then return nil end
return table.concat(lines,'\n')
end
function S.parse_hcal_cache_text(raw)
if type(raw)~='string' or #raw==0 then return nil end
local hy_s,hm_s=raw:match('^# hcal|(%d+)|(%d+)')
local hy=tonumber(hy_s)
local hm=tonumber(hm_s)
local days={}
local count=0
for hd_s,rest in raw:gmatch('\n(%d+)=([^\r\n]*)')do
local hd=tonumber(hd_s)
if hd then
local gd_s,gm_s,gy_s,hol=rest:match('^(%d+),(%d+),(%d+),(.*)$')
local gd=tonumber(gd_s)
local gm=tonumber(gm_s)
local gy=tonumber(gy_s)
if gd and gm and gy then
local u_day=S.days(gy,gm,gd)
local wd=S.wday(u_day)
days[hd]={
hd=hd,
gd=gd,
gm=gm,
gy=gy,
wd=wd,
u_day=u_day,
holiday=hol or '',
}
count=count+1
end
end
end
if count==0 then return nil end
return{hy=hy,hm=hm,days=days,count=count}
end
function S.load_hijri_month(hy,hm,cfg)
local raw=S.read(S.hcal_cache_name(hy,hm))
local parsed=S.parse_hcal_cache_text(raw)
if parsed and parsed.hy==hy and parsed.hm==hm then
return parsed.days,parsed.count
end
local days,count=S.generate_hijri_month(hy,hm,cfg and cfg.adj or 0)
if days and count>0 then
local lines={'# hcal|' .. tostring(hy).. '|' .. tostring(hm)}
for hd=1,count do
local r=days[hd]
lines[#lines+1]=string.format('%d=%d,%d,%d,%s',r.hd,r.gd,r.gm,r.gy,r.holiday or '')
end
S.write(S.hcal_cache_name(hy,hm),table.concat(lines,'\n'))
return days,count
end
return nil,0
end
function S.effective_hijri(now_info,cfg,today_row)
local L=S.L(cfg)
if not today_row then
local days_cur=S.load_month(now_info.y,now_info.m,cfg and cfg.prov,cfg and cfg.kab)
today_row=days_cur and days_cur[now_info.d] or nil
end
local maghrib_min=(today_row and S.hhmm_to_min(today_row[7]))or(18*60)
local use_maghrib=(cfg==nil or cfg.maghrib ~=false)
local after_maghrib=use_maghrib and((now_info.cur_min or 0)>=maghrib_min)
local eff_day=after_maghrib and(now_info.day+1)or now_info.day
local hy,hm,hd,hijri_str=S.hijri(eff_day,cfg and cfg.adj or 0,L)
return hy,hm,hd,hijri_str,after_maghrib,eff_day
end
function S.now(cfg)
local L=S.L(cfg)
local ok,t=pcall(function()return ctx.clock:now()end)
local e,h,mi,se=0,12,0,0
if ok and type(t)=='table' then
e=math.floor(tonumber(t.epoch_sec)or 0)
h=math.floor(tonumber(t.hour)or 12)
mi=math.floor(tonumber(t.minute)or 0)
se=math.floor(tonumber(t.second)or 0)
end
if e<1000000000 then
local d0=S.days(2026,11,5)
e=d0*86400+h*3600+mi*60+se
end
local off=h*3600+mi*60+se -(e % 86400)
if off>14*3600 then off=off - 86400 elseif off<-12*3600 then off=off+86400 end
off=((off+450)// 900)*900
local wall=e+off
local day=wall // 86400
local y,m,d=S.civil(day)
local wd=S.wday(day)
return{
epoch=e,
wall=wall,
day=day,
y=y,
m=m,
d=d,
wday=wd,
hari=L.hari[wd+1],
hour=h,
min=mi,
sec=se,
cur_min=h*60+mi,
hhmm=string.format('%02d:%02d',h,mi),
date_str=L.hari[wd+1] .. ', ' .. tostring(d).. ' ' .. L.bulan[m] .. ' ' .. tostring(y),
}
end
function S.cache_name(y,m)
return string.format('j%04d%02d.txt',y,m)
end
function S.parse_list_json(body)
if type(body)~='string' then return nil end
local arr=body:match('"data"%s*:%s*%[(.-)%]')
if not arr then return nil end
local list={}
for item in arr:gmatch('"(.-)"')do
list[#list+1]=item
end
return #list>0 and list or nil
end
function S.hhmm_to_min(s)
if type(s)~='string' then return nil end
local h,m=s:match('^(%d%d?):(%d%d)$')
if not h then return nil end
return tonumber(h)*60+tonumber(m)
end
function S.parse_schedule_json(body,prov,kab)
if type(body)~='string' then return nil end
local jpart=body:match('"jadwal"%s*:%s*%[(.*)%]}')or body:match('"jadwal"%s*:%s*%[(.*)%]')
if not jpart then return nil end
local lines={'loc=' ..(prov or '').. '|' ..(kab or '')}
local count=0
for obj in jpart:gmatch('{(.-)}')do
local tgl=tonumber(obj:match('"tanggal"%s*:%s*(%d+)'))
if tgl and tgl>=1 and tgl<=31 then
local times={}
local ok_all=true
for idx=1,8 do
local k=S.KEYS[idx]
local v=obj:match('"' .. k .. '"%s*:%s*"(%d%d?:%d%d)"')
if not v then ok_all=false;break end
times[idx]=v
end
if ok_all then
lines[#lines+1]=tostring(tgl).. '=' .. table.concat(times,',')
count=count+1
end
end
end
if count==0 then return nil end
return table.concat(lines,'\n')
end
function S.parse_aladhan_json(body,prov,kab)
if type(body)~='string' then return nil end
local lines={'loc=' ..(prov or '').. '|' ..(kab or '')}
local count=0
for timing_str,date_str in body:gmatch('"timings"%s*:%s*{(.-)}.-"gregorian"%s*:%s*{(.-)}')do
local day_s=date_str:match('"day"%s*:%s*"0?(%d+)"')
local day=tonumber(day_s)
if day and day>=1 and day<=31 then
local function get_t(k)
local v=timing_str:match('"' .. k .. '"%s*:%s*"(%d%d?:%d%d)')
return v or '--:--'
end
local fajr=get_t('Fajr')
local imsak=get_t('Imsak')
if imsak=='--:--' and fajr ~='--:--' then
local fm=S.hhmm_to_min(fajr)
if fm then
local im=(fm - 10+1440)% 1440
imsak=string.format('%02d:%02d',im // 60,im % 60)
end
end
local rise=get_t('Sunrise')
local dhuha='--:--'
if rise ~='--:--' then
local rm=S.hhmm_to_min(rise)
if rm then
local dm=(rm+25)% 1440
dhuha=string.format('%02d:%02d',dm // 60,dm % 60)
end
end
local dhuhr=get_t('Dhuhr')
local asr=get_t('Asr')
local maghrib=get_t('Maghrib')
local isha=get_t('Isha')
if fajr ~='--:--' and dhuhr ~='--:--' and maghrib ~='--:--' then
lines[#lines+1]=string.format('%d=%s,%s,%s,%s,%s,%s,%s,%s',
day,imsak,fajr,rise,dhuha,dhuhr,asr,maghrib,isha)
count=count+1
end
end
end
if count==0 then return nil end
return table.concat(lines,'\n')
end
function S.parse_cache_text(raw)
if type(raw)~='string' or #raw==0 then return nil end
local loc=raw:match('^loc=([^\r\n]+)')
local days={}
local count=0
for d_str,rest in raw:gmatch('\n(%d+)=([^\r\n]+)')do
local d=tonumber(d_str)
if d then
local row={}
for tm in rest:gmatch('(%d%d?:%d%d)')do
row[#row+1]=tm
end
if #row==8 then
days[d]=row
count=count+1
end
end
end
if count==0 then return nil end
return{loc=loc or '',days=days}
end
local function dsin(d)return math.sin(d*math.pi / 180.0)end
local function dcos(d)return math.cos(d*math.pi / 180.0)end
local function datan2(y,x)return math.atan(y,x)*180.0 / math.pi end
local function dasin(x)
if x>1 then x=1 elseif x<-1 then x=-1 end
return math.asin(x)*180.0 / math.pi
end
local function dacos(x)
if x>1 then x=1 elseif x<-1 then x=-1 end
return math.acos(x)*180.0 / math.pi
end
function S.julian_date(y,m,d)
if m<=2 then y=y - 1;m=m+12 end
local a=math.floor(y / 100)
local b=2 - a+math.floor(a / 4)
return math.floor(365.25*(y+4716))+math.floor(30.6001*(m+1))+d+b - 1524.5
end
function S.sun_position(jd)
local d_days=jd - 2451545.0
local g=(357.529+0.98560028*d_days)% 360.0
local q=(280.459+0.98564736*d_days)% 360.0
local l=(q+1.915*dsin(g)+0.020*dsin(2*g))% 360.0
local e=23.439 - 0.00000036*d_days
local ra=datan2(dcos(e)*dsin(l),dcos(l))
ra=(ra+360.0)% 360.0
local dec=dasin(dsin(e)*dsin(l))
local diff_deg=(q - ra+180.0)% 360.0 - 180.0
local eqt=diff_deg*4.0
return dec,eqt
end
function S.calc_day_prayer(y,m,d,lat,lon,tz,fajr_ang,isha_ang,asr_factor,isha_fixed_min)
lat=lat or -6.21
lon=lon or 106.85
tz=tz or 7.0
fajr_ang=fajr_ang or 20.0
isha_ang=isha_ang or 18.0
asr_factor=asr_factor or 1.0
local jd=S.julian_date(y,m,d)
local dec,eqt=S.sun_position(jd)
local dhuhr_h=12.0+tz -(lon / 15.0)-(eqt / 60.0)
local function ha(angle,is_alt)
local alt=is_alt and angle or(-angle)
local cos_ha=(dsin(alt)- dsin(lat)*dsin(dec))/(dcos(lat)*dcos(dec))
if cos_ha>1 or cos_ha<-1 then return nil end
return dacos(cos_ha)/ 15.0
end
local ha_fajr=ha(fajr_ang,false)
local ha_rise=ha(0.833,false)
local term=asr_factor+math.tan(math.abs(lat - dec)*math.pi / 180.0)
local asr_alt=math.atan(1.0 / term)*180.0 / math.pi
local ha_asr=ha(asr_alt,true)
local ha_maghrib=ha_rise
local ha_isha=not isha_fixed_min and ha(isha_ang,false)or nil
local function to_hhmm(h_val,extra)
if not h_val then return '--:--' end
local tot=(math.floor(h_val*60.0+(extra or 0)+0.5)% 1440+1440)% 1440
return string.format('%02d:%02d',tot // 60,tot % 60)
end
local subuh_h=ha_fajr and(dhuhr_h - ha_fajr)or nil
local rise_h=ha_rise and(dhuhr_h - ha_rise)or nil
local asr_h=ha_asr and(dhuhr_h+ha_asr)or nil
local maghrib_h=ha_maghrib and(dhuhr_h+ha_maghrib)or nil
local isha_h=ha_isha and(dhuhr_h+ha_isha)or nil
local dhuha_h=rise_h and(rise_h+25.0 / 60.0)or nil
local isha_s
if isha_fixed_min and maghrib_h then
isha_s=to_hhmm(maghrib_h,isha_fixed_min+2)
else
isha_s=to_hhmm(isha_h,2)
end
return{
to_hhmm(subuh_h,-10+2),
to_hhmm(subuh_h,2),
to_hhmm(rise_h,0),
to_hhmm(dhuha_h,2),
to_hhmm(dhuhr_h,2),
to_hhmm(asr_h,2),
to_hhmm(maghrib_h,2),
isha_s,
}
end
function S.generate_month(y,m,cfg)
local m_days=S.month_len(y,m)
local lat=cfg and cfg.lat or -6.21
local lon=cfg and cfg.lon or 106.85
local tz=cfg and cfg.tz or 7.0
local fajr_ang=cfg and cfg.fajr_ang or 20.0
local isha_ang=cfg and cfg.isha_ang or 18.0
local asr_factor=cfg and cfg.asr_factor or 1.0
local isha_fixed_min=cfg and cfg.isha_fixed_min or nil
local days={}
for d=1,m_days do
days[d]=S.calc_day_prayer(y,m,d,lat,lon,tz,fajr_ang,isha_ang,asr_factor,isha_fixed_min)
end
return days
end
function S.load_month(y,m,prov,kab,cfg)
local raw=S.read(S.cache_name(y,m))
local parsed=S.parse_cache_text(raw)
local want=(prov or '').. '|' ..(kab or '')
if parsed and(not prov or not kab or parsed.loc==want)then
return parsed.days
end
if cfg then
local days=S.generate_month(y,m,cfg)
if days then
local loc_hdr='loc=' .. want .. '\n'
local body=loc_hdr
for d=1,#days do
local r=days[d]
body=body .. string.format('%d=%s,%s,%s,%s,%s,%s,%s,%s\n',
d,r[1],r[2],r[3],r[4],r[5],r[6],r[7],r[8])
end
S.write(S.cache_name(y,m),body)
return days
end
end
return parsed and parsed.days or nil
end
function S.compute(now_info,cfg)
local L=S.L(cfg)
local days_cur=S.load_month(now_info.y,now_info.m,cfg.prov,cfg.kab,cfg)
local today_row=days_cur and days_cur[now_info.d] or nil
local hy,hm,hd,hijri_str,after_maghrib=S.effective_hijri(now_info,cfg,today_row)
if not today_row then
return{
has_data=false,
hijri_str=hijri_str,
hy=hy,
hm=hm,
hd=hd,
after_maghrib=after_maghrib,
L=L,
}
end
local cur_min=now_info.cur_min
local next_idx=nil
local next_min=nil
local prev_min=0
local is_tomorrow=false
for i=1,#S.WAJIB_IDX do
local idx=S.WAJIB_IDX[i]
local m=S.hhmm_to_min(today_row[idx])
if m then
if cur_min<m and not next_idx then
next_idx=idx
next_min=m
elseif cur_min>=m then
prev_min=m
end
end
end
local active_row=today_row
local active_wday=now_info.wday
if not next_idx then
is_tomorrow=true
next_idx=2
local isya_m=S.hhmm_to_min(today_row[8])or(19*60)
prev_min=isya_m
local tom_y,tom_m,tom_d=S.civil(now_info.day+1)
local days_tom=(tom_m==now_info.m)and days_cur or S.load_month(tom_y,tom_m,cfg.prov,cfg.kab,cfg)
local tom_row=days_tom and days_tom[tom_d] or today_row
active_row=tom_row
active_wday=S.wday(now_info.day+1)
local subuh_m=S.hhmm_to_min(active_row[2])or(4*60+30)
next_min=subuh_m+1440
else
if next_idx==2 then
local isya_m=S.hhmm_to_min(today_row[8])or(19*60+15)
prev_min=isya_m - 1440
end
end
local diff=next_min - cur_min
if diff<0 then diff=0 end
local dh=diff // 60
local dm=diff % 60
local cd_str
if diff==0 then
cd_str=L.now_prayer
elseif cfg and cfg.lang=='en' then
if dh>0 then
cd_str=tostring(dh).. ' hr ' .. tostring(dm).. ' min left'
else
cd_str=tostring(dm).. ' min left'
end
else
if dh>0 then
cd_str=tostring(dh).. ' jam ' .. tostring(dm).. ' menit lagi'
else
cd_str=tostring(dm).. ' menit lagi'
end
end
local span=next_min - prev_min
local prog=0.5
if span>0 then
prog=(cur_min - prev_min)/ span
if prog<0 then prog=0 elseif prog>1 then prog=1 end
end
local next_name=L.labels[next_idx]
if next_idx==5 and active_wday==5 then
next_name=L.jumat or next_name
end
return{
has_data=true,
hijri_str=hijri_str,
row=active_row,
wday=active_wday,
is_tomorrow=is_tomorrow,
next_idx=next_idx,
next_name=next_name,
next_time=active_row[next_idx],
cd_str=cd_str,
progress=prog,
L=L,
}
end
function S.font(name)
return ctx.fonts and ctx.fonts[name] or nil
end
function S.text_w(s,fname)
local f=S.font(fname)
if f then
local ok,w=pcall(function()return f:measure(s)end)
if ok and type(w)=='number' and w>0 then return w end
end
local cw=(fname=='large' and 15)or(fname=='medium' and 12)or 10
return #tostring(s)*cw
end
function S.fit_text(s,fname,max_w)
s=tostring(s or '')
if not max_w or S.text_w(s,fname)<=max_w then return s end
while #s>3 and S.text_w(s .. '..',fname)>max_w do
s=s:sub(1,-2)
end
return s .. '..'
end
function S.center_text(gg,cx,y,s,fname,max_w,color)
s=S.fit_text(s,fname,max_w or(S.W - 24))
local w=S.text_w(s,fname)
local opts={font=S.font(fname)}
if color ~=nil then opts.color=color end
gg:text(math.floor(cx - w / 2),y,s,opts)
end
function S.right_text(gg,rx,y,s,fname)
local w=S.text_w(s,fname)
gg:text(math.floor(rx - w),y,s,{font=S.font(fname)})
end
function S.short(s,max_len)
s=tostring(s or '')
if #s<=max_len then return s end
return s:sub(1,max_len - 2).. '..'
end
function S.round_rect(gg,x,y,w,h,r,lw,fill,color)
r=math.min(r or 10,w // 2,h // 2)
if r<=2 then
if fill then
gg:rect(x,y,w,h,{fill=true,color=color or 1})
else
gg:rect(x,y,w,h,{line_width=lw or 1})
end
return
end
local p={}
local function add(px,py)
p[#p+1]=math.floor(px+0.5)
p[#p+1]=math.floor(py+0.5)
end
add(x+r,y)
add(x+w - r,y)
local cx,cy=x+w - r,y+r
add(cx+r*0.500,cy - r*0.866)
add(cx+r*0.707,cy - r*0.707)
add(cx+r*0.866,cy - r*0.500)
add(cx+r,cy)
add(x+w,y+h - r)
cx,cy=x+w - r,y+h - r
add(cx+r*0.866,cy+r*0.500)
add(cx+r*0.707,cy+r*0.707)
add(cx+r*0.500,cy+r*0.866)
add(cx,cy+r)
add(x+r,y+h)
cx,cy=x+r,y+h - r
add(cx - r*0.500,cy+r*0.866)
add(cx - r*0.707,cy+r*0.707)
add(cx - r*0.866,cy+r*0.500)
add(cx - r,cy)
add(x,y+r)
cx,cy=x+r,y+r
add(cx - r*0.866,cy - r*0.500)
add(cx - r*0.707,cy - r*0.707)
add(cx - r*0.500,cy - r*0.866)
add(cx,cy - r)
add(x+r,y)
if fill then
gg:polygon(p,{fill=true,color=color or 1})
else
gg:polyline(p,{line_width=lw or 1})
end
end
function S.diamond(gg,cx,cy,r,fill,color)
local pts={cx,cy - r,cx+r,cy,cx,cy+r,cx - r,cy,cx,cy - r}
if fill then
local opts={fill=true}
if color ~=nil then opts.color=color end
local ok=pcall(function()gg:polygon(pts,opts)end)
if not ok then gg:polyline(pts,{line_width=2})end
else
gg:polyline(pts,{line_width=1})
end
end
function S.card(gg,x,y,w,h,lw,double_border)
S.round_rect(gg,x,y,w,h,14,nil,true,0)
S.round_rect(gg,x,y,w,h,14,lw or 2)
if double_border then
S.round_rect(gg,x+3,y+3,w - 6,h - 6,11,1)
end
end
function S.ornate_card(gg,x,y,w,h)
S.card(gg,x,y,w,h,2,true)
end
function S.divider(gg,y,x1,x2)
x1=x1 or 24
x2=x2 or(S.W - 24)
gg:line(x1,y,x2,y,{line_width=1})
end
function S.segmented_control(gg,x,y,w,h,segments,active_idx)
local r=h // 2
S.round_rect(gg,x,y,w,h,r,nil,true,0)
S.round_rect(gg,x,y,w,h,r,1)
local n=#segments
local seg_w=w / n
for i,seg in ipairs(segments)do
local sx=math.floor(x+(i - 1)*seg_w)
local sw=math.floor(x+i*seg_w)- sx
if i==active_idx then
local pr=(h - 4)// 2
S.round_rect(gg,sx+2,y+2,sw - 4,h - 4,pr,nil,true,0)
S.round_rect(gg,sx+2,y+2,sw - 4,h - 4,pr,2)
S.center_text(gg,sx+sw // 2,y+(h - 18)// 2,seg,'small',sw - 6)
else
if i<n and(i+1)~=active_idx and i ~=active_idx then
gg:line(sx+sw,y+6,sx+sw,y+h - 6,{line_width=1})
end
S.center_text(gg,sx+sw // 2,y+(h - 18)// 2,seg,'small',sw - 6)
end
end
end
function S.sheet_grabber(gg,cx,y)
S.round_rect(gg,cx - 20,y,40,4,2,nil,true,1)
end
local qr_cache={}
function S.draw_qr(gg,text,cx,cy,size)
size=size or 160
local img=qr_cache[text]
if img==nil then
local ok,res=pcall(function()
if ctx and ctx.qr and ctx.qr.encode then
local r=ctx.qr:encode(text,{size=size})
if not r then r=ctx.qr:encode(text)end
return r
end
return nil
end)
img=(ok and res)or false
qr_cache[text]=img
end
local x=cx - size // 2
local y=cy
S.round_rect(gg,x - 10,y - 10,size+20,size+20,10,nil,true,0)
S.round_rect(gg,x - 10,y - 10,size+20,size+20,10,1)
if img then
local ok=pcall(function()
local w=tonumber(img.width)or 0
local sz=size
if w>0 then sz=w*math.max(1,size // w)end
gg:image(img,cx - sz // 2,y+(size - sz)// 2,{w=sz,h=sz})
end)
if not ok then
pcall(function()gg:image(img,x,y)end)
end
else
gg:rect(x,y,size,size,{line_width=1})
for sy=y+8,y+size - 8,12 do
gg:line(x+8,sy,x+size - 8,sy,{line_width=1})
end
S.round_rect(gg,cx - 64,y+size // 2 - 20,128,40,6,nil,true,0)
S.round_rect(gg,cx - 64,y+size // 2 - 20,128,40,6,1)
S.center_text(gg,cx,y+size // 2 - 12,'[ QR CODE ]','medium')
S.center_text(gg,cx,y+size // 2+8,'Scan via HP','small')
end
end
function S.draw_crescent(gg,cx,cy,r)
gg:circle(cx,cy,r,{fill=true})
gg:circle(cx+math.max(2,r // 2),cy - math.max(1,r // 3),math.floor(r*0.82),{fill=true,color=0})
gg:circle(cx+r+3,cy - r // 2,2,{fill=true})
end
function S.draw_hamburger_btn(gg,x,y,w)
x=x or(S.W - 52)
y=y or 18
w=w or 28
local ly=y+2
gg:line(x,ly,x+w,ly,{line_width=3})
gg:line(x,ly+8,x+w,ly+8,{line_width=3})
gg:line(x,ly+16,x+w,ly+16,{line_width=3})
end
function S.draw_settings_btn(gg,x,y,w,h)
S.draw_hamburger_btn(gg,x,y)
end
function S.draw_menu_icon(gg,kind,cx,cy)
if kind=='shalat' then
gg:rect(cx - 9,cy+2,18,8,{fill=true})
gg:circle(cx,cy+2,6,{fill=true})
gg:line(cx,cy - 8,cx,cy - 4,{line_width=1})
gg:rect(cx - 3,cy+4,6,6,{fill=true,color=0})
elseif kind=='tasbih' then
for deg=0,315,45 do
local rad=deg*math.pi / 180.0
local bx=cx+math.floor(8*math.cos(rad)+0.5)
local by=cy+math.floor(8*math.sin(rad)+0.5)
gg:circle(bx,by,2,{fill=true})
end
elseif kind=='doa' then
gg:rect(cx - 9,cy - 6,8,12,{line_width=1})
gg:rect(cx+1,cy - 6,8,12,{line_width=1})
gg:line(cx - 7,cy - 2,cx - 3,cy - 2)
gg:line(cx - 7,cy+2,cx - 3,cy+2)
gg:line(cx+3,cy - 2,cx+7,cy - 2)
gg:line(cx+3,cy+2,cx+7,cy+2)
elseif kind=='hijri' then
gg:rect(cx - 8,cy - 7,16,15,{line_width=1})
gg:line(cx - 8,cy - 2,cx+8,cy - 2,{line_width=1})
gg:line(cx - 4,cy - 9,cx - 4,cy - 7,{line_width=2})
gg:line(cx+4,cy - 9,cx+4,cy - 7,{line_width=2})
gg:circle(cx,cy+4,2,{fill=true})
elseif kind=='kiblat' then
gg:circle(cx,cy,9,{line_width=1})
gg:line(cx - 4,cy+4,cx+4,cy - 4,{line_width=2})
gg:polygon({cx+4,cy - 4,cx+1,cy - 1,cx+4,cy - 1},{fill=true})
elseif kind=='settings' then
gg:circle(cx,cy,6,{line_width=2})
gg:circle(cx,cy,2,{fill=true})
gg:line(cx,cy - 9,cx,cy+9,{line_width=2})
gg:line(cx - 9,cy,cx+9,cy,{line_width=2})
end
end
function S.draw_app_icon(gg,x,y,sz)
sz=sz or 54
local function sc(v)return math.floor(v*sz / 96+0.5)end
S.round_rect(gg,x,y,sz,sz,sc(14),nil,true,0)
S.round_rect(gg,x,y,sz,sz,sc(14),2)
S.round_rect(gg,x+sc(4),y+sc(4),sz - sc(8),sz - sc(8),sc(10),1)
gg:rect(x+sc(16),y+sc(76),sc(64),sc(4),{fill=true})
gg:rect(x+sc(20),y+sc(72),sc(56),sc(4),{fill=true})
gg:rect(x+sc(28),y+sc(54),sc(40),sc(18),{fill=true})
gg:rect(x+sc(18),y+sc(32),sc(6),sc(40),{fill=true})
gg:rect(x+sc(16),y+sc(42),sc(10),sc(2),{fill=true})
gg:circle(x+sc(21),y+sc(31),sc(3),{fill=true})
gg:line(x+sc(21),y+sc(20),x+sc(21),y+sc(28),{line_width=1})
gg:rect(x+sc(72),y+sc(32),sc(6),sc(40),{fill=true})
gg:rect(x+sc(70),y+sc(42),sc(10),sc(2),{fill=true})
gg:circle(x+sc(75),y+sc(31),sc(3),{fill=true})
gg:line(x+sc(75),y+sc(20),x+sc(75),y+sc(28),{line_width=1})
gg:circle(x+sc(32),y+sc(52),sc(6),{fill=true})
gg:circle(x+sc(64),y+sc(52),sc(6),{fill=true})
gg:circle(x+sc(48),y+sc(48),sc(14),{fill=true})
gg:line(x+sc(48),y+sc(24),x+sc(48),y+sc(34),{line_width=1})
gg:circle(x+sc(48),y+sc(19),sc(6),{fill=true})
gg:circle(x+sc(51),y+sc(16),sc(5),{fill=true,color=0})
gg:rect(x+sc(43),y+sc(60),sc(10),sc(12),{fill=true,color=0})
gg:circle(x+sc(48),y+sc(60),sc(5),{fill=true,color=0})
end
function S.draw_modern_logo(gg,cx,cy,r)
local sz=(r or 20)*2
S.draw_app_icon(gg,cx - sz // 2,cy - sz // 2,sz)
end
local BLACK={fill=true}
local function unpack_pack(p)
if not p then return nil end
if p.g then return p end
local g={}
local r_idx=1
local r_str=p.r or ''
for i=1,11 do
local ch=(i<=10)and tostring(i - 1)or ':'
local gw=p.w:byte(i)- 35
local rcount=(type(p.c)=='table' and p.c[i])or(type(p.c)=='string' and(p.c:byte(i)- 35))or 0
local rects={}
for j=1,rcount do
rects[j]={
r_str:byte(r_idx)- 35,
r_str:byte(r_idx+1)- 35,
r_str:byte(r_idx+2)- 35,
r_str:byte(r_idx+3)- 35,
}
r_idx=r_idx+4
end
g[ch]={w=gw,dec=rects}
end
p.g=g
return p
end
function S.big_clock(gg,hhmm,cx,y,h,cfont_idx)
local fset=(CF and CF[cfont_idx or 1])or(CF and CF[1])
if not fset then
S.center_text(gg,cx,y+(h - 30)// 2,hhmm,'large')
return
end
local raw_pack=(h>=60)and fset.big or(fset.sm or fset.big)
if not raw_pack then return end
local pack=unpack_pack(raw_pack)
if not pack or not pack.g then return end
local gap=(h>=60)and 8 or 4
local total_w=0
for idx=1,#hhmm do
local ch=hhmm:sub(idx,idx)
local gl=pack.g[ch]
if gl then
total_w=total_w+gl.w
if idx<#hhmm then total_w=total_w+gap end
end
end
local x=math.floor(cx - total_w / 2)
local dy=y+(h - pack.h)// 2
for idx=1,#hhmm do
local ch=hhmm:sub(idx,idx)
local gl=pack.g[ch]
if gl then
local rects=gl.dec or{}
for r_i=1,#rects do
local r=rects[r_i]
gg:rect(x+r[1],dy+r[2],r[3],r[4],BLACK)
end
x=x+gl.w+gap
end
end
end
function S.draw_next_card(gg,x,y,w,h,info,cfont_idx)
local L=info.L or S.LANGS.id
S.card(gg,x,y,w,h,2,true)
local label=info.is_tomorrow and L.next_card_tom or L.next_card
local badge_w=S.text_w(label,'small')+22
S.round_rect(gg,x+18,y+8,badge_w,22,6,nil,true,0)
S.round_rect(gg,x+18,y+8,badge_w,22,6,1)
gg:circle(x+28,y+19,3,{fill=true})
gg:text(x+36,y+9,label,{font=S.font('small')})
gg:text(x+20,y+36,info.next_name or '',{font=S.font('large')})
gg:text(x+20,y+68,S.fit_text(info.cd_str or '','medium',w - 176),{font=S.font('medium')})
local bx,by,bw,bh=x+w - 142,y+32,124,54
S.round_rect(gg,bx,by,bw,bh,10,nil,true,0)
S.round_rect(gg,bx,by,bw,bh,10,2)
S.round_rect(gg,bx+2,by+2,bw - 4,bh - 4,8,1)
S.big_clock(gg,info.next_time,bx+bw // 2,by+8,36,cfont_idx)
local px,py,pw,ph=x+20,y+h - 18,w - 40,7
gg:rect(px,py,pw,ph,{fill=true,color=0})
gg:rect(px,py,pw,ph,{line_width=1})
local fill_w=math.floor(pw*(info.progress or 0))
if fill_w>2 then
gg:rect(px,py,fill_w,ph,{fill=true})
gg:circle(px+fill_w,py+ph // 2,4,{fill=true})
end
end
function S.draw_timeline(gg,x,y,w,row_h,info)
local L=info.L or S.LANGS.id
local row_times=info.row
local dot_x=x+22
local first_cy=y+row_h // 2
local last_cy=y+7*row_h+row_h // 2
gg:line(dot_x,first_cy,dot_x,last_cy,{line_width=2})
for i=1,8 do
local ry=y+(i - 1)*row_h
local cy=ry+row_h // 2
local is_next=(i==info.next_idx)
local is_past=info.next_idx and(i<info.next_idx)
local is_wajib=S.IS_WAJIB[i]
local name=L.labels[i]
if i==5 and info.wday==5 then name=L.jumat or name end
local tm=row_times[i] or '--:--'
if is_next then
S.round_rect(gg,x+4,ry,w - 8,row_h - 2,10,nil,true,0)
S.round_rect(gg,x+4,ry,w - 8,row_h - 2,10,2)
S.round_rect(gg,x+6,ry+2,w - 12,row_h - 6,8,1)
gg:circle(dot_x,cy,7,{fill=true,color=0})
gg:circle(dot_x,cy,6,{line_width=2})
gg:circle(dot_x,cy,3,{fill=true})
local ty_lg=ry+math.max(2,(row_h - 32)// 2)
gg:text(x+38,ty_lg,name,{font=S.font('large')})
local bw_badge=S.text_w(L.next_badge,'small')+14
local bx_badge=x+40+S.text_w(name,'large')+12
local by_badge=ry+math.max(4,(row_h - 24)// 2)
S.round_rect(gg,bx_badge,by_badge,bw_badge,22,6,nil,true,0)
S.round_rect(gg,bx_badge,by_badge,bw_badge,22,6,1)
S.center_text(gg,bx_badge+bw_badge // 2,by_badge+2,L.next_badge,'small')
S.right_text(gg,x+w - 20,ty_lg,tm,'large')
else
gg:circle(dot_x,cy,5,{fill=true,color=0})
local fn=is_wajib and 'medium' or 'small'
local ty=ry+math.max(4,(row_h -(is_wajib and 26 or 22))// 2)
if is_past then
gg:circle(dot_x,cy,4,{fill=true})
gg:text(x+38,ty,name,{font=S.font(fn)})
S.right_text(gg,x+w - 34,ty,tm,fn)
gg:circle(x+w - 20,cy,2,{fill=true})
else
gg:circle(dot_x,cy,4,{line_width=1})
gg:text(x+38,ty,name,{font=S.font(fn)})
S.right_text(gg,x+w - 20,ty,tm,fn)
end
end
end
end
S.AYAH_POOL={
'94:5','94:6','94:7','94:8',
'13:28','14:7','20:14','21:87','29:45',
'65:3','93:3','93:5','40:60','55:13','87:1',
'110:3','26:80','57:4','2:152','2:153',
'49:10','49:13','16:128','2:195','3:139',
'3:200','4:103','89:27','89:28','25:74'
}
S.BUILTIN_AYAHS={
[1]={ref='QS. Ash-Sharh: 5',id='Maka sesungguhnya bersama kesulitan ada kemudahan,',en='For indeed, with hardship [will be] ease.'},
[2]={ref='QS. Ash-Sharh: 6',id='Sesungguhnya bersama kesulitan ada kemudahan.',en='Indeed, with hardship [will be] ease.'},
[3]={ref='QS. Ash-Sharh: 7',id='Maka apabila engkau telah selesai (dari suatu urusan), tetaplah bekerja keras (untuk urusan yang lain),',en='So when you have finished [your duties], then stand up [for worship].'},
[4]={ref='QS. Ash-Sharh: 8',id='Dan hanya kepada Tuhanmulah engkau berharap.',en='And to your Lord direct [your] longing.'},
[5]={ref="QS. Ar-Ra'd: 28",id='(yaitu) orang-orang yang beriman dan hati mereka manjadi tenteram dengan mengingat Allah. Ingatlah, hanya dengan mengingati Allah-lah hati menjadi tenteram.',en='Those who have believed and whose hearts are assured by the remembrance of Allah. Unquestionably, by the remembrance of Allah hearts are assured.'},
[6]={ref='QS. Ibrahim: 7',id='Sesungguhnya jika kamu bersyukur, niscaya Aku akan menambah (nikmat) kepadamu.',en='If you are grateful, I will surely increase you [in favor].'},
[7]={ref='QS. Ta-Ha: 14',id='Sungguh, Aku ini Allah, tidak ada tuhan selain Aku, maka sembahlah Aku dan laksanakanlah shalat untuk mengingat-Ku.',en='Indeed, I am Allah. There is no deity except Me, so worship Me and establish prayer for My remembrance.'},
[8]={ref='QS. Al-Anbiya: 87',id='Tidak ada tuhan selain Engkau, Mahasuci Engkau. Sungguh, aku termasuk orang-orang yang zalim.',en='There is no deity except You; exalted are You. Indeed, I have been of the wrongdoers.'},
[9]={ref="QS. Al-'Ankabut: 45",id='Dirikanlah shalat. Sesungguhnya shalat itu mencegah dari (perbuatan) keji dan mungkar.',en='Establish prayer. Indeed, prayer prohibits immorality and wrongdoing.'},
[10]={ref='QS. At-Talaq: 3',id='Dan barangsiapa bertawakal kepada Allah, niscaya Allah akan mencukupkan (keperluan)nya.',en='And whoever relies upon Allah - then He is sufficient for him.'},
[11]={ref='QS. Ad-Duha: 3',id='Tuhanmu tidak meninggalkan engkau (Muhammad) dan tidak (pula) membencimu.',en='Your Lord has not taken leave of you, [O Muhammad], nor has He detested [you].'},
[12]={ref='QS. Ad-Duha: 5',id='Dan sungguh, kelak Tuhanmu pasti memberikan karunia-Nya kepadamu, sehingga engkau menjadi puas.',en='And your Lord is going to give you, and you will be satisfied.'},
[13]={ref='QS. Ghafir: 60',id='Berdoalah kepada-Ku, niscaya akan Kuperkenankan bagimu.',en='Call upon Me; I will respond to you.'},
[14]={ref='QS. Ar-Rahman: 13',id='Maka nikmat Tuhanmu yang manakah yang kamu dustakan?',en='So which of the favors of your Lord would you deny?'},
[15]={ref="QS. Al-A'la: 1",id='Sucikanlah nama Tuhanmu Yang Mahatinggi.',en='Exalt the name of your Lord, the Most High.'},
[16]={ref='QS. An-Nasr: 3',id='Maka bertasbihlah dengan memuji Tuhanmu dan mohonlah ampunan kepada-Nya.',en='Then exalt [Him] with praise of your Lord and ask forgiveness of Him.'},
[17]={ref="QS. Asy-Syu'ara: 80",id='Dan apabila aku sakit, Dialah yang menyembuhkan aku.',en='And when I am ill, it is He who cures me.'},
[18]={ref='QS. Al-Hadid: 4',id='Dan Dia bersama kamu di mana saja kamu berada.',en='And He is with you wherever you are.'},
[19]={ref='QS. Al-Baqarah: 152',id='Maka ingatlah kepada-Ku, Aku pun akan ingat kepadamu. Bersyukurlah kepada-Ku, dan janganlah kamu ingkar kepada-Ku.',en='So remember Me; I will remember you. And be grateful to Me and do not deny Me.'},
[20]={ref='QS. Al-Baqarah: 153',id='Wahai orang-orang yang beriman! Mohonlah pertolongan (kepada Allah) dengan sabar dan shalat.',en='O you who have believed, seek help through patience and prayer.'},
[21]={ref='QS. Al-Hujurat: 10',id='Sesungguhnya orang-orang mukmin itu bersaudara, karena itu damaikanlah antara kedua saudaramu.',en='The believers are but brothers, so make settlement between your brothers.'},
[22]={ref='QS. Al-Hujurat: 13',id='Sesungguhnya yang paling mulia di antara kamu di sisi Allah ialah orang yang paling bertakwa.',en='Indeed, the most noble of you in the sight of Allah is the most righteous of you.'},
[23]={ref='QS. An-Nahl: 128',id='Sungguh, Allah beserta orang-orang yang bertakwa dan orang-orang yang berbuat kebaikan.',en='Indeed, Allah is with those who fear Him and those who are doers of good.'},
[24]={ref='QS. Al-Baqarah: 195',id='Dan berbuat baiklah. Sungguh, Allah menyukai orang-orang yang berbuat baik.',en='And do good; indeed, Allah loves the doers of good.'},
[25]={ref="QS. Ali 'Imran: 139",id='Dan janganlah kamu (merasa) lemah, dan jangan (pula) bersedih hati, sebab kamu paling tinggi (derajatnya), jika kamu orang beriman.',en='So do not weaken and do not grieve, and you will be superior if you are [true] believers.'},
[26]={ref="QS. Ali 'Imran: 200",id='Wahai orang-orang yang beriman! Bersabarlah kamu dan kuatkanlah kesabaranmu dan tetaplah bersiap-siaga dan bertakwalah kepada Allah.',en='O you who have believed, persevere and endure and remain stationed and fear Allah.'},
[27]={ref='QS. An-Nisa: 103',id='Sungguh, shalat itu adalah kewajiban yang ditentukan waktunya atas orang-orang yang beriman.',en='Indeed, prayer has been decreed upon the believers a decree of specified times.'},
[28]={ref='QS. Al-Fajr: 27',id='Wahai jiwa yang tenang!',en='O reassured soul,'},
[29]={ref='QS. Al-Fajr: 28',id='Kembalilah kepada Tuhanmu dengan hati yang ridha dan diridhai-Nya.',en='Return to your Lord, well-pleased and pleasing [to Him],'},
[30]={ref='QS. Al-Furqan: 74',id='Ya Tuhan kami, anugerahkanlah kepada kami pasangan kami dan keturunan kami sebagai penyenang hati (kami).',en='Our Lord, grant us from among our wives and offspring comfort to our eyes.'},
}
function S.wrap_lines(s,max_w,fname)
max_w=max_w or(S.W - 48)
fname=fname or 'small'
local limit_w=max_w - 14
local lines={}
local cur=''
for w in tostring(s or ''):gmatch('%S+')do
local cand=(cur=='')and w or(cur .. ' ' .. w)
if cur ~='' and S.text_w(cand,fname)>limit_w then
lines[#lines+1]=cur
cur=w
else
cur=cand
end
end
if cur ~='' then
lines[#lines+1]=cur
end
return lines
end
function S.split_quote_lines(s,max_len)
local lines=S.wrap_lines(s,max_len and(max_len*10)or(S.W - 48),'small')
local s1=lines[1] or ''
local s2=lines[2] or ''
if #lines>2 then
local rest={}
for i=2,#lines do rest[#rest+1]=lines[i] end
s2=table.concat(rest,' ')
end
return s1,s2
end
function S.parse_ayah_json(str)
if type(str)~='string' then return nil end
local id_text,en_text
local data_str=str:match('"data"%s*:%s*%[(.-)%]%s*,%s*"surah"')
or str:match('"data"%s*:%s*%[(.-)%]%s*}')
or str:match('"data"%s*:%s*%[(.+)%]')
or str
for item in data_str:gmatch('(%b{})')do
local txt=item:match('"text"%s*:%s*"(.-[^\\])"')or item:match('"text"%s*:%s*"([^"]+)"')
if txt then
txt=txt:gsub('\\"','"'):gsub('\\n',' '):gsub('\\r',''):gsub('\\t',' ')
if item:find('"identifier"%s*:%s*"id%.indonesian"')or item:find('"language"%s*:%s*"id"')then
id_text=txt
elseif item:find('"identifier"%s*:%s*"en%.sahih"')or item:find('"language"%s*:%s*"en"')then
en_text=txt
end
end
end
if not id_text or not en_text then
local texts={}
for t in str:gmatch('"text"%s*:%s*"(.-[^\\])"')do
texts[#texts+1]=t:gsub('\\"','"'):gsub('\\n',' ')
end
if not id_text then id_text=texts[1] end
if not en_text then en_text=(texts[2] and texts[2] ~=texts[1])and texts[2] or nil end
end
local surah=str:match('"surah"%s*:%s*{.-"englishName"%s*:%s*"([^"]+)"')
local ayah=str:match('"numberInSurah"%s*:%s*(%d+)')
if id_text and surah and ayah then
local ref='QS. ' .. surah .. ': ' .. ayah
return{
id_text=id_text,
en_text=en_text or '',
ref=ref,
id_l1=id_text,
id_l2='',
id_ref=ref,
en_l1=en_text or '',
en_l2='',
en_ref=ref,
}
end
return nil
end
function S.quote_period_key(now_info,cfg,info)
local qr=cfg and cfg.qrefresh or 1
local y=(now_info and now_info.y)or 2026
local m=(now_info and now_info.m)or 1
local d=(now_info and(now_info.d or now_info.day))or 1
local h=(now_info and(now_info.hour or now_info.h))or 0
if qr==2 then
local pname=(info and info.next_name)or 'Subuh'
return string.format('%04d%02d%02d_%s',y,m,d,pname)
elseif qr==3 then
return string.format('%04d%02d%02d_%02d',y,m,d,h)
else
return string.format('%04d%02d%02d',y,m,d)
end
end
function S.load_cached_quote()
local raw=S.read('quote_cache.txt')
if not raw then return nil end
local t={}
for k,v in raw:gmatch('([%w_]+)=([^\r\n]*)')do t[k]=v end
if(t.id_text and t.id_text ~='')or(t.id_l1 and t.id_l1 ~='')then
return t
end
return nil
end
function S.save_cached_quote(q,key)
if not q then return end
local id_t=q.id_text or q.id_l1 or ''
if q.id_l2 and q.id_l2 ~='' and not q.id_text then
id_t=id_t .. ' ' .. q.id_l2
end
local en_t=q.en_text or q.en_l1 or ''
if q.en_l2 and q.en_l2 ~='' and not q.en_text then
en_t=en_t .. ' ' .. q.en_l2
end
local ref_s=q.ref or q.id_ref or q.en_ref or ''
local s='key=' .. tostring(key or '')..
'\npool_idx=' .. tostring(q.pool_idx or '')..
'\nid_text=' .. tostring(id_t)..
'\nen_text=' .. tostring(en_t)..
'\nref=' .. tostring(ref_s)..
'\nid_l1=' .. tostring(q.id_l1 or id_t)..
'\nid_l2=' .. tostring(q.id_l2 or '')..
'\nid_ref=' .. tostring(q.id_ref or ref_s)..
'\nen_l1=' .. tostring(q.en_l1 or en_t)..
'\nen_l2=' .. tostring(q.en_l2 or '')..
'\nen_ref=' .. tostring(q.en_ref or ref_s)
S.write('quote_cache.txt',s)
end
local quote_fetching=false
local last_quote_req_ms=0
function S.try_fetch_quote(now_info,cfg,info)
pcall(function()
if not cfg or cfg.qrefresh==4 then return end
if quote_fetching then return end
local t_now=(now_info and now_info.epoch)or os.time()
if(t_now - last_quote_req_ms)<60 then return end
local req_key=S.quote_period_key(now_info,cfg,info)
local cur=S.load_cached_quote()
local is_en=(cfg and cfg.lang=='en')
if cur and cur.key==req_key then
if not(is_en and(not cur.en_text or cur.en_text=='' or cur.en_text==cur.id_text or S.is_indonesian_text(cur.en_text)))then
return
end
end
last_quote_req_ms=t_now
local hash_val=0
for i=1,#req_key do
hash_val=(hash_val*31+req_key:byte(i))% 1000000007
end
local pool_idx=(math.abs(hash_val)% #S.AYAH_POOL)+1
local target_ayah=S.AYAH_POOL[pool_idx]
quote_fetching=true
pcall(function()
ctx.net:request({
url='https://api.alquran.cloud/v1/ayah/' .. target_ayah .. '/editions/id.indonesian,en.sahih',
method='GET',
headers={['Accept']='application/json'},
timeout_ms=15000,
},function(c,resp)
quote_fetching=false
pcall(function()
if type(resp)~='table' or type(resp.body)~='string' then return end
local parsed=S.parse_ayah_json(resp.body)
if parsed then
parsed.pool_idx=pool_idx
S.save_cached_quote(parsed,req_key)
pcall(function()ctx:invalidate()end)
end
end)
end)
end)
end)
end
function S.force_refresh_quote(now_info,cfg,info,on_done)
pcall(function()
local t_now=(now_info and now_info.epoch)or os.time()
local cur=S.load_cached_quote()
local cur_idx=0
if cur and cur.pool_idx then
cur_idx=tonumber(cur.pool_idx)or 0
end
local next_idx=(cur_idx % #S.AYAH_POOL)+1
local target_ayah=S.AYAH_POOL[next_idx]
local req_key='manual_' .. tostring(next_idx).. '_' .. tostring(t_now)
if cfg and cfg.qrefresh==4 then
local L_id=S.LANGS.id
local L_en=S.LANGS.en
local q_id=L_id.quotes[((next_idx - 1)% #L_id.quotes)+1]
local q_en=L_en.quotes[((next_idx - 1)% #L_en.quotes)+1]
local parsed={
id_text=q_id[1] .. ' ' .. q_id[2],
en_text=q_en[1] .. ' ' .. q_en[2],
ref=q_id[3],
pool_idx=next_idx,
}
S.save_cached_quote(parsed,req_key)
pcall(function()ctx:invalidate()end)
if on_done then on_done(true,parsed)end
return
end
quote_fetching=true
pcall(function()
ctx.net:request({
url='https://api.alquran.cloud/v1/ayah/' .. target_ayah .. '/editions/id.indonesian,en.sahih',
method='GET',
headers={['Accept']='application/json'},
timeout_ms=12000,
},function(c,resp)
quote_fetching=false
pcall(function()
if type(resp)~='table' or type(resp.body)~='string' then
local L_id=S.LANGS.id
local L_en=S.LANGS.en
local q_id=L_id.quotes[((next_idx - 1)% #L_id.quotes)+1]
local q_en=L_en.quotes[((next_idx - 1)% #L_en.quotes)+1]
local parsed={
id_text=q_id[1] .. ' ' .. q_id[2],
en_text=q_en[1] .. ' ' .. q_en[2],
ref=q_id[3],
pool_idx=next_idx,
}
S.save_cached_quote(parsed,req_key)
pcall(function()ctx:invalidate()end)
if on_done then on_done(true,parsed)end
return
end
local parsed=S.parse_ayah_json(resp.body)
if parsed then
parsed.pool_idx=next_idx
S.save_cached_quote(parsed,req_key)
pcall(function()ctx:invalidate()end)
if on_done then on_done(true,parsed)end
else
if on_done then on_done(false,'Format tidak valid')end
end
end)
end)
end)
end)
end
function S.is_indonesian_text(s)
if not s or s=='' then return false end
local lower=' ' .. s:lower().. ' '
local markers={' yang ',' dan ',' dengan ',' mereka ',' orang ',' sesungguhnya ',' adalah ',' maka ',' hati ',' tidak ',' bagi '}
local count=0
for _,m in ipairs(markers)do
if lower:find(m,1,true)then count=count+1 end
end
return count>=2
end
function S.get_effective_quote(cfg,day)
local is_en=(cfg and cfg.lang=='en')
local q_cache=S.load_cached_quote()
local text,ref
local pool_idx=q_cache and tonumber(q_cache.pool_idx)
if not pool_idx and q_cache and q_cache.ref then
for idx,b in ipairs(S.BUILTIN_AYAHS)do
if b.ref==q_cache.ref then
pool_idx=idx
break
end
end
end
if q_cache then
if is_en then
local cand=q_cache.en_text
if cand and cand ~='' and not S.is_indonesian_text(cand)and cand ~=q_cache.id_text then
text=cand
ref=(q_cache.en_ref and q_cache.en_ref ~='')and q_cache.en_ref or q_cache.ref
end
else
local cand=q_cache.id_text
if cand and cand ~='' then
text=cand
ref=q_cache.ref or q_cache.id_ref
end
end
end
if is_en and(not text or text=='' or S.is_indonesian_text(text))then
local b_idx=(pool_idx and S.BUILTIN_AYAHS and S.BUILTIN_AYAHS[pool_idx] and pool_idx)or(S.BUILTIN_AYAHS and(((day or 0)% #S.BUILTIN_AYAHS)+1))
if b_idx and S.BUILTIN_AYAHS and S.BUILTIN_AYAHS[b_idx] then
text=S.BUILTIN_AYAHS[b_idx].en
ref=S.BUILTIN_AYAHS[b_idx].ref
elseif S.LANGS and S.LANGS.en and S.LANGS.en.quotes then
local L=S.LANGS.en
local q=L.quotes[((day or 0)% #L.quotes)+1]
text=q[1] .. ' ' .. q[2]
ref=q[3]
end
elseif not is_en and(not text or text=='')then
local b_idx=(pool_idx and S.BUILTIN_AYAHS and S.BUILTIN_AYAHS[pool_idx] and pool_idx)or(S.BUILTIN_AYAHS and(((day or 0)% #S.BUILTIN_AYAHS)+1))
if b_idx and S.BUILTIN_AYAHS and S.BUILTIN_AYAHS[b_idx] then
text=S.BUILTIN_AYAHS[b_idx].id
ref=S.BUILTIN_AYAHS[b_idx].ref
elseif S.LANGS and S.LANGS.id and S.LANGS.id.quotes then
local L=S.LANGS.id
local q=L.quotes[((day or 0)% #L.quotes)+1]
text=q[1] .. ' ' .. q[2]
ref=q[3]
end
end
return text,ref,pool_idx
end
function S.draw_quote(gg,y,day,cfg,max_w,max_h)
max_w=max_w or(S.W - 36)
local avail_h=max_h or math.max(60,788 - y)
local text,ref=S.get_effective_quote(cfg,day)
if not text or text=='' then return end
local lines=S.wrap_lines(text,max_w,'small')
local n=#lines
if n==0 then return end
lines[1]='"' .. lines[1]
lines[n]=lines[n] .. '"'
local lh=(n>=7)and 15 or((n>=5)and 16 or((n>=3)and 18 or 20))
local ref_gap=(n>=7)and 12 or((n>=5)and 14 or((n>=3)and 16 or 18))
local total_h=(n - 1)*lh+ref_gap+14
while n>2 and total_h>avail_h do
table.remove(lines,n)
n=#lines
lines[n]=lines[n]:gsub('%.+$',''):gsub('"+$','').. '..."'
total_h=(n - 1)*lh+ref_gap+14
end
local base_y=math.floor(y+(avail_h - total_h)/ 2)
if base_y<y then base_y=y end
if(base_y+total_h)>(y+avail_h)then
base_y=(y+avail_h)- total_h
end
for i=1,n do
local ly=base_y+(i - 1)*lh
local lw=S.text_w(lines[i],'small')
gg:text(math.floor((S.W - lw)/ 2),ly,lines[i],{font=S.font('small')})
end
local ry=base_y+(n - 1)*lh+ref_gap
local rw=S.text_w(ref or '','small')
gg:text(math.floor((S.W - rw)/ 2),ry,ref or '',{font=S.font('small')})
end
S.APP_VERSION='1.1.7'
S.APP_BUILD=117
S.UPDATE_URL='https://raw.githubusercontent.com/fiqsr/MuslimInk-XTEINK-X4-PRO/main/version.json'
S.PROJECT_GITHUB_URL='https://github.com/fiqsr/MuslimInk-XTEINK-X4-PRO'
S.RELEASE_LATEST_URL='https://github.com/fiqsr/MuslimInk-XTEINK-X4-PRO/releases/latest'
function S.parse_version_json(str)
if type(str)~='string' or #str==0 then return nil end
if ctx and ctx.json and ctx.json.decode then
local ok,res=pcall(function()return ctx.json:decode(str)end)
if ok and type(res)=='table' and res.version then
if not res.release_page_url then
res.release_page_url=S.RELEASE_LATEST_URL
end
return res
end
end
local t={}
t.version=str:match('"version"%s*:%s*"([^"]+)"')
local b=str:match('"build"%s*:%s*(%d+)')
t.build=b and tonumber(b)or 0
t.release_date=str:match('"release_date"%s*:%s*"([^"]+)"')
t.download_url=str:match('"download_url"%s*:%s*"([^"]+)"')
t.raw_package_url=str:match('"raw_package_url"%s*:%s*"([^"]+)"')
t.release_page_url=str:match('"release_page_url"%s*:%s*"([^"]+)"')or S.RELEASE_LATEST_URL
local sz=str:match('"size_bytes"%s*:%s*(%d+)')
t.size_bytes=sz and tonumber(sz)or 427680
local function parse_array(key)
local arr={}
local blk=str:match('"' .. key .. '"%s*:%s*%[([^%]]+)%]')
if blk then
for item in blk:gmatch('"([^"]+)"')do
local clean=item:gsub('\\"','"'):gsub('\\\\','\\')
arr[#arr+1]=clean
end
end
return arr
end
t.changelog_id=parse_array('changelog_id')
t.changelog_en=parse_array('changelog_en')
if t.version then return t end
return nil
end
function S.compare_versions(v_rem,v_loc)
if not v_rem or not v_loc then return false end
local r_maj,r_min,r_pat=tostring(v_rem):match('(%d+)%.(%d+)%.?(%d*)')
local l_maj,l_min,l_pat=tostring(v_loc):match('(%d+)%.(%d+)%.?(%d*)')
r_maj,r_min,r_pat=tonumber(r_maj)or 0,tonumber(r_min)or 0,tonumber(r_pat)or 0
l_maj,l_min,l_pat=tonumber(l_maj)or 0,tonumber(l_min)or 0,tonumber(l_pat)or 0
if r_maj ~=l_maj then return r_maj>l_maj end
if r_min ~=l_min then return r_min>l_min end
return r_pat>l_pat
end
local update_checking=false
function S.check_for_updates(cfg,on_done)
if update_checking then
if on_done then on_done(false,nil,'Sedang memeriksa...')end
return
end
update_checking=true
pcall(function()
if ctx and ctx.net and ctx.net.keep_wifi then
pcall(function()ctx.net:keep_wifi(120000)end)
end
end)
local function finish(has_up,u_info,err)
update_checking=false
if on_done then
pcall(function()on_done(has_up,u_info,err)end)
end
end
if not(ctx and ctx.net and ctx.net.request)then
finish(false,nil,'Modul jaringan tidak tersedia')
return
end
local req_opts={
url=S.UPDATE_URL,
method='GET',
headers={
['Accept']='application/json',
['User-Agent']='MuslimInk-X4Pro/' .. S.APP_VERSION,
},
timeout_ms=15000,
}
pcall(function()
ctx.net:request(req_opts,function(c,resp)
if type(resp)~='table' or type(resp.body)~='string' or #resp.body==0 then
finish(false,nil,'Respon server kosong')
return
end
local info=S.parse_version_json(resp.body)
if not info or not info.version then
finish(false,nil,'Format version.json tidak valid')
return
end
local is_newer=S.compare_versions(info.version,S.APP_VERSION)
if not is_newer and info.build and info.build>S.APP_BUILD then
is_newer=true
end
finish(is_newer,info,nil)
end)
end)
end
local update_downloading=false
function S.save_update_package(filename,body,chunks)
filename=filename or 'muslimink_update.xtapp'
local saved_path=nil
local min_sz=100000
if ctx and ctx.storage and ctx.storage.write then
local res=nil
pcall(function()
res=ctx.storage:write(filename,body)
end)
if res then
local exists_ok,exists=pcall(function()return ctx.storage:exists(filename)end)
local sz_ok,sz=pcall(function()return ctx.storage:size(filename)end)
if(not exists_ok or exists)and(not sz_ok or(sz and sz>=min_sz))then
saved_path='XTApps/muslimink/files/' .. filename
end
end
end
if not saved_path and ctx and ctx.files and ctx.files.write then
local res=nil
pcall(function()
res=ctx.files:write(filename,body)
end)
if res then
local base_dir=(type(ctx.files.path)=='string' and ctx.files.path ~='')
and ctx.files.path
or 'XTApps/muslimink/files'
saved_path=base_dir .. '/' .. filename
end
end
if not saved_path and io and io.open then
local candidates={
'XTApps/muslimink/files/' .. filename,
'/sdcard/XTApps/' .. filename,
'../../' .. filename,
'../' .. filename,
filename,
}
for _,path in ipairs(candidates)do
local f=io.open(path,'wb')
if f then
f:write(body)
f:close()
saved_path=path
break
end
end
end
return saved_path
end
function S.download_update(update_info,on_progress,on_done)
if update_downloading then
if on_done then on_done(false,nil,'Sedang mengunduh...')end
return
end
update_downloading=true
pcall(function()
if ctx and ctx.net and ctx.net.keep_wifi then
pcall(function()ctx.net:keep_wifi(300000)end)
end
end)
local function finish(ok,path,err)
update_downloading=false
if on_done then
pcall(function()on_done(ok,path,err)end)
end
end
if not(ctx and ctx.net and ctx.net.request)then
finish(false,nil,'Modul jaringan tidak tersedia')
return
end
local raw_url=(update_info and update_info.raw_package_url)or ''
local rel_url=(update_info and update_info.download_url)or ''
local primary_url=(raw_url ~='')and raw_url or rel_url
if primary_url=='' then
finish(false,nil,'URL berkas pembaruan tidak ditemukan')
return
end
local CHUNK_SIZE=65536
local chunks={}
local downloaded_bytes=0
local total_bytes=(update_info and update_info.size_bytes)or 422144
local current_url=primary_url
local chunk_retries=0
local MAX_CHUNK_RETRIES=3
local redirect_count=0
local fetch_chunk
fetch_chunk=function()
local end_byte=downloaded_bytes+CHUNK_SIZE - 1
if total_bytes and total_bytes>0 and end_byte>=total_bytes then
end_byte=total_bytes - 1
end
local req_opts={
url=current_url,
method='GET',
headers={
['Accept']='*/*',
['Accept-Encoding']='identity',
['Range']='bytes=' .. downloaded_bytes .. '-' .. end_byte,
['User-Agent']='Mozilla/5.0 (Windows NT 10.0; Win64; x64) MuslimInk/' .. S.APP_VERSION,
},
timeout_ms=45000,
}
ctx.net:request(req_opts,function(c,resp)
if type(resp)~='table' then
if chunk_retries<MAX_CHUNK_RETRIES then
chunk_retries=chunk_retries+1
fetch_chunk()
return
end
if current_url ~=rel_url and rel_url ~='' then
current_url=rel_url
chunk_retries=0
fetch_chunk()
return
end
finish(false,nil,'Koneksi gagal atau terputus')
return
end
if(resp.status==301 or resp.status==302 or resp.status==307 or resp.status==308)and type(resp.headers)=='table' then
redirect_count=redirect_count+1
if redirect_count>5 then
finish(false,nil,'Terlalu banyak pengalihan (redirect)')
return
end
local loc=nil
for k,v in pairs(resp.headers)do
if tostring(k):lower()=='location' then
loc=v
break
end
end
if loc and loc ~='' then
current_url=loc
fetch_chunk()
return
end
end
if resp.status ~=206 and resp.status ~=200 then
if current_url ~=rel_url and rel_url ~='' then
current_url=rel_url
chunk_retries=0
fetch_chunk()
return
end
finish(false,nil,'HTTP Error ' .. tostring(resp.status))
return
end
local body=resp.body
if type(body)~='string' or #body==0 then
if chunk_retries<MAX_CHUNK_RETRIES then
chunk_retries=chunk_retries+1
fetch_chunk()
return
end
finish(false,nil,'Data unduhan kosong')
return
end
local min_sz=math.floor(total_bytes*0.9)
if resp.status==200 and downloaded_bytes==0 and #body>=min_sz then
if body:sub(1,4)~='XTAP' then
finish(false,nil,'Berkas corrupt: header bukan XTAP')
return
end
local saved_path=S.save_update_package('muslimink_update.xtapp',body,{body})
if not saved_path then
finish(false,nil,'Gagal menyimpan berkas ke XTApps/muslimink/files')
return
end
if on_progress then
pcall(function()on_progress(#body,#body)end)
end
finish(true,saved_path,nil)
return
end
if type(resp.headers)=='table' then
for k,v in pairs(resp.headers)do
if tostring(k):lower()=='content-range' then
local tot=tostring(v):match('/(%d+)')
if tot then
local n_tot=tonumber(tot)
if n_tot and n_tot>0 then
total_bytes=n_tot
end
end
break
end
end
end
table.insert(chunks,body)
downloaded_bytes=downloaded_bytes+#body
chunk_retries=0
if on_progress then
pcall(function()on_progress(downloaded_bytes,total_bytes)end)
end
if downloaded_bytes<total_bytes and #body>0 then
fetch_chunk()
return
end
local full_body=table.concat(chunks)
if full_body:sub(1,4)~='XTAP' then
finish(false,nil,'Berkas corrupt: header tidak valid (bukan paket XTAP)')
return
end
if #full_body<min_sz then
finish(false,nil,'Ukuran berkas tidak lengkap: ' .. math.floor(#full_body / 1024).. ' KB (seharusnya ~' .. math.floor(total_bytes / 1024).. ' KB)')
return
end
local saved_path=S.save_update_package('muslimink_update.xtapp',full_body,chunks)
if not saved_path then
finish(false,nil,'Gagal menyimpan berkas ke XTApps/muslimink/files')
return
end
finish(true,saved_path,nil)
end)
end
pcall(function()fetch_chunk()end)
end
return S
end)()
local F=(function()
local F={}
F.TARGETS={33,99,100,1000,0}
F.DHIKR_LIST={
{
id_title='1. Paket Wirid Bakda Shalat (Otomatis)',
en_title='1. Post-Prayer Wirid (Auto 33x3 + 1)',
is_auto=true,
def_target=100,
},
{
id_title='2. Tasbih',
en_title='2. Tasbih',
latin='Subhaanallaah',
id_arti='Maha Suci Allah',
en_arti='Glory be to Allah',
def_target=33,
},
{
id_title='3. Tahmid',
en_title='3. Tahmid',
latin='Alhamdulillaah',
id_arti='Segala puji bagi Allah',
en_arti='All praise is due to Allah',
def_target=33,
},
{
id_title='4. Takbir',
en_title='4. Takbir',
latin='Allaahu Akbar',
id_arti='Allah Maha Besar',
en_arti='Allah is the Greatest',
def_target=33,
},
{
id_title='5. Tahlil',
en_title='5. Tahlil',
latin='Laa ilaaha illallaah',
id_arti='Tiada Tuhan selain Allah',
en_arti='There is no deity except Allah',
def_target=100,
},
{
id_title='6. Istighfar',
en_title='6. Istighfar',
latin="Astaghfirullaahal 'azhiim",
id_arti='Aku memohon ampun kepada Allah Yang Maha Agung',
en_arti='I seek forgiveness from Allah the Almighty',
def_target=100,
},
{
id_title='7. Shalawat Nabi',
en_title='7. Salawat upon the Prophet',
latin="Allaahumma shalli 'alaa Muhammad",
id_arti='Ya Allah, limpahkanlah rahmat kepada Nabi Muhammad',
en_arti='O Allah, send blessings upon Prophet Muhammad',
def_target=100,
},
{
id_title='8. Hauqalah',
en_title='8. Hawqalah',
latin='Laa haula wa laa quwwata illaa billaah',
id_arti='Tiada daya dan kekuatan kecuali dengan pertolongan Allah',
en_arti='There is no power nor strength except through Allah',
def_target=33,
},
}
function F.load_tasbih(today_day)
local raw=S.read('tasbih.txt')
local t={}
if raw then
for k,v in raw:gmatch('([%w_]+)=([^\r\n]*)')do t[k]=v end
end
local saved_day=tonumber(t.day)or today_day
local today_cnt=tonumber(t.today)or 0
if saved_day ~=today_day then
today_cnt=0
end
local idx=tonumber(t.idx)or 1
if idx<1 or idx>#F.DHIKR_LIST then idx=1 end
return{
idx=idx,
count=tonumber(t.count)or 0,
target=tonumber(t.target)or F.DHIKR_LIST[idx].def_target,
today=today_cnt,
total=tonumber(t.total)or 0,
day=today_day,
}
end
function F.save_tasbih(tsb)
local s='idx=' .. tostring(tsb.idx or 1)..
'\ncount=' .. tostring(tsb.count or 0)..
'\ntarget=' .. tostring(tsb.target or 33)..
'\ntoday=' .. tostring(tsb.today or 0)..
'\ntotal=' .. tostring(tsb.total or 0)..
'\nday=' .. tostring(tsb.day or 0)
S.write('tasbih.txt',s)
end
function F.active_dhikr_text(tsb,is_en)
local item=F.DHIKR_LIST[tsb.idx] or F.DHIKR_LIST[1]
local title=is_en and item.en_title or item.id_title
if not item.is_auto then
return title,item.latin,(is_en and item.en_arti or item.id_arti),''
end
local c=(tsb.count or 0)% 100
if c<33 then
local step=tostring(c+1).. '/33'
return title,'Subhaanallaah (' .. step .. ')',
(is_en and 'Glory be to Allah' or 'Maha Suci Allah'),
(is_en and 'Stage 1 of 3: Tasbih 33x' or 'Tahap 1 dari 3: Tasbih 33x')
elseif c<66 then
local step=tostring(c - 32).. '/33'
return title,'Alhamdulillaah (' .. step .. ')',
(is_en and 'All praise is due to Allah' or 'Segala puji bagi Allah'),
(is_en and 'Stage 2 of 3: Tahmid 33x' or 'Tahap 2 dari 3: Tahmid 33x')
elseif c<99 then
local step=tostring(c - 65).. '/33'
return title,'Allaahu Akbar (' .. step .. ')',
(is_en and 'Allah is the Greatest' or 'Allah Maha Besar'),
(is_en and 'Stage 3 of 3: Takbir 33x' or 'Tahap 3 dari 3: Takbir 33x')
else
return title,"Laa ilaaha illallaahu wahdahu laa syariika lah, lahul-mulku wa lahul-hamdu wa Huwa 'alaa kulli syai'in qadiir",
(is_en and 'Completing 100: Tahlil & Praise' or 'Penyempurna ke-100: Tahlil & Pujian'),
(is_en and '100/100 Complete!' or 'Genap 100/100 Selesai!')
end
end
F.DUA_LIST={
{
cat_id='DOA HARIAN UTAMA',
cat_en='ESSENTIAL DAILY DUA',
title_id='1. Doa Kebaikan Dunia & Akhirat',
title_en='1. Goodness in This World & Hereafter',
latin="Rabbanaa aatinaa fid-dun-yaa hasanah, wa fil-aakhirati hasanah, wa qinaa 'adzaaban-naar.",
arti_id='Ya Tuhan kami, berilah kami kebaikan di dunia dan kebaikan di akhirat, serta lindungilah kami dari siksa neraka.',
arti_en='Our Lord, grant us good in this world and good in the Hereafter, and protect us from the torment of the Fire.',
src='QS. Al-Baqarah: 201',
},
{
cat_id='DZIKIR SESUDAH SHALAT',
cat_en='POST-PRAYER ADHKAR',
title_id='2. Doa Mohon Bantuan Dzikir & Ibadah',
title_en='2. Dua for Remembrance & Worship',
latin="Allaahumma a'innii 'alaa dzikrika wa syukrika wa husni 'ibaadatik.",
arti_id='Ya Allah, tolonglah aku untuk senantiasa mengingat-Mu, bersyukur kepada-Mu, dan beribadah dengan baik kepada-Mu.',
arti_en='O Allah, help me to remember You, to give thanks to You, and to worship You in the best manner.',
src='HR. Abu Dawud & An-Nasa\'i',
},
{
cat_id='DZIKIR SESUDAH SHALAT',
cat_en='POST-PRAYER ADHKAR',
title_id='3. Dzikir Keselamatan Bakda Salam',
title_en='3. PeaceInvocation After Taslim',
latin='Allaahumma antas-salaam, wa minkas-salaam, tabaarakta yaa dzal-jalaali wal-ikraam.',
arti_id='Ya Allah, Engkaulah sumber keselamatan dan dari-Mu datangnya keselamatan. Maha Berkah Engkau wahai Pemilik Keagungan dan Kemuliaan.',
arti_en='O Allah, You are Peace and from You comes peace. Blessed are You, O Possessor of Majesty and Honor.',
src='HR. Muslim no. 591',
},
{
cat_id='DZIKIR PAGI & PETANG',
cat_en='MORNING & EVENING ADHKAR',
title_id='4. Sayyidul Istighfar (Penghulu Istighfar)',
title_en='4. Sayyidul Istighfar (Master Supplication)',
latin="Allaahumma anta Rabbii laa ilaaha illaa anta, khalaqtanii wa anaa 'abduka, wa anaa 'alaa 'ahdika wa wa'dika mastatha'tu, a'uudzu bika min syarri maa shana'tu, abuu'u laka bini'matika 'alayya, wa abuu'u bidzanbii faghfir lii.",
arti_id='Ya Allah, Engkau Tuhanku, tiada Tuhan selain Engkau. Engkau menciptakanku dan aku hamba-Mu. Aku berlindung kepada-Mu dari keburukan perbuatanku, aku mengakui nikmat-Mu dan mengakui dosaku, maka ampunilah aku.',
arti_en='O Allah, You are my Lord, there is no deity but You. You created me and I am Your servant. I acknowledge Your favor upon me and I confess my sin, so forgive me.',
src='HR. Bukhari no. 6306',
},
{
cat_id='DOA SESUDAH ADZAN',
cat_en='DUA AFTER ADHAN',
title_id='5. Doa Sesudah Mendengar Adzan',
title_en='5. Supplication After the Call to Prayer',
latin="Allaahumma Rabba haadzihid-da'watit-taammah, wash-shalaatil-qaa'imah, aati Muhammadanil-wasiilata wal-fadhiilah, wab'atshu maqaamam-mahmuudanil-ladzii wa'adtah.",
arti_id='Ya Allah, pemilik panggilan yang sempurna ini dan shalat yang akan didirikan, berikanlah kepada Nabi Muhammad al-wasilah dan keutamaan, serta bangkitkanlah beliau pada kedudukan terpuji yang telah Engkau janjikan.',
arti_en='O Allah, Lord of this perfect call and established prayer, grant Muhammad the intercession and favor, and raise him to the praised station You promised him.',
src='HR. Bukhari no. 614',
},
{
cat_id='DOA HARIAN & KELUARGA',
cat_en='FAMILY & PARENTS DUA',
title_id='6. Doa untuk Kedua Orang Tua',
title_en='6. Supplication for Parents',
latin='Rabbighfir lii wa liwaalidayya warhamhumaa kamaa rabbayaanii shaghiiraa.',
arti_id='Ya Tuhanku, ampunilah dosaku dan dosa kedua orang tuaku, serta sayangilah mereka sebagaimana mereka menyayangiku di waktu kecil.',
arti_en='My Lord, forgive me and my parents, and have mercy on them both as they raised me when I was small.',
src='QS. Al-Isra\': 24',
},
{
cat_id='DZIKIR PAGI &sholat SUBUH',
cat_en='MORNING & FAJR DUA',
title_id='7. Doa Ilmu, Rezeki & Amal Diterima',
title_en='7. Beneficial Knowledge & Provision',
latin="Allaahumma innii as'aluka 'ilman naafi'an, wa rizqan thayyiban, wa 'amalan mutaqabbalan.",
arti_id='Ya Allah, sesungguhnya aku memohon kepada-Mu ilmu yang bermanfaat, rezeki yang halal lagi baik, dan amal ibadah yang diterima.',
arti_en='O Allah, I ask You for beneficial knowledge, pure and wholesome provision, and deeds that are accepted.',
src='HR. Ibnu Majah no. 925',
},
{
cat_id='DOA KETEGUHAN IMAN',
cat_en='STEADFASTNESS IN FAITH',
title_id='8. Doa Keteguhan Hati di Atas Agama',
title_en='8. Steadfastness of the Heart',
latin="Yaa Muqallibal-quluub, tsabbit qalbii 'alaa diinik. Rabbanaa laa tuzigh quluubanaa ba'da idz hadaitanaa wa hab lanaa mil-ladunka rahmah.",
arti_id='Wahai Dzat yang membolak-balikkan hati, teguhkanlah hatiku di atas agama-Mu. Ya Tuhan kami, janganlah Engkau condongkan hati kami kepada kesesatan setelah Engkau beri petunjuk.',
arti_en='O Turner of the hearts, keep my heart firm upon Your religion. Our Lord, let not our hearts deviate after You have guided us.',
src='HR. Tirmidzi & QS. Ali Imran: 8',
},
{
cat_id='DOA KEMUDAHAN URUSAN',
cat_en='EASE IN DIFFICULTY',
title_id='9. Doa Kelapangan Dada & Kemudahan',
title_en='9. Expansion of the Chest & Ease',
latin='Rabbisyrah lii shadrii, wa yassir lii amrii, wahlul \'uqdatam-mil-lisaanii, yafqahuu qaulii.',
arti_id='Ya Tuhanku, lapangkanlah dadaku, mudahkanlah urusanku, dan lepaskanlah kekakuan dari lidahku agar mereka memahami perkataanku.',
arti_en='My Lord, expand for me my breast, ease for me my task, and untie the knot from my tongue that they may understand my speech.',
src='QS. Thaha: 25-28',
},
{
cat_id='DOA PERJALANAN & RUMAH',
cat_en='LEAVING HOME & TRAVEL',
title_id='10. Doa Keluar Rumah & Tawakkal',
title_en='10. Leaving Home & Reliance on Allah',
latin="Bismillaahi tawakkaltu 'alallaah, laa haula wa laa quwwata illaa billaah.",
arti_id='Dengan nama Allah, aku bertawakkal kepada Allah. Tiada daya dan kekuatan kecuali dengan pertolongan Allah.',
arti_en='In the name of Allah, I place my trust in Allah; there is no power and no strength except through Allah.',
src='HR. Abu Dawud & Tirmidzi',
},
}
F.ISLAMIC_EVENTS={
{hm=1,hd=1,id='Tahun Baru Islam',en='Islamic New Year'},
{hm=1,hd=10,id='Puasa Sunnah Asyura',en='Day of Ashura Fast'},
{hm=3,hd=12,id='Maulid Nabi Muhammad',en='Mawlid al-Nabi'},
{hm=7,hd=27,id='Isra Mi\'raj Nabi SAW',en='Isra and Mi\'raj'},
{hm=8,hd=15,id='Malam Nisfu Sya\'ban',en='Night of Mid-Sha\'ban'},
{hm=9,hd=1,id='Awal Puasa Ramadhan',en='Start of Ramadan'},
{hm=9,hd=17,id='Malam Nuzulul Qur\'an',en='Nuzulul Quran'},
{hm=10,hd=1,id='Hari Raya Idul Fitri',en='Eid al-Fitr'},
{hm=12,hd=9,id='Puasa Sunnah Arafah',en='Day of Arafah Fast'},
{hm=12,hd=10,id='Hari Raya Idul Adha',en='Eid al-Adha'},
}
function F.upcoming_events(eff_day,hy,adj,L,is_en)
local list={}
for i=1,#F.ISLAMIC_EVENTS do
local ev=F.ISLAMIC_EVENTS[i]
local target_hy=hy
local ev_day=S.hijri_event_day(target_hy,ev.hm,ev.hd,adj)
if ev_day<eff_day then
target_hy=hy+1
ev_day=S.hijri_event_day(target_hy,ev.hm,ev.hd,adj)
end
local diff=ev_day - eff_day
local gy,gm,gd=S.civil(ev_day)
local g_str=tostring(gd).. ' ' .. L.bulan_short[gm] .. ' ' .. tostring(gy)
list[#list+1]={
name=is_en and ev.en or ev.id,
date_str=tostring(ev.hd).. ' ' .. L.hijri_bulan[ev.hm] .. ' • ' .. g_str,
diff=diff,
}
end
table.sort(list,function(a,b)return a.diff<b.diff end)
return list
end
function F.sunnah_fast_info(wday,hd,L,is_en)
local is_ayyamul=(hd>=13 and hd<=15)
local is_senin=(wday==1)
local is_kamis=(wday==4)
if is_ayyamul and(is_senin or is_kamis)then
return is_en and '* Today: Ayyamul Bidh & Mon/Thu Sunnah Fast *'
or '* Hari Ini: Puasa Ayyamul Bidh & Senin/Kamis *'
elseif is_ayyamul then
return is_en and('* Today: Ayyamul Bidh Sunnah Fast (' .. tostring(hd).. ' H) *')
or('* Hari Ini: Puasa Sunnah Ayyamul Bidh (' .. tostring(hd).. ' H) *')
elseif is_senin then
return is_en and '* Today: Monday Sunnah Fast *'
or '* Hari Ini: Jadwal Puasa Sunnah Senin *'
elseif is_kamis then
return is_en and '* Today: Thursday Sunnah Fast *'
or '* Hari Ini: Jadwal Puasa Sunnah Kamis *'
else
if hd<13 then
local d_left=13 - hd
return is_en and('Next Ayyamul Bidh (13-15 H): in ' .. tostring(d_left).. ' day(s)')
or('Puasa Ayyamul Bidh (13-15 H): ' .. tostring(d_left).. ' hari lagi')
else
return is_en and 'Sunnah Fasts: Mon/Thu & 13-15 Hijri (Ayyamul Bidh)'
or 'Puasa Sunnah: Senin-Kamis & 13-15 H (Ayyamul Bidh)'
end
end
end
function F.sunnah_fast_short(wday,hd,is_en)
local is_ayyamul=(hd>=13 and hd<=15)
local is_senin=(wday==1)
local is_kamis=(wday==4)
if is_ayyamul and(is_senin or is_kamis)then
return is_en and 'Ayyamul Bidh + Sunnah' or 'Ayyamul Bidh + Sunnah'
elseif is_ayyamul then
return is_en and('Ayyamul Bidh (' .. tostring(hd).. ' H)')
or('Ayyamul Bidh (' .. tostring(hd).. ' H)')
elseif is_senin then
return is_en and 'Sunnah Fast: Monday' or 'Puasa Sunnah: Senin'
elseif is_kamis then
return is_en and 'Sunnah Fast: Thursday' or 'Puasa Sunnah: Kamis'
end
return nil
end
F.PROV_COORDS={
['Aceh']={5.55,95.32},
['Sumatera Utara']={3.59,98.67},
['Sumatera Barat']={-0.95,100.35},
['Riau']={0.51,101.45},
['Kepulauan Riau']={0.92,104.45},
['Jambi']={-1.61,103.61},
['Bengkulu']={-3.80,102.26},
['Sumatera Selatan']={-2.99,104.76},
['Kepulauan Bangka Belitung']={-2.13,106.11},
['Lampung']={-5.43,105.26},
['Banten']={-6.12,106.15},
['DKI Jakarta']={-6.21,106.85},
['Jawa Barat']={-6.91,107.61},
['Jawa Tengah']={-6.97,110.42},
['DI Yogyakarta']={-7.80,110.36},
['Jawa Timur']={-7.25,112.75},
['Bali']={-8.65,115.22},
['Nusa Tenggara Barat']={-8.58,116.11},
['Nusa Tenggara Timur']={-10.17,123.61},
['Kalimantan Barat']={-0.03,109.34},
['Kalimantan Tengah']={-2.21,113.92},
['Kalimantan Selatan']={-3.32,114.59},
['Kalimantan Timur']={-0.50,117.15},
['Kalimantan Utara']={2.84,117.37},
['Sulawesi Utara']={1.47,124.84},
['Gorontalo']={0.54,123.06},
['Sulawesi Tengah']={-0.90,119.87},
['Sulawesi Barat']={-2.68,118.89},
['Sulawesi Selatan']={-5.14,119.43},
['Sulawesi Tenggara']={-3.98,122.51},
['Maluku']={-3.70,128.18},
['Maluku Utara']={0.79,127.38},
['Papua']={-2.53,140.72},
['Papua Barat']={-0.86,134.06},
['Papua Barat Daya']={-0.88,131.25},
['Papua Tengah']={-3.36,135.50},
['Papua Pegunungan']={-4.10,138.95},
['Papua Selatan']={-8.49,140.40},
}
F.CUSTOM_METHODS={
{name='Kemenag / MABIMS',fajr=20.0,isha=18.0,asr=1.0,mid=20,desc='Subuh 20°, Isya 18°'},
{name='Muslim World League (MWL)',fajr=18.0,isha=17.0,asr=1.0,mid=3,desc='Subuh 18°, Isya 17°'},
{name='Umm Al-Qura (Makkah)',fajr=18.5,isha_fixed=90,asr=1.0,mid=4,desc='Subuh 18.5°, Isya +90m'},
{name='Egyptian Gen. Authority',fajr=19.5,isha=17.5,asr=1.0,mid=5,desc='Subuh 19.5°, Isya 17.5°'},
{name='ISNA (North America)',fajr=15.0,isha=15.0,asr=1.0,mid=2,desc='Subuh 15°, Isya 15°'},
{name='Univ. Karachi (Hanafi)',fajr=18.0,isha=18.0,asr=2.0,mid=1,desc='Subuh 18°, Isya 18°, Ashar 2x'},
}
local function _PWC()
local C={
{name='Indonesia',is_id=true,method_id=20,cities_count='38 Provinsi',cities={}},
{name='Koordinat Manual (GPS)',name_en='Manual GPS Coordinates',is_custom=true,cities_count='Lat/Long',cities={}}
}
local function U(cname,mid,ccount,data)
local list={}
for s in data:gmatch('[^;]+')do
local n,la,lo,tz,m,f,i,fx=s:match('^([^:]+):([^:]+):([^:]+):([^:]+):([^:]+):?([^:]*):?([^:]*):?([^:]*)$')
if n then
list[#list+1]={
name=n,lat=tonumber(la),lon=tonumber(lo),tz=tonumber(tz),method=m,
fajr_ang=tonumber(f)or 18.0,isha_ang=tonumber(i)or 18.0,isha_fixed_min=tonumber(fx)
}
end
end
C[#C+1]={name=cname,method_id=mid,cities_count=ccount,cities=list}
end
U('Arab Saudi',4,'8 Kota','Makkah:21.4225:39.8262:3:Umm Al-Qura:18.5:18.0:90;Madinah:24.4672:39.6111:3:Umm Al-Qura:18.5:18.0:90;Riyadh:24.7136:46.6753:3:Umm Al-Qura:18.5:18.0:90;Jeddah:21.5433:39.1728:3:Umm Al-Qura:18.5:18.0:90;Dammam:26.4207:50.0888:3:Umm Al-Qura:18.5:18.0:90;Taif:21.2854:40.4244:3:Umm Al-Qura:18.5:18.0:90;Tabuk:28.3835:36.5662:3:Umm Al-Qura:18.5:18.0:90;Abha:18.2164:42.5053:3:Umm Al-Qura:18.5:18.0:90')
U('Malaysia',17,'9 Kota','Kuala Lumpur:3.1390:101.6869:8:JAKIM:20.0:18.0:;Putrajaya:2.9264:101.6964:8:JAKIM:20.0:18.0:;George Town (Penang):5.4141:100.3288:8:JAKIM:20.0:18.0:;Johor Bahru:1.4927:103.7414:8:JAKIM:20.0:18.0:;Shah Alam (Selangor):3.0738:101.5183:8:JAKIM:20.0:18.0:;Kota Kinabalu (Sabah):5.9804:116.0735:8:JAKIM:20.0:18.0:;Kuching (Sarawak):1.5533:110.3592:8:JAKIM:20.0:18.0:;Ipoh (Perak):4.5975:101.0901:8:JAKIM:20.0:18.0:;Melaka:2.1896:102.2501:8:JAKIM:20.0:18.0:')
U('Singapura',11,'1 Kota','Singapore:1.3521:103.8198:8:MUIS:20.0:18.0:')
U('Brunei Darussalam',17,'2 Kota','Bandar Seri Begawan:4.9031:114.9398:8:KHEU:20.0:18.0:;Kuala Belait:4.5836:114.2312:8:KHEU:20.0:18.0:')
U('Turki',13,'6 Kota','Istanbul:41.0082:28.9784:3:Diyanet:18.0:17.0:;Ankara:39.9334:32.8597:3:Diyanet:18.0:17.0:;Bursa:40.1885:29.0610:3:Diyanet:18.0:17.0:;Konya:37.8714:32.4846:3:Diyanet:18.0:17.0:;Izmir:38.4237:27.1428:3:Diyanet:18.0:17.0:;Antalya:36.8969:30.7133:3:Diyanet:18.0:17.0:')
U('Mesir',5,'5 Kota','Kairo:30.0444:31.2357:2:Egypt General:19.5:17.5:;Alexandria:31.2001:29.9187:2:Egypt General:19.5:17.5:;Giza:30.0131:31.2089:2:Egypt General:19.5:17.5:;Luxor:25.6872:32.6396:2:Egypt General:19.5:17.5:;Aswan:24.0889:32.8998:2:Egypt General:19.5:17.5:')
U('Uni Emirat Arab',16,'5 Kota','Dubai:25.2048:55.2708:4:UAE Awqaf:18.2:18.2:;Abu Dhabi:24.4539:54.3773:4:UAE Awqaf:18.2:18.2:;Sharjah:25.3463:55.4209:4:UAE Awqaf:18.2:18.2:;Ajman:25.4052:55.5136:4:UAE Awqaf:18.2:18.2:;Al Ain:24.2075:55.7447:4:UAE Awqaf:18.2:18.2:')
U('Palestina',23,'5 Kota','Al-Quds (Yerusalem):31.7683:35.2137:3:MWL:18.0:17.0:;Gaza:31.5017:34.4668:3:MWL:18.0:17.0:;Ramallah:31.9038:35.2034:3:MWL:18.0:17.0:;Hebron (Al-Khalil):31.5326:35.0998:3:MWL:18.0:17.0:;Nablus:32.2227:35.2621:3:MWL:18.0:17.0:')
U('Qatar',10,'3 Kota','Doha:25.2854:51.5310:3:Qatar Awqaf:18.0:18.0:;Al Rayyan:25.2919:51.4244:3:Qatar Awqaf:18.0:18.0:;Al Wakrah:25.1768:51.6048:3:Qatar Awqaf:18.0:18.0:')
U('Kuwait',9,'2 Kota','Kuwait City:29.3759:47.9774:3:Kuwait Awqaf:18.0:17.5:;Hawalli:29.3328:48.0283:3:Kuwait Awqaf:18.0:17.5:')
U('Yordania',23,'3 Kota','Amman:31.9539:35.9106:3:Jordan Awqaf:18.0:18.0:;Zarqa:32.0728:36.0880:3:Jordan Awqaf:18.0:18.0:;Irbid:32.5568:35.8469:3:Jordan Awqaf:18.0:18.0:')
U('Maroko',21,'5 Kota','Casablanca:33.5731:-7.5898:1:Morocco Awqaf:19.0:17.0:;Rabat:34.0209:-6.8416:1:Morocco Awqaf:19.0:17.0:;Marrakech:31.6295:-7.9811:1:Morocco Awqaf:19.0:17.0:;Fes:34.0181:-5.0078:1:Morocco Awqaf:19.0:17.0:;Tangier:35.7595:-5.8340:1:Morocco Awqaf:19.0:17.0:')
U('Jepang',3,'6 Kota','Tokyo:35.6762:139.6503:9:Japan Muslim Assoc:18.0:18.0:;Osaka:34.6937:135.5023:9:Japan Muslim Assoc:18.0:18.0:;Kyoto:35.0116:135.7681:9:Japan Muslim Assoc:18.0:18.0:;Nagoya:35.1815:136.9066:9:Japan Muslim Assoc:18.0:18.0:;Fukuoka:33.5902:130.4017:9:Japan Muslim Assoc:18.0:18.0:;Sapporo:43.0618:141.3545:9:Japan Muslim Assoc:18.0:18.0:')
U('Korea Selatan',3,'4 Kota','Seoul:37.5665:126.9780:9:Korea Muslim Fed:18.0:18.0:;Busan:35.1796:129.0756:9:Korea Muslim Fed:18.0:18.0:;Incheon:37.4563:126.7052:9:Korea Muslim Fed:18.0:18.0:;Daegu:35.8714:128.6014:9:Korea Muslim Fed:18.0:18.0:')
U('Australia',3,'6 Kota','Sydney:-33.8688:151.2093:10:Muslim World League:18.0:17.0:;Melbourne:-37.8136:144.9631:10:Muslim World League:18.0:17.0:;Brisbane:-27.4698:153.0251:10:Muslim World League:18.0:17.0:;Perth:-31.9505:115.8605:8:Muslim World League:18.0:17.0:;Adelaide:-34.9285:138.6007:9.5:Muslim World League:18.0:17.0:;Canberra:-35.2809:149.1300:10:Muslim World League:18.0:17.0:')
U('Inggris (UK)',3,'5 Kota','London:51.5074:-0.1278:0:London Central Mosque:18.0:18.0:;Birmingham:52.4862:-1.8904:0:MWL:18.0:18.0:;Manchester:53.4808:-2.2426:0:MWL:18.0:18.0:;Leeds:53.8008:-1.5491:0:MWL:18.0:18.0:;Glasgow:55.8642:-4.2518:0:MWL:18.0:18.0:')
U('Amerika Serikat (USA)',2,'6 Kota','New York:40.7128:-74.0060:-5:ISNA:15.0:15.0:;Los Angeles:34.0522:-118.2437:-8:ISNA:15.0:15.0:;Chicago:41.8781:-87.6298:-6:ISNA:15.0:15.0:;Houston:29.7604:-95.3698:-6:ISNA:15.0:15.0:;Washington D.C.:38.9072:-77.0369:-5:ISNA:15.0:15.0:;San Francisco:37.7749:-122.4194:-8:ISNA:15.0:15.0:')
U('Jerman',3,'5 Kota','Berlin:52.5200:13.4050:1:MWL:18.0:17.0:;Frankfurt:50.1109:8.6821:1:MWL:18.0:17.0:;Munich:48.1351:11.5820:1:MWL:18.0:17.0:;Hamburg:53.5511:9.9937:1:MWL:18.0:17.0:;Cologne:50.9375:6.9603:1:MWL:18.0:17.0:')
U('Prancis',12,'3 Kota','Paris:48.8566:2.3522:1:UOIF:12.0:12.0:;Lyon:45.7640:4.8357:1:UOIF:12.0:12.0:;Marseille:43.2965:5.3698:1:UOIF:12.0:12.0:')
U('Belanda',3,'3 Kota','Amsterdam:52.3676:4.9041:1:MWL:18.0:17.0:;Rotterdam:51.9244:4.4777:1:MWL:18.0:17.0:;Den Haag:52.0705:4.3007:1:MWL:18.0:17.0:')
U('Rusia',14,'3 Kota','Moskwa:55.7558:37.6173:3:Russia DUM:16.0:15.0:;St. Petersburg:59.9343:30.3351:3:Russia DUM:16.0:15.0:;Kazan:55.7963:49.1088:3:Russia DUM:16.0:15.0:')
U('Tiongkok',3,'4 Kota','Beijing:39.9042:116.4074:8:MWL:18.0:17.0:;Shanghai:31.2304:121.4737:8:MWL:18.0:17.0:;Guangzhou:23.1291:113.2644:8:MWL:18.0:17.0:;Ürümqi:43.8256:87.6168:6:MWL:18.0:17.0:')
U('Pakistan',1,'3 Kota','')
U('India',1,'3 Kota','')
return C
end
F.WORLD_COUNTRIES=_PWC()
function F.compute_qibla(prov,cfg)
local lat_deg=(cfg and cfg.lat)or(prov and F.PROV_COORDS[prov] and F.PROV_COORDS[prov][1])or -6.21
local lon_deg=(cfg and cfg.lon)or(prov and F.PROV_COORDS[prov] and F.PROV_COORDS[prov][2])or 106.85
local lat1=lat_deg*math.pi / 180.0
local lon1=lon_deg*math.pi / 180.0
local lat2=21.4225*math.pi / 180.0
local lon2=39.8262*math.pi / 180.0
local dlon=lon2 - lon1
local y=math.sin(dlon)*math.cos(lat2)
local x=math.cos(lat1)*math.sin(lat2)- math.sin(lat1)*math.cos(lat2)*math.cos(dlon)
local brng=math.atan(y,x)*180.0 / math.pi
brng=(brng+360.0)% 360.0
local cos_d=math.sin(lat1)*math.sin(lat2)+math.cos(lat1)*math.cos(lat2)*math.cos(dlon)
if cos_d>1 then cos_d=1 elseif cos_d<-1 then cos_d=-1 end
local dist_km=math.floor(math.acos(cos_d)*6371.0+0.5)
return{
lat=lat_deg,
lon=lon_deg,
deg=math.floor(brng+0.5),
from_north_west=math.floor(360.0 - brng+0.5),
dist_km=dist_km,
}
end
function F.wrap_lines(s,fname,max_w)
local out={}
local line=''
for word in tostring(s or ''):gmatch('%S+')do
local cand=(line=='')and word or(line .. ' ' .. word)
if line ~='' and S.text_w(cand,fname)>max_w then
out[#out+1]=line
line=word
else
line=cand
end
end
if line ~='' then out[#out+1]=line end
return out
end
function F.draw_tasbih(gg,cfg,tsb,draw_btn,now_info)
local W=S.W
local is_en=(cfg.lang=='en')
local title,latin,arti,sub_stage=F.active_dhikr_text(tsb,is_en)
gg:text(20,18,is_en and 'Digital Tasbih' or 'Tasbih Digital',{font=S.font('large')})
if now_info and now_info.hhmm then
gg:text(W - 128,20,now_info.hhmm,{font=S.font('medium')})
end
S.draw_hamburger_btn(gg,W - 50,20)
S.card(gg,20,56,W - 40,160,2,true)
S.center_text(gg,W // 2,66,title,'small',400)
local lat_lines
local lf='medium'
if S.text_w(latin,'medium')<=400 then
lat_lines={latin}
else
if S.text_w(latin,'small')<=400 then
lat_lines={latin}
lf='small'
else
lat_lines=F.wrap_lines(latin,'small',400)
lf='small'
end
end
local cur_y=92
if #lat_lines==1 then
S.center_text(gg,W // 2,cur_y+2,lat_lines[1],lf,400)
cur_y=cur_y+(lf=='medium' and 28 or 24)
else
for _,line in ipairs(lat_lines)do
S.center_text(gg,W // 2,cur_y,line,lf,400)
cur_y=cur_y+22
end
end
local arti_lines=F.wrap_lines('"' .. arti .. '"','small',400)
cur_y=math.max(cur_y+4,126)
for _,line in ipairs(arti_lines)do
S.center_text(gg,W // 2,cur_y,line,'small',400)
cur_y=cur_y+22
end
if sub_stage ~='' then
S.center_text(gg,W // 2,190,sub_stage,'small',400)
else
local tgt_s=(tsb.target==0)and(is_en and 'Target: Infinity' or 'Target: Tanpa Batas')
or('Target: ' .. tostring(tsb.target).. 'x')
S.center_text(gg,W // 2,190,tgt_s,'small',400)
end
local cx,cy,R=W // 2,384,130
gg:line(cx,cy - R - 18,cx,cy - R - 6,{line_width=2})
S.diamond(gg,cx,cy - R - 20,4,true)
gg:circle(cx,cy,R - 18,{line_width=1})
local active_beads=tsb.count % 33
if tsb.count>0 and active_beads==0 then active_beads=33 end
for b=1,33 do
local ang=(b - 1)*(2.0*math.pi / 33.0)-(math.pi / 2.0)
local bx=cx+math.floor(R*math.cos(ang)+0.5)
local by=cy+math.floor(R*math.sin(ang)+0.5)
local is_marker=(b==11 or b==22 or b==33)
local rad=is_marker and 7 or 5
if b<=active_beads then
gg:circle(bx,by,rad,{fill=true})
if b==active_beads then
gg:circle(bx,by,rad+3,{line_width=2})
end
else
gg:circle(bx,by,rad,{line_width=is_marker and 2 or 1})
end
end
local cnt_str=tostring(tsb.count or 0)
S.big_clock(gg,cnt_str,cx,cy - 56,82,cfg.cfont)
local lap=(tsb.target and tsb.target>0)and(tsb.count // tsb.target)or(tsb.count // 33)
local sub_ring=(is_en and 'Lap: ' or 'Putaran: ').. tostring(lap)..
'  |  ' .. tostring(active_beads).. '/33'
S.center_text(gg,cx,cy+30,sub_ring,'small',180)
S.center_text(gg,cx,cy+54,is_en and '[ Tap / OK ]' or '[ Ketuk / OK ]','small',160)
local stat_s=(is_en and 'Today: ' or 'Hari ini: ').. tostring(tsb.today or 0)..
'  •  Total: ' .. tostring(tsb.total or 0)
S.center_text(gg,W // 2,546,stat_s,'small',W - 40)
local bw_ctl=104
local tgt_btn=(tsb.target==0)and 'Tgt: ~' or('Tgt: ' .. tostring(tsb.target))
draw_btn(gg,20+0*112,574,bw_ctl,54,is_en and '< Prev' or '< Dzikir',false,'small')
draw_btn(gg,20+1*112,574,bw_ctl,54,is_en and 'Next >' or 'Dzikir >',false,'small')
draw_btn(gg,20+2*112,574,bw_ctl,54,tgt_btn,false,'small')
draw_btn(gg,20+3*112,574,bw_ctl,54,'Reset 0',false,'small')
S.round_rect(gg,20,642,W - 40,132,14,nil,true,0)
S.round_rect(gg,20,642,W - 40,132,14,2)
S.round_rect(gg,23,645,W - 46,126,11,1)
S.center_text(gg,W // 2,674,is_en and '+ TAP TO COUNT' or '+ KETUK UNTUK HITUNG','large')
S.center_text(gg,W // 2,718,is_en and '[ Tap Screen or OK Button ]' or '[ Ketuk Layar atau Tombol OK ]','small')
end
function F.draw_doa(gg,cfg,doa_idx,doa_list_mode,draw_btn,now_info)
local W=S.W
local is_en=(cfg.lang=='en')
local total=#F.DUA_LIST
if doa_idx<1 or doa_idx>total then doa_idx=1 end
local d=F.DUA_LIST[doa_idx]
gg:text(20,18,is_en and 'Daily Duas & Adhkar' or 'Doa & Dzikir Pilihan',{font=S.font('large')})
if now_info and now_info.hhmm then
gg:text(W - 128,20,now_info.hhmm,{font=S.font('medium')})
end
S.draw_hamburger_btn(gg,W - 50,20)
if doa_list_mode then
local card_h=total*63
S.round_rect(gg,20,60,W - 40,card_h,14,nil,true,0)
S.round_rect(gg,20,60,W - 40,card_h,14,2)
for i=1,total do
local item=F.DUA_LIST[i]
local ry=60+(i - 1)*63
local is_sel=(i==doa_idx)
if i>1 then
gg:line(36,ry,W - 36,ry,{line_width=1})
end
if is_sel then
S.round_rect(gg,24,ry+4,W - 48,55,8,2)
end
gg:circle(42,ry+31,is_sel and 4 or 2,{fill=true})
local t_str=is_en and item.title_en or item.title_id
local tf=(S.text_w(t_str,'medium')<=W - 96)and 'medium' or 'small'
local ty=(tf=='medium')and(ry+18)or(ry+21)
gg:text(56,ty,S.fit_text(t_str,tf,W - 96),{font=S.font(tf)})
end
draw_btn(gg,20,712,W - 40,58,is_en and 'Close List' or 'Tutup Daftar',false,'medium')
else
S.card(gg,20,58,W - 40,82,2,true)
S.center_text(gg,W // 2,68,is_en and d.cat_en or d.cat_id,'small',W - 64)
local t_str=is_en and d.title_en or d.title_id
local tf=(S.text_w(t_str,'medium')<=W - 64)and 'medium' or 'small'
local t_lines=F.wrap_lines(t_str,tf,W - 64)
if #t_lines==1 then
S.center_text(gg,W // 2,98,t_lines[1],tf,W - 64)
else
S.center_text(gg,W // 2,92,t_lines[1],tf,W - 64)
S.center_text(gg,W // 2,114,t_lines[2],tf,W - 64)
end
S.card(gg,20,148,W - 40,556,2,2)
gg:text(38,164,is_en and 'TRANSLITERATION:' or 'BACAAN LATIN:',{font=S.font('small')})
local lat_lines_m=F.wrap_lines(d.latin,'medium',W - 76)
local use_sml_lat=(#lat_lines_m>4)
local lat_lines=use_sml_lat and F.wrap_lines(d.latin,'small',W - 76)or lat_lines_m
local lat_font=use_sml_lat and 'small' or 'medium'
local lat_lh=use_sml_lat and 24 or 28
local ly=192
for _,line in ipairs(lat_lines)do
gg:text(38,ly,line,{font=S.font(lat_font)})
ly=ly+lat_lh
end
local div_y=ly+12
S.divider(gg,div_y,40,W - 40)
local m_y=div_y+12
gg:text(38,m_y,is_en and 'MEANING:' or 'ARTINYA:',{font=S.font('small')})
local arti_s=is_en and d.arti_en or d.arti_id
local arti_lines=F.wrap_lines('"' .. arti_s .. '"','small',W - 76)
local ay=m_y+24
for _,line in ipairs(arti_lines)do
gg:text(38,ay,line,{font=S.font('small')})
ay=ay+22
end
S.center_text(gg,W // 2,674,d.src,'small',W - 64)
draw_btn(gg,20,714,136,62,is_en and '< Prev' or '< Seb',false,'medium')
draw_btn(gg,172,714,136,62,is_en and 'All Duas' or 'Daftar Doa',false,'small')
draw_btn(gg,324,714,136,62,is_en and 'Next >' or 'Ber >',false,'medium')
end
end
function F.draw_hijri_screen(gg,cfg,now_info,draw_btn)
local W=S.W
local L=S.L(cfg)
local is_en=(cfg.lang=='en')
local hy,hm,hd,hijri_str,after_maghrib,eff_day=S.effective_hijri(now_info,cfg)
gg:text(20,18,is_en and 'Hijri & Islamic Days' or 'Kalender & Hari Islam',{font=S.font('large')})
if now_info and now_info.hhmm then
gg:text(W - 128,20,now_info.hhmm,{font=S.font('medium')})
end
S.draw_hamburger_btn(gg,W - 50,20)
S.card(gg,20,64,W - 40,126,2,true)
S.center_text(gg,W // 2,74,hijri_str,'large',W - 64)
local sub_note=after_maghrib
and(is_en and ' (Night)' or ' (Malam)')
or ' • MABIMS'
S.center_text(gg,W // 2,110,now_info.date_str .. sub_note,'small',W - 56)
local fast_str=F.sunnah_fast_info(now_info.wday,hd,L,is_en)
S.center_text(gg,W // 2,142,fast_str,'small',W - 56)
S.center_text(gg,W // 2,204,is_en and 'UPCOMING ISLAMIC DAYS' or 'HARI BESAR ISLAM TERDEKAT','small')
local evs=F.upcoming_events(eff_day,hy,cfg.adj or 0,L,is_en)
local card_h=456
S.round_rect(gg,20,226,W - 40,card_h,14,nil,true,0)
S.round_rect(gg,20,226,W - 40,card_h,14,2)
for i=1,6 do
local ev=evs[i]
if ev then
local ry=226+(i - 1)*76
if i>1 then
gg:line(36,ry,W - 36,ry,{line_width=1})
end
gg:circle(38,ry+38,(ev.diff==0)and 4 or 3,{fill=true})
if ev.diff==0 then
gg:circle(38,ry+38,7,{line_width=1})
end
local ev_f=(S.text_w(ev.name,'medium')<=305)and 'medium' or 'small'
local ev_y=(ev_f=='medium')and(ry+13)or(ry+16)
gg:text(52,ev_y,S.fit_text(ev.name,ev_f,305),{font=S.font(ev_f)})
gg:text(52,ry+42,ev.date_str,{font=S.font('small')})
local d_lbl
if ev.diff==0 then
d_lbl=is_en and 'Today!' or 'Hari Ini!'
else
d_lbl='+' .. tostring(ev.diff)..(is_en and ' d' or ' hr')
end
S.round_rect(gg,W - 116,ry+22,80,32,16,nil,true,0)
S.round_rect(gg,W - 116,ry+22,80,32,16,(ev.diff==0)and 2 or 1)
S.center_text(gg,W - 76,ry+28,d_lbl,'small',74)
end
end
draw_btn(gg,20,708,W - 40,68,is_en and 'View Hijri Calendar' or 'Buka Kalender Hijriah',false,'medium')
end
function F.get_hijri_event(hy,hm,hd,is_en,holiday_from_api)
if holiday_from_api and holiday_from_api ~='' then
return holiday_from_api
end
for i=1,#F.ISLAMIC_EVENTS do
local ev=F.ISLAMIC_EVENTS[i]
if ev.hm==hm and ev.hd==hd then
return is_en and ev.en or ev.id
end
end
if hm==9 and hd>=21 and(hd % 2==1)then
return is_en and('Lailat-ul-Qadr (' .. hd .. ' Ramadan)')or('Malam Lailatul Qadar (' .. hd .. ' Ramadhan)')
end
return nil
end
function F.get_fasting_info(hm,hd,wd,is_en)
local is_ramadan=(hm==9)
if is_ramadan then
return is_en and 'Obligatory Fast: Ramadan' or 'Puasa Wajib: Ramadhan'
end
if hm==10 and hd==1 then
return is_en and 'Forbidden to Fast: Eid al-Fitr' or 'Diharamkan Berpuasa: Hari Raya Idul Fitri'
end
if hm==12 and hd==10 then
return is_en and 'Forbidden to Fast: Eid al-Adha' or 'Diharamkan Berpuasa: Hari Raya Idul Adha'
end
if hm==12 and(hd>=11 and hd<=13)then
return is_en and 'Forbidden to Fast: Tashreeq Days' or 'Diharamkan Berpuasa: Hari Tasyrik'
end
if hm==12 and hd==9 then
return is_en and 'Sunnah Fast: Day of Arafah' or 'Puasa Sunnah: Hari Arafah'
end
if hm==1 and hd==9 then
return is_en and 'Sunnah Fast: Tasu\'a' or 'Puasa Sunnah: Tasu\'a'
end
if hm==1 and hd==10 then
return is_en and 'Sunnah Fast: Ashura' or 'Puasa Sunnah: Asyura'
end
local is_bidh=(hd>=13 and hd<=15)
local is_senin=(wd==1)
local is_kamis=(wd==4)
if is_bidh and(is_senin or is_kamis)then
local d_name=is_senin and(is_en and 'Monday' or 'Senin')or(is_en and 'Thursday' or 'Kamis')
return is_en and('Sunnah Fast: Ayyamul Bidh & ' .. d_name)or('Puasa Sunnah: Ayyamul Bidh & ' .. d_name)
elseif is_bidh then
return is_en and 'Sunnah Fast: Ayyamul Bidh (13, 14, 15)' or 'Puasa Sunnah: Ayyamul Bidh (13, 14, 15)'
elseif is_senin or is_kamis then
local d_name=is_senin and(is_en and 'Monday' or 'Senin')or(is_en and 'Thursday' or 'Kamis')
return is_en and('Sunnah Fast: ' .. d_name)or('Puasa Sunnah: ' .. d_name)
end
return is_en and 'Regular Day (No specific fast)' or 'Hari Biasa (Bukan waktu puasa khusus)'
end
function F.draw_hijri_cal_screen(gg,cfg,now_info,cur_hy,cur_hm,selected_hd,draw_btn)
local W=S.W
local L=S.L(cfg)
local is_en=(cfg.lang=='en')
local days,days_count=S.load_hijri_month(cur_hy,cur_hm,cfg)
days_count=days_count or 30
local now_hy,now_hm,now_hd=S.effective_hijri(now_info,cfg)
gg:text(20,18,is_en and 'Hijri Calendar' or 'Kalender Hijriah',{font=S.font('large')})
if now_info and now_info.hhmm then
gg:text(W - 128,20,now_info.hhmm,{font=S.font('medium')})
end
S.draw_hamburger_btn(gg,W - 50,20)
S.round_rect(gg,20,56,W - 40,64,14,nil,true,0)
S.round_rect(gg,20,56,W - 40,64,14,2)
draw_btn(gg,28,64,46,48,'<',false,'medium')
draw_btn(gg,W - 74,64,46,48,'>',false,'medium')
local m_title=L.hijri_bulan[cur_hm] .. ' ' .. tostring(cur_hy).. ' H'
S.center_text(gg,W // 2,64,m_title,'medium',W - 160)
if days and days[1] and days[days_count] then
local d1=days[1]
local dN=days[days_count]
local g_sub=string.format('%d %s – %d %s %d M',d1.gd,L.bulan_short[d1.gm],dN.gd,L.bulan_short[dN.gm],dN.gy)
S.center_text(gg,W // 2,92,g_sub,'small',W - 160)
end
S.round_rect(gg,20,126,W - 40,446,14,nil,true,0)
S.round_rect(gg,20,126,W - 40,446,14,2)
local hdrs=is_en
and{'SUN','MON','TUE','WED','THU','FRI','SAT'}
or{'AHD','SEN','SEL','RAB','KAM','JUM','SAB'}
local x0=23
local cw=62
for c=0,6 do
local col_cx=x0+c*cw+cw // 2
S.center_text(gg,col_cx,134,hdrs[c+1],'small')
end
gg:line(36,160,W - 36,160,{line_width=1})
local first_wd=(days and days[1] and days[1].wd)or 0
for hd=1,days_count do
local slot=first_wd+(hd - 1)
local c=slot % 7
local r=slot // 7
local cx=x0+c*cw
local cy=162+r*67
local cell_cx=cx+cw // 2
local d_info=days and days[hd] or{hd=hd,gd=hd,gm=1,gy=2026,wd=slot % 7}
local is_today=(cur_hy==now_hy and cur_hm==now_hm and hd==now_hd)
local is_sel=(hd==selected_hd)
if is_today then
gg:rect(cx+2,cy,cw - 4,65,{fill=true,radius=8})
elseif is_sel then
S.round_rect(gg,cx+2,cy,cw - 4,65,8,2)
end
local text_col=is_today and 0 or nil
S.center_text(gg,cell_cx,cy+4,tostring(hd),'medium',cw,text_col)
S.center_text(gg,cell_cx,cy+28,tostring(d_info.gd),'small',cw,text_col)
local ev_name=F.get_hijri_event(cur_hy,cur_hm,hd,is_en,d_info.holiday)
local is_bidh=(hd>=13 and hd<=15 and(cur_hm ~=12 or hd ~=13))
local is_fast=is_bidh or(d_info.wd==1 or d_info.wd==4)or(cur_hm==9)
if ev_name then
S.diamond(gg,cell_cx,cy+55,3,true,text_col)
elseif is_fast then
local c_opts={fill=true}
if text_col ~=nil then c_opts.color=text_col end
gg:circle(cell_cx,cy+55,2,c_opts)
end
end
S.round_rect(gg,20,578,W - 40,122,12,nil,true,0)
S.round_rect(gg,20,578,W - 40,122,12,2)
local sel_d=(days and days[selected_hd])or(days and days[1])or{hd=selected_hd or 1,gd=1,gm=1,gy=2026,wd=0}
local day_name=L.hari[sel_d.wd+1]
local h_line=string.format('%s, %d %s %d H',day_name,sel_d.hd,L.hijri_bulan[cur_hm],cur_hy)
S.center_text(gg,W // 2,586,h_line,'medium',W - 64)
local g_line=string.format('%d %s %d M',sel_d.gd,L.bulan[sel_d.gm],sel_d.gy)
S.center_text(gg,W // 2,614,g_line,'small',W - 64)
gg:line(36,638,W - 36,638,{line_width=1})
local ev_sel=F.get_hijri_event(cur_hy,cur_hm,sel_d.hd,is_en,sel_d.holiday)
local fast_sel=F.get_fasting_info(cur_hm,sel_d.hd,sel_d.wd,is_en)
if ev_sel then
S.center_text(gg,W // 2,646,'* ' .. ev_sel .. ' *','small',W - 64)
S.center_text(gg,W // 2,672,fast_sel,'small',W - 64)
else
S.center_text(gg,W // 2,658,fast_sel,'small',W - 64)
end
local btn_lbls=is_en
and{'< Prev','Today','Next >','Fetch'}
or{'< Bulan','Hari Ini','Bulan >','Unduh'}
local bw=(W - 40 - 24)// 4
for i=1,4 do
local bx=20+(i - 1)*(bw+8)
draw_btn(gg,bx,712,bw,64,btn_lbls[i],false,'small')
end
end
function F.draw_qibla_screen(gg,cfg,draw_btn,now_info)
local W=S.W
local is_en=(cfg.lang=='en')
local q=F.compute_qibla(cfg.prov,cfg)
gg:text(20,18,is_en and 'Qibla Direction' or 'Kompas Arah Kiblat',{font=S.font('large')})
if now_info and now_info.hhmm then
gg:text(W - 128,20,now_info.hhmm,{font=S.font('medium')})
end
S.draw_hamburger_btn(gg,W - 50,20)
S.card(gg,20,64,W - 40,74,2,true)
local sub_loc=(cfg.country=='Indonesia' or not cfg.country)and(cfg.prov or 'DKI Jakarta')or(cfg.country or 'Indonesia')
local loc_s=(cfg.kab or 'Kota Jakarta').. '  •  ' .. sub_loc
local loc_f=(S.text_w(loc_s,'medium')<=W - 56)and 'medium' or 'small'
S.center_text(gg,W // 2,72,loc_s,loc_f,W - 56)
local lat_dir=(q.lat<0)and(is_en and 'S' or 'LS')or(is_en and 'N' or 'LU')
local lon_dir=(q.lon>=0)and(is_en and 'E' or 'BT')or(is_en and 'W' or 'BB')
local coord_s=string.format('%.1f° %s, %.1f° %s  •  Makkah: %d km',
math.abs(q.lat),lat_dir,math.abs(q.lon),lon_dir,q.dist_km)
S.center_text(gg,W // 2,102,coord_s,'small',W - 48)
local cx,cy,R=W // 2,308,142
local hub_r=40
gg:circle(cx,cy,R,{line_width=2})
gg:circle(cx,cy,R - 6,{line_width=1})
gg:circle(cx,cy,hub_r,{fill=true,color=0})
gg:circle(cx,cy,hub_r,{line_width=2})
gg:circle(cx,cy,hub_r - 4,{line_width=1})
for deg=0,345,15 do
local rad=(deg - 90)*math.pi / 180.0
local r_in=(deg % 90==0)and(R - 18)or((deg % 30==0)and(R - 14)or(R - 10))
local x1=cx+math.floor(r_in*math.cos(rad)+0.5)
local y1=cy+math.floor(r_in*math.sin(rad)+0.5)
local x2=cx+math.floor((R - 6)*math.cos(rad)+0.5)
local y2=cy+math.floor((R - 6)*math.sin(rad)+0.5)
gg:line(x1,y1,x2,y2,{line_width=(deg % 90==0)and 2 or 1})
end
S.center_text(gg,cx,cy - R+20,is_en and 'N (0°)' or 'U (0°)','small')
S.center_text(gg,cx,cy+R - 42,'S (180°)','small')
gg:text(cx - R+22,cy - 12,is_en and 'W' or 'B',{font=S.font('small')})
S.right_text(gg,cx+R - 22,cy - 12,is_en and 'E' or 'T','small')
local q_rad=(q.deg - 90)*math.pi / 180.0
local perp=q_rad+math.pi / 2.0
local start_x=cx+math.floor(hub_r*math.cos(q_rad)+0.5)
local start_y=cy+math.floor(hub_r*math.sin(q_rad)+0.5)
local tip_r=R - 24
local tip_x=cx+math.floor(tip_r*math.cos(q_rad)+0.5)
local tip_y=cy+math.floor(tip_r*math.sin(q_rad)+0.5)
local base_r=R - 48
local bx1=cx+math.floor(base_r*math.cos(q_rad)+10*math.cos(perp)+0.5)
local by1=cy+math.floor(base_r*math.sin(q_rad)+10*math.sin(perp)+0.5)
local bx2=cx+math.floor(base_r*math.cos(q_rad)- 10*math.cos(perp)+0.5)
local by2=cy+math.floor(base_r*math.sin(q_rad)- 10*math.sin(perp)+0.5)
gg:line(start_x,start_y,tip_x,tip_y,{line_width=3})
gg:polygon({tip_x,tip_y,bx1,by1,bx2,by2},{fill=true})
local kx=cx+math.floor((R+18)*math.cos(q_rad)+0.5)
local ky=cy+math.floor((R+18)*math.sin(q_rad)+0.5)
gg:rect(kx - 9,ky - 9,18,18,{fill=true})
gg:rect(kx - 9,ky - 5,18,3,{fill=true,color=0})
S.center_text(gg,cx,cy - 14,tostring(q.deg).. '°','medium')
S.card(gg,20,478,W - 40,298,2,true)
local brng_title=is_en
and('Qibla Bearing: ' .. tostring(q.deg).. '° WNW')
or('Arah Kiblat: ' .. tostring(q.deg).. '° Barat Laut')
S.center_text(gg,W // 2,492,brng_title,'large',W - 64)
local sub_deg=is_en
and('(' .. tostring(q.from_north_west).. '° West from North)')
or('(' .. tostring(q.from_north_west).. '° ke kiri / Barat dari arah Utara)')
S.center_text(gg,W // 2,524,sub_deg,'small',W - 64)
S.divider(gg,554,44,W - 44)
if is_en then
S.center_text(gg,W // 2,572,'1. Point top of device toward North (N).','small',W - 48)
S.center_text(gg,W // 2,600,'2. Bold arrow & Ka\'bah point to Ka\'bah.','small',W - 48)
S.center_text(gg,W // 2,628,'3. Tap button below to change location.','small',W - 48)
draw_btn(gg,40,696,W - 80,56,'Change Location',false,'medium')
else
S.center_text(gg,W // 2,572,'1. Hadapkan atas perangkat ke Utara (U).','small',W - 48)
S.center_text(gg,W // 2,600,'2. Panah hitam tebal menunjuk ke Ka\'bah.','small',W - 48)
S.center_text(gg,W // 2,628,'3. Ketuk tombol di bawah untuk ubah kota.','small',W - 48)
draw_btn(gg,40,696,W - 80,56,'Ganti Wilayah',false,'medium')
end
end
function F.draw_settings_screen(gg,cfg,now_info,draw_btn,about_expanded,scroll_y,modal_open)
local W,H=S.W,S.H
local is_en=(cfg.lang=='en')
local _,_,_,hijri_str=S.effective_hijri(now_info,cfg)
scroll_y=scroll_y or 0
local sub_loc=(cfg.country=='Indonesia' or not cfg.country)and(cfg.prov or 'DKI Jakarta')or(cfg.country or 'Indonesia')
local loc_sub=(cfg.kab or 'Kota Jakarta').. ' • ' .. sub_loc
local fnames_id={
'1. Modern Bulat',
'2. Klasik Serif',
'3. Tegas Bold',
'4. Geometris Slab',
'5. Artistik Inline',
'6. Angka Arab'
}
local fnames_en={
'1. Modern Sans',
'2. Classic Serif',
'3. Bold Sans',
'4. Geometric Slab',
'5. Artistic Inline',
'6. Arabic Numerals'
}
local cfont_lbl=is_en and(fnames_en[cfg.cfont or 1] or fnames_en[1])or(fnames_id[cfg.cfont or 1] or fnames_id[1])
local adj=cfg.adj or 0
local adj_s
if adj==0 then
adj_s=is_en and 'Auto MABIMS (0 Day)' or 'Otomatis MABIMS (0 Hari)'
else
local sign=(adj>0)and('+' .. tostring(adj))or tostring(adj)
adj_s=is_en and('Manual (' .. sign .. ' Day)')or('Koreksi Manual (' .. sign .. ' Hari)')
end
local is_exp=(about_expanded==true)
local ab_body_h=is_exp and 680 or 0
local ab_h=64+ab_body_h
local total_content_bottom=622+ab_h+20
local viewport_bottom=726
local max_scroll=math.max(0,total_content_bottom - viewport_bottom)
local function vtext(x,y,s,opts)
if y>=64 and y<=704 then
gg:text(x,y,s,opts)
end
end
local function vcenter_text(x,y,s,font_name,max_w)
if y>=64 and y<=704 then
S.center_text(gg,x,y,s,font_name,max_w)
end
end
local function vdivider(y,x1,x2)
if y>=60 and y<=720 then
gg:line(x1 or 36,y,x2 or(W - 36),y,{line_width=1})
end
end
local card1_y=66 - scroll_y
if(card1_y+544)>=60 and card1_y<=726 then
S.round_rect(gg,20,card1_y,W - 40,544,14,nil,true,0)
S.round_rect(gg,20,card1_y,W - 40,544,14,2)
end
for i=1,7 do
local ly=card1_y+i*68
if ly>=60 and ly<=720 then
gg:line(36,ly,W - 36,ly,{line_width=1})
end
end
local ry1=card1_y
vtext(36,ry1+12,is_en and 'App Language' or 'Bahasa Aplikasi',{font=S.font('medium')})
vtext(36,ry1+38,is_en and 'English (EN)' or 'Bahasa Indonesia (ID)',{font=S.font('small')})
if ry1>=40 and ry1<=680 then
local lang_idx=(cfg.lang=='en')and 2 or 1
S.segmented_control(gg,W - 142,ry1+15,106,38,{'ID','EN'},lang_idx)
end
local ry2=card1_y+68
vtext(36,ry2+12,is_en and 'Prayer Location' or 'Lokasi Wilayah',{font=S.font('medium')})
vtext(36,ry2+38,S.fit_text(loc_sub,'small',295),{font=S.font('small')})
if ry2>=40 and ry2<=680 then
draw_btn(gg,W - 134,ry2+15,98,38,is_en and 'Change...' or 'Ubah...',false,'small')
end
local ry3=card1_y+136
vtext(36,ry3+12,is_en and 'Clock & Counter Font' or 'Gaya Font Jam',{font=S.font('medium')})
vtext(36,ry3+38,cfont_lbl,{font=S.font('small')})
if ry3>=40 and ry3<=680 then
draw_btn(gg,W - 124,ry3+15,88,38,is_en and 'Select >' or 'Pilih >',false,'small')
end
local ry4=card1_y+204
vtext(36,ry4+12,is_en and 'Hijri Calibration' or 'Koreksi Hijriah',{font=S.font('medium')})
vtext(36,ry4+38,S.fit_text(adj_s,'small',265),{font=S.font('small')})
if ry4>=40 and ry4<=680 then
local adj_idx=(adj==-1 and 1)or(adj==0 and 2)or(adj==1 and 3)or 2
S.segmented_control(gg,W - 176,ry4+15,140,38,{'-1','0','+1'},adj_idx)
end
local ry5=card1_y+272
vtext(36,ry5+12,is_en and 'Maghrib Rollover' or 'Ganti Hari Maghrib',{font=S.font('medium')})
local magh_sub=(cfg.maghrib ~=false)
and(is_en and 'Active at Maghrib' or 'Aktif saat Maghrib')
or(is_en and 'At 00:00 (Midnight)' or 'Pukul 00:00 (Tengah Malam)')
vtext(36,ry5+38,S.fit_text(magh_sub,'small',240),{font=S.font('small')})
if ry5>=40 and ry5<=680 then
local magh_idx=(cfg.maghrib ~=false)and 2 or 1
local magh_seg=is_en and 'Sunset' or 'Maghrib'
S.segmented_control(gg,W - 200,ry5+15,180,38,{'00:00',magh_seg},magh_idx)
end
local ry6=card1_y+340
vtext(36,ry6+12,is_en and 'Prayer Lockscreen' or 'Mode Lockscreen',{font=S.font('medium')})
local lock_sub=cfg.lock
and(is_en and 'Active on lockscreen' or 'Aktif di layar kunci')
or(is_en and 'Disabled' or 'Tidak aktif')
vtext(36,ry6+38,lock_sub,{font=S.font('small')})
if ry6>=40 and ry6<=680 then
local lock_idx=cfg.lock and 2 or 1
S.segmented_control(gg,W - 146,ry6+15,110,38,{'OFF','ON'},lock_idx)
end
local ry7=card1_y+408
vtext(36,ry7+12,is_en and 'Ayah Quote Refresh' or 'Rotasi Ayat Lockscreen',{font=S.font('medium')})
local qref_names_id={'Tiap Hari','Tiap Waktu Shalat','Tiap Jam','Offline Saja'}
local qref_names_en={'Daily','Prayer Times','Hourly','Offline Only'}
local qref_cur=cfg.qrefresh or 1
local qref_sub=is_en and qref_names_en[qref_cur] or qref_names_id[qref_cur]
vtext(36,ry7+38,qref_sub,{font=S.font('small')})
if ry7>=40 and ry7<=680 then
draw_btn(gg,W - 124,ry7+15,88,38,is_en and 'Select >' or 'Pilih >',false,'small')
end
local ry8=card1_y+476
vtext(36,ry8+12,is_en and 'App Auto-Update' or 'Pembaruan Aplikasi',{font=S.font('medium')})
local up_sub=is_en and('Version ' .. S.APP_VERSION .. ' • Check GitHub')or('Versi ' .. S.APP_VERSION .. ' • Cek rilis GitHub')
vtext(36,ry8+38,S.fit_text(up_sub,'small',250),{font=S.font('small')})
if ry8>=40 and ry8<=680 then
draw_btn(gg,W - 124,ry8+15,88,38,is_en and 'Check >' or 'Cek >',false,'small')
end
local card2_y=622 - scroll_y
if(card2_y+ab_h)>=60 and card2_y<=726 then
S.card(gg,20,card2_y,W - 40,ab_h,2,is_exp)
end
local title_ab=is_en and 'About MuslimInk' or 'Tentang MuslimInk'
local sub_ab=is_en and('Version ' .. S.APP_VERSION .. ' • By fiqsr')or('Versi ' .. S.APP_VERSION .. ' • Oleh fiqsr')
vtext(36,card2_y+12,title_ab,{font=S.font('medium')})
vtext(36,card2_y+38,sub_ab,{font=S.font('small')})
if card2_y>=40 and card2_y<=680 then
local tx,ty=W - 44,card2_y+32
if is_exp then
gg:polygon({tx - 6,ty - 3,tx+6,ty - 3,tx,ty+5},{fill=true})
else
gg:polygon({tx - 4,ty - 6,tx+4,ty,tx - 4,ty+6},{fill=true})
end
end
if is_exp then
local dy=card2_y+64
vdivider(dy)
dy=dy+10
vtext(36,dy,is_en and 'DEVELOPER & PROJECT' or 'PENGEMBANG & PROYEK',{font=S.font('small')})
dy=dy+22
vtext(36,dy,'Developer : fiqsr (Syafiq)',{font=S.font('small')})
dy=dy+20
vtext(36,dy,'GitHub    : github.com/fiqsr',{font=S.font('small')})
dy=dy+20
vtext(36,dy,'Repo      : MuslimInk-XTEINK-X4-PRO',{font=S.font('small')})
dy=dy+20
vtext(36,dy,is_en and 'License   : Open Source (MIT License)' or 'Lisensi   : Open Source (MIT License)',{font=S.font('small')})
dy=dy+20
vtext(36,dy,is_en and('App Vers. : v' .. S.APP_VERSION .. ' (Build ' .. S.APP_BUILD .. ')')or('Versi App : v' .. S.APP_VERSION .. ' (Build ' .. S.APP_BUILD .. ')'),{font=S.font('small')})
dy=dy+26
vdivider(dy - 8)
vtext(36,dy,is_en and 'PRAYER & CALCULATION ENGINE' or 'SISTEM HISAB & ASTRONOMIS',{font=S.font('small')})
dy=dy+22
vtext(36,dy,is_en and 'Indonesia : Kemenag RI (514 Kab/Kota)' or 'Indonesia : Kemenag RI (514 Kab/Kota)',{font=S.font('small')})
dy=dy+20
vtext(36,dy,is_en and 'Global/LN : Aladhan API (230+ Kota)' or 'Global/LN : Aladhan API (230+ Kota)',{font=S.font('small')})
dy=dy+20
vtext(36,dy,is_en and 'Methods   : Ummul Quro, MWL, MUIS, dll' or 'Metode LN : Ummul Quro, MWL, MUIS, dll',{font=S.font('small')})
dy=dy+20
vtext(36,dy,is_en and 'Offline   : Hisab Surya Meeus & MABIMS' or 'Offline   : Hisab Surya Meeus & MABIMS',{font=S.font('small')})
dy=dy+20
vtext(36,dy,is_en and 'GPS Coords: Custom Lat/Lon/TZ Numpad' or 'Koordinat : GPS Input Manual Numpad',{font=S.font('small')})
dy=dy+20
vtext(36,dy,is_en and 'Qibla Dir : Kaaba (Great-Circle Math)' or 'Arah Kiblat: Ka\'bah (Trigonometri Bola)',{font=S.font('small')})
dy=dy+26
vdivider(dy - 8)
vtext(36,dy,is_en and 'HARDWARE & COMPATIBILITY' or 'SPESIFIKASI & PERANGKAT',{font=S.font('small')})
dy=dy+22
vtext(36,dy,is_en and 'Hardware  : XTEINK X4 Pro ONLY' or 'Perangkat : Khusus XTEINK X4 Pro',{font=S.font('small')})
dy=dy+20
vtext(36,dy,is_en and 'Display   : 480x800 1-bit E-ink Monokrom' or 'Layar     : 480x800 1-bit E-ink Monokrom',{font=S.font('small')})
dy=dy+20
vtext(36,dy,is_en and 'Lockscreen: Standalone Service (60s)' or 'Lockscreen: Layar Kunci Mandiri (60s)',{font=S.font('small')})
dy=dy+20
vtext(36,dy,is_en and 'Auto-Updt : 64 KB Chunked Downloader' or 'Updater   : Chunked Range 64 KB (Aman)',{font=S.font('small')})
dy=dy+20
vtext(36,dy,'Status    : ' .. S.short(loc_sub,26),{font=S.font('small')})
dy=dy+26
vdivider(dy - 8)
vtext(36,dy,is_en and 'GITHUB REPOSITORY (SCAN QR)' or 'REPOSITORI GITHUB (PINDAI QR)',{font=S.font('small')})
dy=dy+20
local qr_tip=is_en and 'Scan with phone camera to open GitHub repo:' or 'Pindai dengan kamera HP untuk buka proyek:'
vtext(36,dy,qr_tip,{font=S.font('small')})
dy=dy+30
local qr_sz=140
if(dy - 10)>=60 and(dy+qr_sz+10)<=720 then
S.draw_qr(gg,S.PROJECT_GITHUB_URL,W // 2,dy,qr_sz)
end
dy=dy+qr_sz+18
local gh_lbl='github.com/fiqsr/MuslimInk-XTEINK-X4-PRO'
vcenter_text(W // 2,dy,gh_lbl,'small')
dy=dy+22
local gh_note=is_en and 'Source Code • Panduan • Rilis • Dukungan' or 'Source Code • Panduan • Rilis • Dukungan'
vcenter_text(W // 2,dy,gh_note,'small')
end
gg:rect(0,0,W,56,{fill=true,color=0})
gg:line(0,56,W,56,{line_width=1})
gg:text(24,18,is_en and 'Settings & About' or 'Pengaturan & Info',{font=S.font('large')})
if now_info and now_info.hhmm then
gg:text(W - 128,20,now_info.hhmm,{font=S.font('medium')})
end
S.draw_hamburger_btn(gg,W - 50,20)
gg:rect(0,726,W,74,{fill=true,color=0})
gg:line(0,726,W,726,{line_width=1})
draw_btn(gg,20,736,W - 40,52,is_en and 'Done' or 'Selesai',true,'medium')
if max_scroll>0 and not modal_open then
local track_top=62
local track_h=658
local thumb_h=math.max(48,math.floor(track_h*(viewport_bottom - 56)/ total_content_bottom))
local thumb_y=track_top+math.floor((track_h - thumb_h)*(scroll_y / max_scroll))
gg:rect(W - 6,track_top,4,track_h,{fill=true,color=0})
gg:rect(W - 6,thumb_y,4,thumb_h,{fill=true,radius=2})
end
end
function F.draw_cfont_modal(gg,cfg,now_info,draw_btn)
local W,H=S.W,S.H
local is_en=(cfg.lang=='en')
local mx,my,mw,mh=20,84,W - 40,632
for sy=0,H,4 do
gg:line(0,sy,W,sy,{line_width=1})
end
gg:rect(mx,my,mw,mh,{fill=true,color=0})
S.round_rect(gg,mx,my,mw,mh,16,nil,true,0)
S.round_rect(gg,mx,my,mw,mh,16,2)
S.sheet_grabber(gg,W // 2,my+10)
local title=is_en and 'Clock & Counter Font' or 'Gaya Font Jam & Counter'
local sub=is_en and 'Tap font to preview & select' or 'Ketuk font untuk memilih gaya angka'
gg:text(mx+20,my+24,title,{font=S.font('medium')})
gg:text(mx+20,my+48,sub,{font=S.font('small')})
local cx,cy=mx+mw - 32,my+30
gg:line(cx - 7,cy - 7,cx+7,cy+7,{line_width=2})
gg:line(cx - 7,cy+7,cx+7,cy - 7,{line_width=2})
gg:line(mx+16,my+72,mx+mw - 16,my+72,{line_width=1})
local fnames_id={
'1. Modern Bulat',
'2. Klasik Serif',
'3. Tegas Bold',
'4. Geometris Slab',
'5. Artistik Inline',
'6. Angka Arab'
}
local fnames_en={
'1. Modern Rounded',
'2. Classic Serif',
'3. Bold Geometric',
'4. Geometric Slab',
'5. Artistic Inline',
'6. Arabic Numerals'
}
local fsubs_id={
'Sans bulat halus',
'Serif elegan',
'Sans tebal tegas',
'Slab retro kokoh',
'Garis ganda outline',
'Kaligrafi Islam Naskh'
}
local fsubs_en={
'Smooth rounded sans',
'Classy serif',
'Bold contrast sans',
'Geometric slab',
'Modern outline',
'Islamic Naskh Script'
}
local cur_cf=cfg.cfont or 1
local sample_time=(now_info and now_info.hhmm)or '12:34'
for i=1,6 do
local ry=my+78+(i - 1)*78
local rw=mw - 24
local rh=72
local rx=mx+12
local is_sel=(cur_cf==i)
if is_sel then
S.round_rect(gg,rx,ry,rw,rh,10,nil,true,0)
S.round_rect(gg,rx,ry,rw,rh,10,2)
else
S.round_rect(gg,rx,ry,rw,rh,10,nil,true,0)
S.round_rect(gg,rx,ry,rw,rh,10,1)
end
local cir_x=rx+20
local cir_y=ry+rh // 2
gg:circle(cir_x,cir_y,9,{line_width=2})
if is_sel then
gg:circle(cir_x,cir_y,5,{fill=true})
end
local fn=is_en and fnames_en[i] or fnames_id[i]
local fs=is_en and fsubs_en[i] or fsubs_id[i]
gg:text(rx+38,ry+14,fn,{font=S.font('medium')})
gg:text(rx+38,ry+40,fs,{font=S.font('small')})
local sample_cx=rx+rw - 64
S.big_clock(gg,sample_time,sample_cx,ry+14,44,i)
end
draw_btn(gg,mx+20,my+mh - 54,mw - 40,44,is_en and 'Close' or 'Tutup',true,'medium')
end
function F.draw_quote_modal(gg,cfg,draw_btn)
local W,H=S.W,S.H
local is_en=(cfg.lang=='en')
local mx,my,mw,mh=20,68,W - 40,636
for sy=0,H,4 do
gg:line(0,sy,W,sy,{line_width=1})
end
gg:rect(mx,my,mw,mh,{fill=true,color=0})
S.round_rect(gg,mx,my,mw,mh,16,nil,true,0)
S.round_rect(gg,mx,my,mw,mh,16,2)
S.sheet_grabber(gg,W // 2,my+10)
local title=is_en and 'Ayah Quote Refresh' or 'Rotasi Ayat Lockscreen'
local sub=is_en and 'Select how often ayah changes' or 'Pilih frekuensi pergantian ayat lockscreen'
gg:text(mx+20,my+22,title,{font=S.font('medium')})
gg:text(mx+20,my+44,sub,{font=S.font('small')})
local cx,cy=mx+mw - 32,my+28
gg:line(cx - 7,cy - 7,cx+7,cy+7,{line_width=2})
gg:line(cx - 7,cy+7,cx+7,cy - 7,{line_width=2})
gg:line(mx+16,my+66,mx+mw - 16,my+66,{line_width=1})
local qopts_id={
{'1. Tiap Hari (Harian)','Rotasi tiap hari 00:00 (Hemat baterai)'},
{'2. Tiap Waktu Shalat','Berganti setiap masuk waktu shalat'},
{'3. Tiap Jam Sekali','Berganti setiap jam saat layar aktif'},
{'4. Offline Saja','Gunakan 10 ayat lokal tanpa internet'},
}
local qopts_en={
{'1. Daily (Once a Day)','Changes once daily (Battery efficient)'},
{'2. Every Prayer Time','Changes at each next prayer time'},
{'3. Hourly (Every Hour)','Changes hourly when screen wakes up'},
{'4. Offline Only','Uses 10 offline ayahs (No network)'},
}
local cur_qr=cfg.qrefresh or 1
for i=1,4 do
local ry=my+72+(i - 1)*70
local rw=mw - 24
local rh=64
local rx=mx+12
local is_sel=(cur_qr==i)
S.round_rect(gg,rx,ry,rw,rh,10,nil,true,0)
S.round_rect(gg,rx,ry,rw,rh,10,is_sel and 2 or 1)
local cir_x=rx+20
local cir_y=ry+rh // 2
gg:circle(cir_x,cir_y,9,{line_width=2})
if is_sel then
gg:circle(cir_x,cir_y,5,{fill=true})
end
local opt=is_en and qopts_en[i] or qopts_id[i]
gg:text(rx+38,ry+10,opt[1],{font=S.font('medium')})
gg:text(rx+38,ry+36,S.fit_text(opt[2],'small',rw - 46),{font=S.font('small')})
end
local dy=my+358
gg:line(mx+16,dy,mx+mw - 16,dy,{line_width=1})
local sec_lbl=is_en and 'ACTIVE AYAH / HADITH (PREVIEW):' or 'AYAT / HADITS SAAT INI (PREVIEW):'
gg:text(mx+16,dy+8,sec_lbl,{font=S.font('small')})
local px,py,pw,ph=mx+12,dy+28,mw - 24,116
S.round_rect(gg,px,py,pw,ph,10,nil,true,0)
S.round_rect(gg,px,py,pw,ph,10,1)
local now_info=S.now(cfg)
local prev_text,prev_ref=S.get_effective_quote(cfg,now_info.day)
local p_lines=S.wrap_lines(prev_text,pw - 24,'small')
local pn=#p_lines
if pn>0 then
p_lines[1]='"' .. p_lines[1]
p_lines[pn]=p_lines[pn] .. '"'
local lh=(pn>=5)and 19 or((pn>=4)and 20 or 22)
local ref_gap=(pn>=5)and 18 or((pn>=4)and 19 or 21)
local total_h=(pn - 1)*lh+ref_gap+12
local base_y=math.floor(py+(ph - total_h)/ 2)
for i=1,pn do
local ly=base_y+(i - 1)*lh
local lw=S.text_w(p_lines[i],'small')
gg:text(math.floor((W - lw)/ 2),ly,p_lines[i],{font=S.font('small')})
end
local ry=base_y+(pn - 1)*lh+ref_gap
local rw=S.text_w(prev_ref or '','small')
gg:text(math.floor((W - rw)/ 2),ry,prev_ref or '',{font=S.font('small')})
end
local rf_lbl=is_en and 'Refresh Ayah Now (Test)' or 'Ganti Ayat Sekarang (Test)'
draw_btn(gg,mx+16,dy+152,mw - 32,42,rf_lbl,false,'medium')
draw_btn(gg,mx+20,my+mh - 50,mw - 40,42,is_en and 'Close' or 'Tutup',true,'medium')
end
function F.draw_update_modal(gg,cfg,update_info,update_state,update_err,update_saved_path,draw_btn,update_progress,update_tab)
if type(update_saved_path)=='function' and draw_btn==nil then
draw_btn=update_saved_path
update_saved_path=nil
end
if type(update_err)=='function' and draw_btn==nil then
draw_btn=update_err
update_err=nil
end
local W,H=S.W,S.H
local is_en=(cfg.lang=='en')
local mx,my,mw,mh=16,20,W - 32,760
S.round_rect(gg,0,0,W,H,0,nil,true,0)
S.round_rect(gg,mx,my,mw,mh,16,nil,true,0)
S.round_rect(gg,mx,my,mw,mh,16,2)
gg:line(W // 2 - 20,my+10,W // 2+20,my+10,{line_width=3})
local cx,cy=mx+mw - 28,my+26
gg:line(cx - 6,cy - 6,cx+6,cy+6,{line_width=2})
gg:line(cx - 6,cy+6,cx+6,cy - 6,{line_width=2})
local u_ver=(update_info and update_info.version)or S.APP_VERSION
local m_title=is_en and 'App Updates' or 'Pembaruan Aplikasi'
if update_state=='done' then
m_title=is_en and 'Update Ready!' or 'Pembaruan Siap'
elseif update_state=='up_to_date' then
m_title=is_en and 'MuslimInk Up to Date' or 'Versi Sudah Terbaru'
elseif update_state=='checking' then
m_title=is_en and 'Checking Updates...' or 'Memeriksa Pembaruan...'
elseif update_state=='downloading' then
m_title=is_en and 'Downloading Update...' or 'Sedang Mengunduh...'
elseif update_state=='error' then
m_title=is_en and 'Update Failed' or 'Pembaruan Gagal'
end
gg:text(mx+20,my+20,S.fit_text(m_title,'large',mw - 60),{font=S.font('large')})
local m_sub=is_en
and('MuslimInk v' .. u_ver .. ' • Xteink X4 Pro')
or('MuslimInk v' .. u_ver .. ' • Khusus Xteink X4 Pro')
gg:text(mx+20,my+50,m_sub,{font=S.font('small')})
gg:line(mx+16,my+74,mx+mw - 16,my+74,{line_width=1})
if update_state=='checking' then
local bx,by,bw,bh=mx+16,my+90,mw - 32,300
S.round_rect(gg,bx,by,bw,bh,12,nil,true,0)
S.round_rect(gg,bx,by,bw,bh,12,1)
gg:text(bx+20,by+24,is_en and 'CONNECTING TO GITHUB' or 'MENGHUBUNGI GITHUB',{font=S.font('medium')})
local msg=is_en
and 'Checking latest release availability from GitHub repository...'
or 'Menghubungi server GitHub untuk memeriksa ketersediaan rilis versi terbaru...'
local w_msg=S.wrap_lines(msg,bw - 40,'small')
for i=1,#w_msg do
gg:text(bx+20,by+56+(i - 1)*20,w_msg[i],{font=S.font('small')})
end
local p_w,p_h=bw - 40,18
local px,py=bx+20,by+120
S.round_rect(gg,px,py,p_w,p_h,9,nil,true,0)
S.round_rect(gg,px,py,p_w,p_h,9,2)
for sx=px+4,px+p_w - 4,12 do
gg:line(sx,py+2,sx+4,py+p_h - 3,{line_width=2})
end
local tip=is_en and 'Please ensure device Wi-Fi is connected.' or 'Pastikan koneksi Wi-Fi perangkat aktif.'
gg:text(bx+20,by+160,tip,{font=S.font('small')})
draw_btn(gg,mx+20,my+mh - 56,mw - 40,42,is_en and 'Cancel' or 'Batal',false,'medium')
elseif update_state=='up_to_date' then
local bx,by,bw,bh=mx+16,my+84,mw - 32,320
S.round_rect(gg,bx,by,bw,bh,12,nil,true,0)
S.round_rect(gg,bx,by,bw,bh,12,1)
S.round_rect(gg,bx+16,by+16,bw - 32,36,8,nil,true,0)
S.round_rect(gg,bx+16,by+16,bw - 32,36,8,1)
local ok_lbl=is_en and '[ OK ] Versi Terbaru Aktif' or '[ OK ] Versi Terbaru Aktif'
S.center_text(gg,bx+bw // 2,by+24,ok_lbl,'medium')
local desc1=is_en
and 'Aplikasi MuslimInk pada perangkat Anda sudah menggunakan versi rilis terbaru dari GitHub.'
or 'Aplikasi MuslimInk pada perangkat Anda sudah menggunakan versi rilis terbaru dari GitHub.'
local desc2=is_en
and 'Tidak ada pembaruan yang diperlukan saat ini.'
or 'Tidak ada pembaruan yang diperlukan saat ini.'
local w1=S.wrap_lines(desc1,bw - 40,'small')
local ty=by+68
for i=1,#w1 do
gg:text(bx+20,ty,w1[i],{font=S.font('small')})
ty=ty+20
end
ty=ty+4
local w2=S.wrap_lines(desc2,bw - 40,'small')
for i=1,#w2 do
gg:text(bx+20,ty,w2[i],{font=S.font('small')})
ty=ty+20
end
ty=ty+24
local cur_info=is_en
and('Active Version: v' .. S.APP_VERSION .. ' (Build ' .. S.APP_BUILD .. ')')
or('Versi Aktif: v' .. S.APP_VERSION .. ' (Build ' .. S.APP_BUILD .. ')')
local dev_info=is_en and 'Device: XTEINK X4 Pro' or 'Perangkat: XTEINK X4 Pro'
gg:text(bx+20,ty,cur_info,{font=S.font('medium')})
gg:text(bx+20,ty+24,dev_info,{font=S.font('small')})
draw_btn(gg,mx+20,my+mh - 56,mw - 40,42,is_en and 'Close' or 'Tutup',true,'medium')
elseif update_state=='downloading' then
local bx,by,bw,bh=mx+16,my+84,mw - 32,320
S.round_rect(gg,bx,by,bw,bh,12,nil,true,0)
S.round_rect(gg,bx,by,bw,bh,12,1)
gg:text(bx+20,by+24,is_en and 'DOWNLOADING PACKAGE' or 'SEDANG MENGUNDUH PAKET',{font=S.font('medium')})
local cur_b=(update_progress and update_progress.current)or 0
local exp_b=(update_progress and update_progress.total)or((update_info and update_info.size_bytes)or 422144)
local cur_kb=math.floor(cur_b / 1024)
local exp_kb=math.floor(exp_b / 1024)
local pct=0
if exp_b>0 then
pct=math.min(100,math.floor(cur_b*100 / exp_b))
end
local sub_dl=is_en
and('Progress: ' .. cur_kb .. ' / ' .. exp_kb .. ' KB (' .. pct .. '%)')
or('Progres: ' .. cur_kb .. ' / ' .. exp_kb .. ' KB (' .. pct .. '%)')
gg:text(bx+20,by+52,sub_dl,{font=S.font('medium')})
local p_w,p_h=bw - 40,20
local px,py=bx+20,by+86
S.round_rect(gg,px,py,p_w,p_h,10,nil,true,0)
S.round_rect(gg,px,py,p_w,p_h,10,2)
local fill_w=math.floor((p_w - 4)*pct / 100)
if fill_w>0 then
S.round_rect(gg,px+2,py+2,fill_w,p_h - 4,8,nil,true,0)
for sx=px+4,px+fill_w - 2,8 do
gg:line(sx,py+3,sx+3,py+p_h - 4,{line_width=2})
end
end
local note1=is_en and 'Target storage path on device:' or 'Lokasi penyimpanan berkas:'
local note2='XTApps/muslimink/files/muslimink_update.xtapp'
local note3=is_en and 'Mode: 64 KB chunked transfer (anti-corrupt)' or 'Metode: Unduhan bertahap 64 KB (aman)'
local note4=is_en and 'Please keep device connected to Wi-Fi...' or 'Mohon tunggu, jangan matikan Wi-Fi...'
gg:text(bx+20,by+122,note1,{font=S.font('small')})
gg:text(bx+20,by+144,note2,{font=S.font('small')})
gg:text(bx+20,by+172,note3,{font=S.font('small')})
gg:text(bx+20,by+194,note4,{font=S.font('small')})
draw_btn(gg,mx+20,my+mh - 56,mw - 40,42,is_en and 'Cancel' or 'Batal',false,'medium')
elseif update_state=='done' then
local bx,by,bw,bh=mx+16,my+78,mw - 32,460
S.round_rect(gg,bx,by,bw,bh,12,nil,true,0)
S.round_rect(gg,bx,by,bw,bh,12,2)
S.round_rect(gg,bx+16,by+14,bw - 32,34,8,nil,true,0)
S.round_rect(gg,bx+16,by+14,bw - 32,34,8,1)
local succ_title=is_en and '[ OK ] Download Complete!' or '[ OK ] Unduhan Selesai!'
S.center_text(gg,bx+bw // 2,by+22,succ_title,'medium')
local final_path=update_saved_path or 'XTApps/muslimink/files/muslimink_update.xtapp'
local is_root=final_path:find('^/sdcard/muslimink')or final_path:find('^muslimink')
local lbox_y=by+58
local lbox_h=60
S.round_rect(gg,bx+16,lbox_y,bw - 32,lbox_h,8,nil,true,0)
S.round_rect(gg,bx+16,lbox_y,bw - 32,lbox_h,8,1)
local folder_val=is_root and 'Kartu Memori (SD Root)' or 'XTApps/muslimink/files/'
local file_val='muslimink_update.xtapp'
gg:text(bx+26,lbox_y+8,(is_en and 'Folder : ' or 'Folder : ').. folder_val,{font=S.font('small')})
gg:text(bx+26,lbox_y+32,(is_en and 'File   : ' or 'Berkas : ').. file_val,{font=S.font('medium')})
local ty=lbox_y+lbox_h+16
gg:line(bx+16,ty,bx+bw - 16,ty,{line_width=1})
ty=ty+12
gg:text(bx+16,ty,is_en and 'Steps to Install on X4 Pro:' or 'Langkah Pemasangan di X4 Pro:',{font=S.font('medium')})
ty=ty+24
local steps={}
if is_root then
steps={
is_en and '1. Buka Menu Samping -> All Files' or '1. Buka Menu Samping -> All Files',
is_en and '2. Klik berkas "muslimink_update.xtapp"' or '2. Klik berkas "muslimink_update.xtapp"',
is_en and '3. Tekan OK untuk konfirmasi pasang' or '3. Tekan OK untuk konfirmasi pasang',
is_en and '4. Buka kembali dari menu Ink App' or '4. Buka kembali dari menu Ink App',
}
else
steps={
is_en and '1. Buka Menu Samping -> All Files' or '1. Buka Menu Samping -> All Files',
is_en and '2. Buka: XTApps > muslimink > files' or '2. Buka: XTApps > muslimink > files',
is_en and '3. Klik berkas "muslimink_update.xtapp"' or '3. Klik berkas "muslimink_update.xtapp"',
is_en and '4. Tekan OK untuk konfirmasi pasang' or '4. Tekan OK untuk konfirmasi pasang',
is_en and '5. Buka kembali dari menu Ink App' or '5. Buka kembali dari menu Ink App',
}
end
for _,s in ipairs(steps)do
local w_s=S.wrap_lines(s,bw - 32,'small')
for _,sub in ipairs(w_s)do
gg:text(bx+16,ty,sub,{font=S.font('small')})
ty=ty+24
end
end
ty=ty+8
gg:line(bx+16,ty,bx+bw - 16,ty,{line_width=1})
ty=ty+12
gg:text(bx+16,ty,is_en and 'Quick Install:' or 'Instalasi Cepat:',{font=S.font('medium')})
ty=ty+22
local tip_desc=is_en
and 'Tap "Exit App & Install" below. If not opened automatically by OS, follow the 5 manual steps above.'
or 'Tekan tombol "Keluar Aplikasi & Pasang" di bawah. Jika sistem tidak otomatis membuka berkas, gunakan 5 langkah manual di atas.'
local w_tip=S.wrap_lines(tip_desc,bw - 32,'small')
for i=1,#w_tip do
gg:text(bx+16,ty,w_tip[i],{font=S.font('small')})
ty=ty+20
end
draw_btn(gg,mx+20,my+mh - 110,mw - 40,44,is_en and 'Exit App & Install' or 'Keluar Aplikasi & Pasang',true,'medium')
draw_btn(gg,mx+20,my+mh - 56,mw - 40,42,is_en and 'Close' or 'Tutup',false,'medium')
elseif update_state=='error' then
local bx,by,bw,bh=mx+16,my+84,mw - 32,280
S.round_rect(gg,bx,by,bw,bh,12,nil,true,0)
S.round_rect(gg,bx,by,bw,bh,12,1)
local err_title=is_en and '[ ! ] Update Incomplete' or '[ ! ] Unduhan Belum Selesai'
gg:text(bx+20,by+20,err_title,{font=S.font('medium')})
local msg=update_err or(is_en and 'Network connection error.' or 'Terjadi kesalahan jaringan.')
local w_lines=S.wrap_lines(msg,bw - 40,'small')
local my_y=by+52
for i=1,#w_lines do
gg:text(bx+20,my_y,w_lines[i],{font=S.font('small')})
my_y=my_y+20
end
my_y=math.max(my_y+8,by+130)
local tip=is_en
and 'Ensure Wi-Fi is active and stable, or scan QR code via phone below.'
or 'Pastikan Wi-Fi stabil, atau pindai QR code lewat HP di bawah ini.'
local w_tips=S.wrap_lines(tip,bw - 40,'small')
for i=1,#w_tips do
gg:text(bx+20,my_y,w_tips[i],{font=S.font('small')})
my_y=my_y+20
end
draw_btn(gg,mx+20,my+mh - 164,mw - 40,44,is_en and 'Download via Phone (Scan QR)' or 'Unduh Lewat HP (Scan QR)',false,'medium')
draw_btn(gg,mx+20,my+mh - 110,mw - 40,44,is_en and 'Retry on Device' or 'Coba Lagi di Perangkat',true,'medium')
draw_btn(gg,mx+20,my+mh - 56,mw - 40,42,is_en and 'Close' or 'Tutup',false,'medium')
else
local cur_v=S.APP_VERSION
local rem_v=(update_info and update_info.version)or cur_v
local sz_kb=math.floor(((update_info and update_info.size_bytes)or 427680)/ 1024)
local rel_date=(update_info and update_info.release_date)or '2026-11-06'
local ix,iy,iw,ih=mx+16,my+78,mw - 32,58
S.round_rect(gg,ix,iy,iw,ih,10,nil,true,0)
S.round_rect(gg,ix,iy,iw,ih,10,1)
local t_line1=is_en
and('Latest: v' .. rem_v .. '  (Current: v' .. cur_v .. ')')
or('Versi Baru: v' .. rem_v .. '  (Saat ini: v' .. cur_v .. ')')
local t_line2=is_en
and('Date: ' .. rel_date .. ' • Size: ~' .. sz_kb .. ' KB')
or('Rilis: ' .. rel_date .. ' • Ukuran: ~' .. sz_kb .. ' KB')
gg:text(ix+16,iy+10,t_line1,{font=S.font('medium')})
gg:text(ix+16,iy+32,t_line2,{font=S.font('small')})
local tab_y=my+144
local tab_w=mw - 32
local tab_h=36
local active_tab_idx=(update_tab=='qr')and 2 or 1
local tab_labels=is_en and{'Changelog','Scan QR (Phone)'}or{'Catatan Rilis','Scan QR HP'}
S.segmented_control(gg,mx+16,tab_y,tab_w,tab_h,tab_labels,active_tab_idx)
local cx,cy,cw,ch=mx+16,tab_y+44,mw - 32,396
S.round_rect(gg,cx,cy,cw,ch,10,nil,true,0)
S.round_rect(gg,cx,cy,cw,ch,10,1)
if update_tab=='qr' then
local qr_title=is_en and 'SCAN VIA PHONE CAMERA:' or 'PINDAI DENGAN KAMERA HP:'
gg:text(cx+14,cy+12,qr_title,{font=S.font('small')})
gg:line(cx+14,cy+30,cx+cw - 14,cy+30,{line_width=1})
local rel_url=(update_info and(update_info.release_page_url or update_info.download_url))or S.RELEASE_LATEST_URL
local qr_size=150
S.draw_qr(gg,rel_url,cx+cw // 2,cy+38,qr_size)
local qy=cy+38+qr_size+14
local rel_short='github.com/fiqsr/MuslimInk-XTEINK-X4-PRO/releases'
S.center_text(gg,cx+cw // 2,qy,rel_short,'small')
qy=qy+22
local steps=is_en and{
'1. Scan QR with your phone camera',
'2. Download muslimink.xtapp to phone',
'3. Copy to X4 Pro via USB / SD Card'
}or{
'1. Pindai QR di atas dengan kamera HP',
'2. Unduh berkas muslimink.xtapp ke HP',
'3. Salin ke X4 Pro via USB / SD Card'
}
for _,st in ipairs(steps)do
S.center_text(gg,cx+cw // 2,qy,st,'small')
qy=qy+19
end
local btn_dl=is_en and 'Download on Device (Wi-Fi)' or 'Unduh di X4 Pro (Wi-Fi)'
draw_btn(gg,mx+20,my+mh - 110,mw - 40,44,btn_dl,true,'medium')
draw_btn(gg,mx+20,my+mh - 56,mw - 40,42,is_en and 'Close' or 'Tutup',false,'medium')
else
gg:text(cx+14,cy+12,is_en and 'WHAT\'S NEW / CHANGELOG:' or 'CATATAN RILIS TERBARU:',{font=S.font('small')})
gg:line(cx+14,cy+30,cx+cw - 14,cy+30,{line_width=1})
local logs=is_en
and(update_info and update_info.changelog_en or{'Bug fixes and performance improvements'})
or(update_info and update_info.changelog_id or{'Perbaikan bug dan peningkatan performa'})
local ly=cy+38
for idx,item in ipairs(logs)do
if ly+20<=cy+ch - 14 then
local w_sub=S.wrap_lines('• ' .. item,cw - 28,'small')
for _,sub in ipairs(w_sub)do
if ly+18<=cy+ch - 14 then
gg:text(cx+14,ly,sub,{font=S.font('small')})
ly=ly+18
end
end
ly=ly+4
elseif idx<=#logs then
gg:text(cx+14,cy+ch - 18,is_en and '• ... and further optimizations.' or '• ... serta optimasi performa lainnya.',{font=S.font('small')})
break
end
end
local btn_dl=is_en and 'Download & Save to SD Card' or 'Unduh & Simpan ke SD Card'
draw_btn(gg,mx+20,my+mh - 110,mw - 40,44,btn_dl,true,'medium')
draw_btn(gg,mx+20,my+mh - 56,mw - 40,42,is_en and 'Later' or 'Nanti',false,'medium')
end
end
end
function F.draw_custom_coords_screen(gg,cfg,now_info,state,draw_btn)
local W,H=S.W,S.H
local is_en=(cfg.lang=='en')
local title=is_en and 'Manual Coordinates' or 'Koordinat Manual'
gg:text(20,18,title,{font=S.font('large')})
if now_info and now_info.hhmm then
gg:text(W - 128,20,now_info.hhmm,{font=S.font('medium')})
end
S.draw_hamburger_btn(gg,W - 50,20)
local cur_act=state.active_field or 1
local f1_active=(cur_act==1)
S.round_rect(gg,20,60,W - 40,62,10,nil,true,0)
S.round_rect(gg,20,60,W - 40,62,10,f1_active and 3 or 1)
if f1_active then
gg:rect(28,64,6,54,{fill=true,radius=3})
end
local l_lat=is_en and 'Latitude / Lintang (-90.0 s.d +90.0)' or 'Lintang / Latitude (-90.0 s.d +90.0)'
gg:text(42,66,l_lat,{font=S.font('small')})
local lat_display=(state.lat=='' and '0.0000' or state.lat)..(f1_active and ' |' or '')
gg:text(42,88,lat_display,{font=S.font('medium')})
local f2_active=(cur_act==2)
S.round_rect(gg,20,128,W - 40,62,10,nil,true,0)
S.round_rect(gg,20,128,W - 40,62,10,f2_active and 3 or 1)
if f2_active then
gg:rect(28,132,6,54,{fill=true,radius=3})
end
local l_lon=is_en and 'Longitude / Bujur (-180.0 s.d +180.0)' or 'Bujur / Longitude (-180.0 s.d +180.0)'
gg:text(42,134,l_lon,{font=S.font('small')})
local lon_display=(state.lon=='' and '0.0000' or state.lon)..(f2_active and ' |' or '')
gg:text(42,156,lon_display,{font=S.font('medium')})
local f3_active=(cur_act==3)
S.round_rect(gg,20,196,W - 40,56,10,nil,true,0)
S.round_rect(gg,20,196,W - 40,56,10,f3_active and 3 or 1)
if f3_active then
gg:rect(28,200,6,48,{fill=true,radius=3})
end
local l_tz=is_en and 'Timezone / Zona Waktu (UTC: +7, +8, +3, -5)' or 'Zona Waktu / Timezone (UTC: +7, +8, +3, -5)'
gg:text(42,200,l_tz,{font=S.font('small')})
local tz_display='UTC ' ..(state.tz=='' and '+7' or state.tz)..(f3_active and ' |' or '')
gg:text(42,222,tz_display,{font=S.font('medium')})
local m_idx=state.method_idx or 1
local m_info=F.CUSTOM_METHODS[m_idx] or F.CUSTOM_METHODS[1]
S.round_rect(gg,20,258,W - 40,48,10,nil,true,0)
S.round_rect(gg,20,258,W - 40,48,10,1)
local m_title=(is_en and 'Method: ' or 'Metode: ').. m_info.name .. ' >'
gg:text(36,264,S.fit_text(m_title,'small',W - 72),{font=S.font('small')})
gg:text(36,284,m_info.desc ..(is_en and ' (Tap to cycle)' or ' (Ketuk untuk ganti)'),{font=S.font('small')})
if state.status_err then
S.round_rect(gg,20,310,W - 40,28,6,nil,true,0)
S.round_rect(gg,20,310,W - 40,28,6,1)
S.center_text(gg,W // 2,314,'(! ) ' .. state.status_err,'small',W - 50)
else
local helper_txt=is_en
and 'Tap field to edit • Auto UTC calculation'
or 'Pilih kotak edit • Auto UTC dari bujur'
S.center_text(gg,W // 2,314,helper_txt,'small',W - 32)
end
local col_x={16,128,240,352}
local col_w={104,104,104,112}
local row_y={344,432,520,608}
local row_h=80
local keys={
{{lbl='1',fn='large'},{lbl='2',fn='large'},{lbl='3',fn='large'},{lbl='Hapus',fn='small'}},
{{lbl='4',fn='large'},{lbl='5',fn='large'},{lbl='6',fn='large'},{lbl='+/-',fn='medium'}},
{{lbl='7',fn='large'},{lbl='8',fn='large'},{lbl='9',fn='large'},{lbl='.',fn='large'}},
{{lbl='Tab',fn='small'},{lbl='0',fn='large'},{lbl='Clear',fn='small'},{lbl='Auto UTC',fn='small'}}
}
for r=1,4 do
for c=1,4 do
local k=keys[r][c]
local bx=col_x[c]
local by=row_y[r]
local bw=col_w[c]
local bh=row_h
S.round_rect(gg,bx,by,bw,bh,10,nil,true,0)
S.round_rect(gg,bx,by,bw,bh,10,2)
local ty_off=(k.fn=='large')and 24 or((k.fn=='medium')and 28 or 30)
S.center_text(gg,bx+bw // 2,by+ty_off,k.lbl,k.fn,bw - 8)
end
end
draw_btn(gg,16,716,136,60,is_en and 'Cancel' or 'Batal',false,'medium')
draw_btn(gg,160,716,W - 176,60,is_en and 'Simpan & Hitung' or 'Simpan & Hitung',true,'medium')
end
return F
end)()
local W,H=S.W,S.H
local API_BASE='https://equran.id/api/v2/shalat'
local cfg=S.load_cfg()
local screen='main'
local prev_screen='main'
local hijri_modal=false
local cfont_modal=false
local quote_modal=false
local update_modal=false
local update_info=nil
local update_state='idle'
local update_err=nil
local update_saved_path=nil
local update_progress=nil
local update_tab='notes'
local about_expanded=false
local settings_scroll_y=0
local touch_down_y=nil
local coords_state={
lat='-6.2088',
lon='106.8456',
tz='+7',
active_field=1,
method_idx=1,
status_err=nil,
}
local tsb=nil
local doa_idx=1
local doa_list_mode=false
local country_names={}
local selected_country=nil
local city_names={}
local prov_list={}
local kab_list={}
local page=1
local PER_PAGE=9
local selected_prov=nil
local month_offset=0
local cal_hy=1448
local cal_hm=5
local selected_hd=1
local status=nil
local busy_label=nil
local ERR=nil
local pending=nil
local last_min=-1
local last_key=nil
local last_key_ms=0
local drawer_open=false
local DRAWER_ITEMS={
{id='main',icon='shalat',id_lbl='Jadwal Shalat',en_lbl='Prayer Times'},
{id='tasbih',icon='tasbih',id_lbl='Tasbih Digital',en_lbl='Digital Tasbih'},
{id='doa',icon='doa',id_lbl='Doa & Dzikir',en_lbl='Daily Duas'},
{id='hijri',icon='hijri',id_lbl='Kalender Hijriah',en_lbl='Hijri Calendar'},
{id='kiblat',icon='kiblat',id_lbl='Arah Kiblat',en_lbl='Qibla Direction'},
{id='settings',icon='settings',id_lbl='Pengaturan & Info',en_lbl='Settings & Info'},
}
local DW=300
local DX=W - DW
local function now_ms()
local ok,t=pcall(function()return ctx.clock:now()end)
if ok and type(t)=='table' then
local ms=tonumber(t.monotonic_ms)or tonumber(t.uptime_ms)
if ms then return math.floor(ms)end
local e=tonumber(t.epoch_sec)
if e then return(math.floor(e)% 1000000)*1000 end
end
return 0
end
local function refresh()
pcall(function()ctx:invalidate()end)
end
local function keep_wifi(ms)
pcall(function()ctx.net:keep_wifi(ms or(5*60*1000))end)
end
local function ensure_tasbih()
local now_info=S.now(cfg)
if not tsb then
tsb=F.load_tasbih(now_info.day)
elseif tsb.day ~=now_info.day then
tsb.day=now_info.day
tsb.today=0
F.save_tasbih(tsb)
end
end
local function inc_tasbih()
ensure_tasbih()
tsb.count=(tsb.count or 0)+1
tsb.today=(tsb.today or 0)+1
tsb.total=(tsb.total or 0)+1
F.save_tasbih(tsb)
end
local function switch_dhikr(delta)
ensure_tasbih()
local n=#F.DHIKR_LIST
tsb.idx=((tsb.idx - 1+delta)% n)+1
tsb.count=0
tsb.target=F.DHIKR_LIST[tsb.idx].def_target
F.save_tasbih(tsb)
end
local function cycle_tasbih_target()
ensure_tasbih()
local cur=tsb.target or 33
local next_t=33
for i=1,#F.TARGETS do
if F.TARGETS[i]==cur then
next_t=F.TARGETS[(i % #F.TARGETS)+1]
break
end
end
tsb.target=next_t
F.save_tasbih(tsb)
end
local function net_request(opts,label,on_done)
if pending then
local age=now_ms()-(pending.since or 0)
if age>=0 and age<35000 then return end
end
keep_wifi(5*60*1000)
busy_label=label
local job={since=now_ms()}
pending=job
refresh()
local ok,err=pcall(function()
ctx.net:request({
url=opts.url,
method=opts.method or 'GET',
headers=opts.headers or{['Content-Type']='application/json'},
body=opts.body,
timeout_ms=30000,
},function(c,resp)
if pending ~=job then return end
pending,busy_label=nil,nil
local ok_cb,cb_err=pcall(function()
if type(resp)~='table' or type(resp.body)~='string' or #resp.body==0 then
on_done(nil,'Tidak ada respons dari server')
return
end
local code=tonumber(resp.status)or tonumber(resp.code)
if code and code>=400 then
on_done(nil,'HTTP ' .. tostring(code))
return
end
on_done(resp.body,nil)
end)
if not ok_cb then
status='Galat: ' .. S.short(tostring(cb_err),38)
end
refresh()
end)
end)
if not ok then
pending,busy_label=nil,nil
status='Gagal koneksi Wi-Fi: ' .. S.short(tostring(err),30)
refresh()
end
end
local function fetch_month(y,m,prov,kab,after_fn)
local L=S.L(cfg)
local is_custom=(cfg.country=='GPS Manual' or cfg.country=='Kustom' or cfg.prov=='GPS Manual')
if is_custom then
local days=S.generate_month(y,m,cfg)
if days then
local want=(prov or '').. '|' ..(kab or '')
local body='loc=' .. want .. '\n'
for d=1,#days do
local r=days[d]
body=body .. string.format('%d=%s,%s,%s,%s,%s,%s,%s,%s\n',
d,r[1],r[2],r[3],r[4],r[5],r[6],r[7],r[8])
end
S.write(S.cache_name(y,m),body)
status=(cfg.lang=='en' and 'Calculated (Offline): ' or 'Dihitung (Offline): ').. S.short(kab or '',22)
if after_fn then after_fn()end
end
return
end
local is_id=(cfg.country=='Indonesia' or not cfg.country)
if is_id then
local body_req=string.format(
'{"provinsi":"%s","kabkota":"%s","bulan":%d,"tahun":%d}',
prov,kab,m,y
)
local lbl=(cfg.lang=='en' and 'Downloading ' or 'Mengunduh jadwal ').. L.bulan_short[m] .. ' ' .. tostring(y).. '...'
net_request({url=API_BASE,method='POST',body=body_req},lbl,function(body,err)
if not body then
status=(cfg.lang=='en' and 'Download failed: ' or 'Gagal unduh: ').. tostring(err)
return
end
local cache_s=S.parse_schedule_json(body,prov,kab)
if not cache_s then
status=cfg.lang=='en' and 'Invalid schedule format.' or 'Format data jadwal tidak sesuai.'
return
end
S.write(S.cache_name(y,m),cache_s)
status=(cfg.lang=='en' and 'Updated: ' or 'Jadwal diperbarui: ').. S.short(kab,22)
if after_fn then after_fn()end
end)
else
local lat=cfg.lat or 21.4225
local lon=cfg.lon or 39.8262
local method=cfg.method_id or 4
local url=string.format(
'https://api.aladhan.com/v1/calendar/%d/%d?latitude=%.4f&longitude=%.4f&method=%d',
y,m,lat,lon,method
)
local lbl=(cfg.lang=='en' and 'Fetching Aladhan ' or 'Mengunduh Aladhan ').. L.bulan_short[m] .. ' ' .. tostring(y).. '...'
net_request({url=url,method='GET'},lbl,function(body,err)
if not body then
status=(cfg.lang=='en' and 'Download failed: ' or 'Gagal unduh: ').. tostring(err)
return
end
local cache_s=S.parse_aladhan_json(body,prov,kab)
if not cache_s then
status=cfg.lang=='en' and 'Invalid schedule format.' or 'Format data jadwal tidak sesuai.'
return
end
S.write(S.cache_name(y,m),cache_s)
status=(cfg.lang=='en' and 'Updated (Aladhan): ' or 'Jadwal diperbarui (Aladhan): ').. S.short(kab,22)
if after_fn then after_fn()end
end)
end
end
local function ensure_schedules(force)
local now_info=S.now(cfg)
local info=S.compute(now_info,cfg)
S.try_fetch_quote(now_info,cfg,info)
local has_cur=(S.load_month(now_info.y,now_info.m,cfg.prov,cfg.kab,cfg)~=nil)
local next_y=(now_info.m==12)and(now_info.y+1)or now_info.y
local next_m=(now_info.m==12)and 1 or(now_info.m+1)
local has_next=(S.load_month(next_y,next_m,cfg.prov,cfg.kab,cfg)~=nil)
if force or not has_cur then
fetch_month(now_info.y,now_info.m,cfg.prov,cfg.kab,function()
if now_info.d>=20 and not has_next then
fetch_month(next_y,next_m,cfg.prov,cfg.kab)
end
end)
elseif now_info.d>=20 and not has_next then
fetch_month(next_y,next_m,cfg.prov,cfg.kab)
end
end
local function fetch_hijri_month(hy,hm,after_fn)
local L=S.L(cfg)
local url=string.format('https://api.aladhan.com/v1/hToGCalendar/%d/%d',hm,hy)
local m_name=L.hijri_bulan[hm] or('Bulan ' .. tostring(hm))
local lbl=(cfg.lang=='en' and 'Fetching Hijri ' or 'Mengunduh Kalender ').. m_name .. ' ' .. tostring(hy).. '...'
net_request({url=url,method='GET'},lbl,function(body,err)
if not body then
status=(cfg.lang=='en' and 'Download failed: ' or 'Gagal unduh: ').. tostring(err)
return
end
local cache_s=S.parse_htog_json(body,hy,hm)
if not cache_s then
status=cfg.lang=='en' and 'Invalid Hijri data format.' or 'Format data Hijriah tidak sesuai.'
return
end
S.write(S.hcal_cache_name(hy,hm),cache_s)
status=(cfg.lang=='en' and 'Updated: ' or 'Kalender diperbarui: ').. m_name .. ' ' .. tostring(hy).. ' H'
if after_fn then after_fn()end
end)
end
local function switch_hijri_month(delta)
cal_hm=cal_hm+delta
if cal_hm>12 then
cal_hm=1
cal_hy=cal_hy+1
elseif cal_hm<1 then
cal_hm=12
cal_hy=cal_hy - 1
end
selected_hd=1
status=nil
refresh()
end
local function goto_today_hijri()
local now_info=S.now(cfg)
local hy,hm,hd=S.effective_hijri(now_info,cfg)
cal_hy=hy
cal_hm=hm
selected_hd=hd
status=nil
refresh()
end
local function open_country_list()
country_names={}
for i,c in ipairs(F.WORLD_COUNTRIES)do
local c_name=(cfg.lang=='en' and c.name_en)or c.name
country_names[#country_names+1]=c_name .. '  •  ' .. c.cities_count
end
page=1
screen='country'
status=nil
refresh()
end
local function open_custom_coords_screen()
coords_state.lat=string.format('%.4f',cfg.lat or -6.2088)
coords_state.lon=string.format('%.4f',cfg.lon or 106.8456)
local tz_val=math.floor(cfg.tz or 7)
coords_state.tz=(tz_val>=0 and '+' or '').. tostring(tz_val)
coords_state.active_field=1
coords_state.status_err=nil
coords_state.method_idx=1
for i,m in ipairs(F.CUSTOM_METHODS)do
if m.mid==cfg.method_id or m.name==cfg.method then
coords_state.method_idx=i
break
end
end
prev_screen=screen
screen='custom_coords'
status=nil
refresh()
end
local function open_city_list(c_entry)
selected_country=c_entry
city_names={}
for i,ct in ipairs(c_entry.cities)do
local tz_s=(ct.tz>=0)and('UTC+' .. ct.tz)or('UTC' .. ct.tz)
city_names[#city_names+1]=ct.name .. '  •  ' .. tz_s
end
page=1
screen='city'
status=nil
refresh()
end
local function open_prov_list()
selected_prov=nil
local cached=S.parse_list_json(S.read('prov.txt'))
if cached and #cached>0 then
prov_list=cached
page=1
screen='prov'
status=nil
refresh()
return
end
local static_provs={}
for p_name,_ in pairs(F.PROV_COORDS)do
static_provs[#static_provs+1]=p_name
end
table.sort(static_provs)
prov_list=static_provs
page=1
screen='prov'
status=nil
refresh()
local lbl=cfg.lang=='en' and 'Loading provinces...' or 'Memuat daftar provinsi...'
net_request({url=API_BASE .. '/provinsi',method='GET'},lbl,function(body,err)
if body then
local list=S.parse_list_json(body)
if list and #list>0 then
S.write('prov.txt',body)
prov_list=list
refresh()
end
end
end)
end
local function open_kab_list(prov)
selected_prov=prov
local body_req=string.format('{"provinsi":"%s"}',prov)
local lbl=(cfg.lang=='en' and 'Loading cities in ' or 'Memuat kab/kota ').. S.short(prov,18).. '...'
net_request({url=API_BASE .. '/kabkota',method='POST',body=body_req},lbl,function(body,err)
if not body then
kab_list={'Kota ' .. prov,'Kabupaten ' .. prov}
page=1
screen='kab'
status=(cfg.lang=='en' and 'Offline: ' or 'Mode Offline: ').. prov
return
end
local list=S.parse_list_json(body)
if not list or #list==0 then
kab_list={'Kota ' .. prov}
else
kab_list=list
end
page=1
screen='kab'
status=nil
end)
end
local function toggle_lock()
local Lck=ctx.lockscreen
cfg.lock=not cfg.lock
S.save_cfg(cfg)
if not Lck then
status=cfg.lang=='en' and 'Lockscreen not supported on this firmware.' or 'Firmware ini belum mendukung lockscreen aplikasi.'
return
end
local okd,isdef=pcall(function()return Lck:is_default()end)
if cfg.lock then
if not(okd and isdef==true)then
pcall(function()Lck:set_default()end)
end
status=cfg.lang=='en' and 'Prayer Times Lockscreen enabled.' or 'Lockscreen Jadwal Sholat diaktifkan.'
else
if okd and isdef==true then
pcall(function()Lck:clear_default()end)
end
status=cfg.lang=='en' and 'Prayer Times Lockscreen disabled.' or 'Lockscreen Jadwal Sholat dinonaktifkan.'
end
end
local function toggle_lang()
cfg.lang=(cfg.lang=='en')and 'id' or 'en'
S.save_cfg(cfg)
if cfg.lang=='en' then
pcall(function()
local cur=S.load_cached_quote()
if cur then
local pool_idx=tonumber(cur.pool_idx)or 1
local item=S.BUILTIN_AYAHS and S.BUILTIN_AYAHS[pool_idx]
if item and(not cur.en_text or cur.en_text=='' or S.is_indonesian_text(cur.en_text))then
cur.en_text=item.en
cur.en_ref=item.ref
cur.en_l1=item.en
cur.en_l2=''
S.save_cached_quote(cur,cur.key or 'init')
end
end
end)
end
status=(cfg.lang=='en')and 'Language changed to English (EN).' or 'Bahasa diubah ke Indonesia (ID).'
pcall(function()
local now_info=S.now(cfg)
local info=S.compute(now_info,cfg)
S.try_fetch_quote(now_info,cfg,info)
end)
end
local function cycle_cfont()
cfg.cfont=((cfg.cfont or 1)% 6)+1
S.save_cfg(cfg)
local fnames_id={'Modern Bulat','Klasik Serif','Tegas Bold','Geometris Slab','Artistik Inline','Angka Arab'}
local fnames_en={'Modern Rounded','Classic Serif','Bold Geometric','Geometric Slab','Artistic Inline','Arabic Numerals'}
status=(cfg.lang=='en')
and('Clock font: ' .. fnames_en[cfg.cfont])
or('Gaya jam: ' .. fnames_id[cfg.cfont])
end
local function draw_btn(gg,x,y,w,h,label,active,fname)
fname=fname or 'medium'
S.round_rect(gg,x,y,w,h,10,nil,true,0)
S.round_rect(gg,x,y,w,h,10,active and 2 or 1)
if active then
S.round_rect(gg,x+2,y+2,w - 4,h - 4,8,1)
end
local y_off=(fname=='small')and((h - 24)// 2)or((h - 28)// 2)
S.center_text(gg,x+w // 2,y+y_off,label,fname,w - 12)
end
local function draw_drawer(gg)
if not drawer_open then return end
local is_en=(cfg.lang=='en')
local now_info=S.now(cfg)
for dy=0,H,4 do
gg:line(0,dy,DX - 1,dy,{line_width=1})
end
gg:rect(DX,0,DW,H,{fill=true,color=0})
gg:line(DX,0,DX,H,{line_width=2})
local bat_s=''
pcall(function()
local b=ctx.device:battery()
if b and b.percent then bat_s=tostring(b.percent).. '%' end
end)
local time_bat=now_info.hhmm ..(bat_s ~='' and('  •  ' .. bat_s)or '')
gg:text(DX+24,22,time_bat,{font=S.font('small')})
local cx,cy=W - 32,28
gg:line(cx - 7,cy - 7,cx+7,cy+7,{line_width=2})
gg:line(cx - 7,cy+7,cx+7,cy - 7,{line_width=2})
local start_y=72
local item_h=58
for i,it in ipairs(DRAWER_ITEMS)do
local iy=start_y+(i - 1)*item_h
local is_act=(screen==it.id)
if is_act then
S.round_rect(gg,DX+14,iy,DW - 28,48,10,2)
S.round_rect(gg,DX+16,iy+2,DW - 32,44,8,1)
end
S.draw_menu_icon(gg,it.icon,DX+36,iy+24)
local lbl=is_en and it.en_lbl or it.id_lbl
gg:text(DX+58,iy+12,S.fit_text(lbl,'medium',DW - 74),{font=S.font('medium')})
end
local qx,qy,qw,qh=DX+14,436,DW - 28,278
S.round_rect(gg,qx,qy,qw,qh,12,nil,true,0)
S.round_rect(gg,qx,qy,qw,qh,12,2)
S.round_rect(gg,qx+2,qy+2,qw - 4,qh - 4,10,1)
local info=S.compute(now_info,cfg)
S.center_text(gg,DX+DW // 2,qy+14,is_en and 'NEXT PRAYER' or 'SHALAT BERIKUTNYA','small')
if info.has_data and info.next_name then
S.center_text(gg,DX+DW // 2,qy+42,info.next_name .. '  ' ..(info.next_time or ''),'large')
S.center_text(gg,DX+DW // 2,qy+80,info.cd_str or '','small')
else
S.center_text(gg,DX+DW // 2,qy+54,is_en and 'No prayer data' or 'Belum ada data','medium')
end
S.divider(gg,qy+114,qx+12,qx+qw - 12)
local sub_loc=(cfg.country=='Indonesia' or not cfg.country)and(cfg.prov or 'DKI Jakarta')or(cfg.country or 'Indonesia')
local loc_short=(cfg.kab or 'Kota Jakarta').. '  •  ' .. sub_loc
S.center_text(gg,DX+DW // 2,qy+128,S.fit_text(loc_short,'small',qw - 24),'small')
local hy,hm,hd,hijri_str=S.effective_hijri(now_info,cfg)
S.center_text(gg,DX+DW // 2,qy+158,S.fit_text(hijri_str,'small',qw - 24),'small')
local fast_s=F.sunnah_fast_short(now_info.wday,hd,is_en)
if fast_s then
S.center_text(gg,DX+DW // 2,qy+188,'* ' .. fast_s .. ' *','small',qw - 24)
else
S.center_text(gg,DX+DW // 2,qy+188,is_en and 'All-in-One Companion' or 'Aplikasi Jadwal & Ibadah','small',qw - 24)
end
local src_lbl=(cfg.country=='Indonesia' or not cfg.country)and 'Kemenag RI (Offline)' or('Global Meeus (' ..(cfg.method or 'MWL').. ')')
S.center_text(gg,DX+DW // 2,qy+224,S.fit_text(src_lbl,'small',qw - 24),'small')
gg:line(DX+20,730,W - 20,730,{line_width=1})
local d_str=string.format('%02d/%02d/%04d  •  %s',now_info.d,now_info.m,now_info.y,now_info.hari)
gg:text(DX+24,750,S.fit_text(d_str,'small',DW - 40),{font=S.font('small')})
end
local function shalat_action_rect(idx)
local bw=104
local gap=8
local bx=20+(idx - 1)*(bw+gap)
return bx,716,bw,60
end
local function shalat_action_labels()
local is_en=(cfg.lang=='en')
if is_en then
return{'Location','Refresh','Monthly',cfg.lock and 'Lock: On' or 'Lock: Off'}
else
return{'Lokasi','Perbarui','Sebulan',cfg.lock and 'Lock: On' or 'Lock: Off'}
end
end
local function draw_hijri_modal(gg,now_info,info)
local L=S.L(cfg)
local mx,my,mw,mh=20,210,W - 40,270
gg:rect(mx,my,mw,mh,{fill=true,color=0})
S.card(gg,mx,my,mw,mh,2,true)
S.sheet_grabber(gg,W // 2,my+10)
S.center_text(gg,W // 2,my+26,L.hijri_title,'medium',mw - 32)
S.center_text(gg,W // 2,my+60,info.hijri_str,'medium',mw - 32)
local adj_val=cfg.adj or 0
local adj_txt=L.hijri_cur ..(adj_val>0 and('+' .. adj_val)or tostring(adj_val)).. L.hijri_day
S.center_text(gg,W // 2,my+92,adj_txt,'small',mw - 32)
local seg_idx=(adj_val==-1 and 1)or(adj_val==0 and 2)or(adj_val==1 and 3)or 2
local d_lbl=(cfg.lang=='en')and ' Day' or ' Hari'
local segments={'-1' .. d_lbl,'Reset (0)','+1' .. d_lbl}
S.segmented_control(gg,mx+20,my+130,mw - 40,44,segments,seg_idx)
draw_btn(gg,mx+80,my+198,mw - 160,50,L.btn_done,true,'medium')
end
local function draw_main_screen(gg)
local L=S.L(cfg)
local now_info=S.now(cfg)
local info=S.compute(now_info,cfg)
gg:text(20,18,'MuslimInk',{font=S.font('large')})
gg:text(W - 128,20,now_info.hhmm,{font=S.font('medium')})
S.draw_hamburger_btn(gg,W - 50,20)
local h_label=info.hijri_str ..(info.after_maghrib and(cfg.lang=='en' and ' (Night)' or ' (Malam)')or '')
local sub_loc=(cfg.country=='Indonesia' or not cfg.country)and(cfg.prov or 'DKI Jakarta')or(cfg.country or 'Indonesia')
local loc_str=(cfg.kab or 'Kota Jakarta').. '  •  ' .. sub_loc
gg:text(20,58,now_info.date_str,{font=S.font('medium')})
gg:text(20,86,S.fit_text(h_label,'small',W - 40),{font=S.font('small')})
gg:text(20,110,S.fit_text(loc_str,'small',W - 40),{font=S.font('small')})
if not info.has_data then
S.card(gg,20,140,W - 40,240,2,true)
S.center_text(gg,W // 2,186,L.no_data_title,'large',W - 70)
S.center_text(gg,W // 2,232,L.no_data_l1,'medium',W - 70)
S.center_text(gg,W // 2,264,L.no_data_l2,'medium',W - 70)
S.draw_quote(gg,420,now_info.day,cfg)
else
S.draw_next_card(gg,20,140,W - 40,132,info,cfg.cfont)
local sec_title=info.is_tomorrow and L.sec_tomorrow or L.sec_today
S.center_text(gg,W // 2,286,sec_title,'small')
S.draw_timeline(gg,20,308,W - 40,44,info)
end
local msg=busy_label or status or ERR
if msg then
S.center_text(gg,W // 2,676,msg,'small',W - 24)
else
local is_id=(cfg.country=='Indonesia' or not cfg.country)
local is_custom=(cfg.country=='GPS Manual' or cfg.country=='Kustom' or cfg.prov=='GPS Manual')
local f_text
if is_custom then
f_text=(cfg.lang=='en' and('Meeus Solar Offline (' ..(cfg.method or 'GPS').. ')')or('Hisab Astronomi Offline (' ..(cfg.method or 'GPS').. ')'))
elseif is_id then
f_text=(cfg.lang=='en' and 'Source: Kemenag RI (equran.id) • Offline' or 'Sumber: Kemenag RI (equran.id) • Offline')
else
f_text=(cfg.lang=='en' and 'Source: Aladhan API • Meeus Solar Offline' or 'Sumber: Aladhan API • Hisab Astronomi Offline')
end
S.center_text(gg,W // 2,676,f_text,'small',W - 24)
end
local labels=shalat_action_labels()
for i=1,4 do
local bx,by,bw,bh=shalat_action_rect(i)
draw_btn(gg,bx,by,bw,bh,labels[i],false,'small')
end
end
local function draw_list_screen(gg,title,list,now_info)
local L=S.L(cfg)
gg:text(20,18,S.fit_text(title,'large',W - 144),{font=S.font('large')})
if now_info and now_info.hhmm then
gg:text(W - 128,20,now_info.hhmm,{font=S.font('medium')})
end
S.draw_hamburger_btn(gg,W - 50,20)
local total_pages=math.max(1,(#list+PER_PAGE - 1)// PER_PAGE)
if page>total_pages then page=total_pages end
local start_idx=(page - 1)*PER_PAGE+1
local card_h=PER_PAGE*64
S.round_rect(gg,20,60,W - 40,card_h,14,nil,true,0)
S.round_rect(gg,20,60,W - 40,card_h,14,2)
for i=1,PER_PAGE do
local idx=start_idx+i - 1
local item=list[idx]
local ry=60+(i - 1)*64
if i>1 then
gg:line(36,ry,W - 36,ry,{line_width=1})
end
if item then
gg:text(40,ry+16,S.fit_text(item,'medium',W - 100),{font=S.font('medium')})
S.right_text(gg,W - 38,ry+16,'>','medium')
end
end
local pg_word=(cfg.lang=='en')and('Page ' .. tostring(page).. ' of ' .. tostring(total_pages))
or('Halaman ' .. tostring(page).. ' dari ' .. tostring(total_pages))
local info_txt=busy_label or status or pg_word
S.center_text(gg,W // 2,654,info_txt,'small',W - 32)
draw_btn(gg,20,716,136,60,L.btn_prev,false,'medium')
draw_btn(gg,172,716,136,60,L.btn_cancel,false,'medium')
draw_btn(gg,324,716,136,60,L.btn_next,false,'medium')
end
local function draw_month_screen(gg,now_info)
local L=S.L(cfg)
local ty,tm=now_info.y,now_info.m
if month_offset==1 then
if tm==12 then ty,tm=ty+1,1 else tm=tm+1 end
end
local title=(cfg.lang=='en' and 'Monthly Schedule' or 'Jadwal Shalat Bulanan')
gg:text(20,18,S.fit_text(title,'large',W - 144),{font=S.font('large')})
if now_info and now_info.hhmm then
gg:text(W - 128,20,now_info.hhmm,{font=S.font('medium')})
end
S.draw_hamburger_btn(gg,W - 50,20)
local sub_loc=(cfg.country=='Indonesia' or not cfg.country)and(cfg.prov or 'DKI Jakarta')or(cfg.country or 'Indonesia')
local sub_str=(cfg.kab or '').. ' (' .. sub_loc .. ')  •  ' .. L.bulan[tm] .. ' ' .. tostring(ty)
gg:text(20,48,S.fit_text(sub_str,'small',W - 40),{font=S.font('small')})
S.round_rect(gg,16,70,W - 32,648,12,nil,true,0)
S.round_rect(gg,16,70,W - 32,648,12,1)
local hdrs=L.col_headers or{L.col_day,L.labels[1],L.labels[2],L.labels[5],L.labels[6],L.labels[7],L.labels[8]}
local cols={24,66,132,198,270,340,412}
for c_i=1,7 do
gg:text(cols[c_i],73,hdrs[c_i],{font=S.font('small')})
end
gg:line(16,96,W - 16,96,{line_width=1})
local days_map=S.load_month(ty,tm,cfg.prov,cfg.kab,cfg)
if not days_map then
S.card(gg,32,220,W - 64,160,2,true)
S.center_text(gg,W // 2,260,L.month_empty_1 .. L.bulan[tm] .. L.month_empty_2,'medium',W - 80)
S.center_text(gg,W // 2,300,L.month_empty_sub,'small',W - 80)
else
local mlen=S.month_len(ty,tm)
for d=1,mlen do
local row=days_map[d]
if row then
local ry=98+(d - 1)*20
if ty==now_info.y and tm==now_info.m and d==now_info.d then
S.round_rect(gg,18,ry - 1,W - 36,21,6,nil,true,0)
S.round_rect(gg,18,ry - 1,W - 36,21,6,2)
end
gg:text(cols[1],ry,string.format('%02d',d),{font=S.font('small')})
gg:text(cols[2],ry,row[1] or '',{font=S.font('small')})
gg:text(cols[3],ry,row[2] or '',{font=S.font('small')})
gg:text(cols[4],ry,row[5] or '',{font=S.font('small')})
gg:text(cols[5],ry,row[6] or '',{font=S.font('small')})
gg:text(cols[6],ry,row[7] or '',{font=S.font('small')})
gg:text(cols[7],ry,row[8] or '',{font=S.font('small')})
end
end
end
local msg=busy_label or status
if msg then S.center_text(gg,W // 2,712,msg,'small',W - 32)end
local mo_lbl=month_offset==0
and(cfg.lang=='en' and 'Next Month >' or 'Bulan Depan >')
or(cfg.lang=='en' and '< This Month' or '< Bulan Ini')
draw_btn(gg,16,726,138,52,L.btn_back,false,'medium')
draw_btn(gg,162,726,156,52,mo_lbl,false,'small')
draw_btn(gg,326,726,138,52,L.btn_download,false,'medium')
end
function on_draw(c,gg)
if not gg then return end
local ok,err=pcall(function()
gg:clear(0)
local L=S.L(cfg)
local now_info=S.now(cfg)
if screen=='country' then
draw_list_screen(gg,cfg.lang=='en' and 'Select Country' or 'Pilih Negara',country_names,now_info)
elseif screen=='custom_coords' then
F.draw_custom_coords_screen(gg,cfg,now_info,coords_state,draw_btn)
elseif screen=='city' then
local c_title=selected_country and selected_country.name or(cfg.lang=='en' and 'Select City' or 'Pilih Kota')
draw_list_screen(gg,c_title,city_names,now_info)
elseif screen=='prov' then
draw_list_screen(gg,L.pick_prov,prov_list,now_info)
elseif screen=='kab' then
draw_list_screen(gg,L.pick_kab ..(selected_prov or ''),kab_list,now_info)
elseif screen=='month' then
draw_month_screen(gg,now_info)
elseif screen=='settings' then
F.draw_settings_screen(gg,cfg,now_info,draw_btn,about_expanded,settings_scroll_y,update_modal or cfont_modal or quote_modal)
else
if screen=='tasbih' then
ensure_tasbih()
F.draw_tasbih(gg,cfg,tsb,draw_btn,now_info)
elseif screen=='doa' then
F.draw_doa(gg,cfg,doa_idx,doa_list_mode,draw_btn,now_info)
elseif screen=='hijri' then
F.draw_hijri_screen(gg,cfg,now_info,draw_btn)
elseif screen=='hijri_cal' then
F.draw_hijri_cal_screen(gg,cfg,now_info,cal_hy,cal_hm,selected_hd,draw_btn)
elseif screen=='kiblat' then
F.draw_qibla_screen(gg,cfg,draw_btn,now_info)
else
draw_main_screen(gg)
end
if hijri_modal then
local info=S.compute(now_info,cfg)
draw_hijri_modal(gg,now_info,info)
end
end
if cfont_modal then
F.draw_cfont_modal(gg,cfg,now_info,draw_btn)
end
if quote_modal then
F.draw_quote_modal(gg,cfg,draw_btn)
end
if update_modal then
F.draw_update_modal(gg,cfg,update_info,update_state,update_err,update_saved_path,draw_btn,update_progress,update_tab)
end
if drawer_open then
draw_drawer(gg)
end
end)
if not ok then
pcall(function()
gg:text(10,H - 30,'Draw err: ' .. S.short(tostring(err),40),{font=S.font('small')})
end)
end
end
local function open_settings()
if screen ~='settings' then
prev_screen=screen
screen='settings'
settings_scroll_y=0
status=nil
end
end
local function check_drawer_tap(x,y)
if not drawer_open then return false end
if x<DX then
drawer_open=false
return true
end
if x>=W - 48 and y<=50 then
drawer_open=false
return true
end
local start_y=72
local item_h=58
for i,it in ipairs(DRAWER_ITEMS)do
local iy=start_y+(i - 1)*item_h
if y>=iy and y<iy+52 then
screen=it.id
drawer_open=false
doa_list_mode=false
status=nil
return true
end
end
if y>=436 and y<=714 then
screen='main'
drawer_open=false
status=nil
return true
end
return true
end
local function check_hijri_modal_tap(x,y)
if not hijri_modal then return false end
local mx,my,mw,mh=20,210,W - 40,270
local by=my+130
local bh=44
if y>=by and y<by+bh and x>=mx+20 and x<=mx+mw - 20 then
local seg_w=(mw - 40)/ 3
local seg=math.floor((x -(mx+20))/ seg_w)+1
if seg==1 then
cfg.adj=(cfg.adj or 0)- 1
elseif seg==2 then
cfg.adj=0
elseif seg==3 then
cfg.adj=(cfg.adj or 0)+1
end
S.save_cfg(cfg)
return true
end
if y>=my+196 and y<my+252 and x>=mx+80 and x<mx+mw - 80 then
hijri_modal=false
return true
end
if x<mx or x>mx+mw or y<my or y>my+mh then
hijri_modal=false
end
return true
end
local function check_cfont_modal_tap(x,y)
if not cfont_modal then return false end
local mx,my,mw,mh=20,84,W - 40,632
if x>=mx+mw - 52 and x<=mx+mw and y>=my+14 and y<=my+54 then
cfont_modal=false
return true
end
if y>=my+mh - 58 and y<=my+mh - 8 and x>=mx+20 and x<=mx+mw - 20 then
cfont_modal=false
return true
end
for i=1,6 do
local ry=my+78+(i - 1)*78
if y>=ry and y<ry+74 and x>=mx+12 and x<=mx+mw - 12 then
cfg.cfont=i
S.save_cfg(cfg)
local is_en=(cfg.lang=='en')
local fnames_id={'Modern Bulat','Klasik Serif','Tegas Bold','Geometris Slab','Artistik Inline','Angka Arab'}
local fnames_en={'Modern Rounded','Classic Serif','Bold Geometric','Geometric Slab','Artistic Inline','Arabic Numerals'}
status=(is_en and 'Clock font: ' or 'Gaya jam: ')..(is_en and fnames_en[i] or fnames_id[i])
cfont_modal=false
return true
end
end
if x<mx or x>mx+mw or y<my or y>my+mh then
cfont_modal=false
return true
end
return true
end
local function check_quote_modal_tap(x,y)
if not quote_modal then return false end
local mx,my,mw,mh=20,68,W - 40,636
if x>=mx+mw - 50 and x<=mx+mw and y>=my+8 and y<=my+50 then
quote_modal=false
return true
end
if y>=my+mh - 58 and y<=my+mh - 8 and x>=mx+20 and x<=mx+mw - 20 then
quote_modal=false
return true
end
for i=1,4 do
local ry=my+72+(i - 1)*70
if y>=ry and y<ry+64 and x>=mx+12 and x<=mx+mw - 12 then
cfg.qrefresh=i
S.save_cfg(cfg)
local is_en=(cfg.lang=='en')
local qref_names_id={'Tiap Hari','Tiap Waktu Shalat','Tiap Jam','Offline Saja'}
local qref_names_en={'Daily','Prayer Times','Hourly','Offline Only'}
status=(is_en and 'Ayah refresh: ' or 'Rotasi ayat: ')..(is_en and qref_names_en[i] or qref_names_id[i])
local now_info=S.now(cfg)
local info=S.compute(now_info,cfg)
S.try_fetch_quote(now_info,cfg,info)
return true
end
end
local dy=my+358
local by=dy+152
if y>=by and y<=by+46 and x>=mx+16 and x<=mx+mw - 16 then
local is_en=(cfg.lang=='en')
status=is_en and 'Fetching new ayah...' or 'Mengunduh ayat baru...'
refresh()
local now_info=S.now(cfg)
local info=S.compute(now_info,cfg)
keep_wifi(15000)
S.force_refresh_quote(now_info,cfg,info,function(ok,res)
if ok then
status=is_en and 'Ayah updated successfully!' or 'Ayat berhasil diperbarui!'
else
status=is_en and 'Local quote rotated' or 'Ayat lokal dirotasi'
end
refresh()
end)
return true
end
if x<mx or x>mx+mw or y<my or y>my+mh then
quote_modal=false
return true
end
return true
end
local function check_update_modal_tap(x,y)
if not update_modal then return false end
local mx,my,mw,mh=16,20,W - 32,760
if x>=mx+mw - 46 and x<=mx+mw and y>=my+4 and y<=my+46 then
if update_state ~='downloading' then
update_modal=false
refresh()
return true
end
end
if update_state=='checking' then
local b_cancel_y=my+mh - 56
if y>=b_cancel_y and y<=b_cancel_y+42 and x>=mx+20 and x<=mx+mw - 20 then
update_modal=false
status=(cfg.lang=='en')and 'Check cancelled.' or 'Pemeriksaan dibatalkan.'
refresh()
return true
end
elseif update_state=='up_to_date' then
local b_close_y=my+mh - 56
if y>=b_close_y and y<=b_close_y+42 and x>=mx+20 and x<=mx+mw - 20 then
update_modal=false
refresh()
return true
end
elseif update_state=='idle' then
local tab_y=my+144
if y>=tab_y and y<=tab_y+38 and x>=mx+16 and x<=mx+mw - 16 then
local mid_x=mx+mw // 2
if x<mid_x then
update_tab='notes'
else
update_tab='qr'
end
refresh()
return true
end
local b1_y=my+mh - 110
if y>=b1_y and y<=b1_y+44 and x>=mx+20 and x<=mx+mw - 20 then
update_state='downloading'
update_err=nil
local exp_total=(update_info and update_info.size_bytes)or 427680
update_progress={current=0,total=exp_total}
local is_en=(cfg.lang=='en')
status=is_en and 'Downloading update package...' or 'Mengunduh berkas pembaruan...'
refresh()
S.download_update(update_info,function(cur,tot)
update_progress={current=cur,total=tot}
refresh()
end,function(ok,saved_path,err)
if ok then
update_state='done'
update_progress={current=exp_total,total=exp_total}
update_saved_path=saved_path or 'XTApps/muslimink/files/muslimink_update.xtapp'
status=is_en and 'Download complete! Saved to app storage.' or 'Unduhan selesai! Tersimpan di folder aplikasi.'
pcall(function()
if ctx and ctx.system and ctx.system.open then
ctx.system:open(update_saved_path)
end
end)
else
update_state='error'
update_err=err or(is_en and 'Download failed' or 'Gagal mengunduh')
status=update_err
end
refresh()
end)
return true
end
local b2_y=my+mh - 56
if y>=b2_y and y<=b2_y+42 and x>=mx+20 and x<=mx+mw - 20 then
update_modal=false
refresh()
return true
end
elseif update_state=='downloading' then
local b_cancel_y=my+mh - 56
if y>=b_cancel_y and y<=b_cancel_y+42 and x>=mx+20 and x<=mx+mw - 20 then
update_modal=false
status=(cfg.lang=='en')and 'Download cancelled.' or 'Unduhan dibatalkan.'
refresh()
return true
end
elseif update_state=='done' then
local b1_y=my+mh - 110
if y>=b1_y and y<=b1_y+44 and x>=mx+20 and x<=mx+mw - 20 then
update_modal=false
pcall(function()
if ctx and ctx.system and ctx.system.open then
ctx.system:open(update_saved_path or 'XTApps/muslimink/files/muslimink_update.xtapp')
end
end)
pcall(function()ctx:quit()end)
return true
end
local b2_y=my+mh - 56
if y>=b2_y and y<=b2_y+42 and x>=mx+20 and x<=mx+mw - 20 then
update_modal=false
refresh()
return true
end
elseif update_state=='error' then
local b0_y=my+mh - 164
if y>=b0_y and y<=b0_y+44 and x>=mx+20 and x<=mx+mw - 20 then
update_tab='qr'
update_state='idle'
update_err=nil
refresh()
return true
end
local b1_y=my+mh - 110
if y>=b1_y and y<=b1_y+44 and x>=mx+20 and x<=mx+mw - 20 then
update_state='downloading'
update_err=nil
local exp_total=(update_info and update_info.size_bytes)or 427680
update_progress={current=0,total=exp_total}
local is_en=(cfg.lang=='en')
status=is_en and 'Downloading update package...' or 'Mengunduh berkas pembaruan...'
refresh()
S.download_update(update_info,function(cur,tot)
update_progress={current=cur,total=tot}
refresh()
end,function(ok,saved_path,err)
if ok then
update_state='done'
update_progress={current=exp_total,total=exp_total}
update_saved_path=saved_path or '/sdcard/muslimink.xtapp'
status=is_en and 'Download complete! Saved to SD Card.' or 'Unduhan selesai! Tersimpan di SD Card.'
else
update_state='error'
update_err=err or(is_en and 'Download failed' or 'Gagal mengunduh')
status=update_err
end
refresh()
end)
return true
end
local b2_y=my+mh - 56
if y>=b2_y and y<=b2_y+42 and x>=mx+20 and x<=mx+mw - 20 then
update_modal=false
refresh()
return true
end
end
if(x<mx or x>mx+mw or y<my or y>my+mh)and update_state ~='downloading' then
update_modal=false
refresh()
return true
end
return true
end
local function handle_tap_settings(x,y)
if y<=56 then
if y>=2 and y<=54 and x>=W - 64 then
drawer_open=true
return
end
if y>=2 and y<=54 and x>=W - 144 and x<W - 64 then
cfont_modal=true
return
end
return
end
if y>=726 and y<=800 then
if x>=20 and x<=W - 20 then
screen=prev_screen or 'main'
settings_scroll_y=0
return
end
return
end
local cy=y+settings_scroll_y
if cy>=66 and cy<66+544 and x>=20 and x<=W - 20 then
local i=(cy - 66)// 68+1
if i==1 then
if x>=W - 142 and x<W - 142+53 then
if cfg.lang ~='id' then toggle_lang()end
elseif x>=W - 142+53 and x<=W - 36 then
if cfg.lang ~='en' then toggle_lang()end
else
toggle_lang()
end
elseif i==2 then
open_country_list()
elseif i==3 then
cfont_modal=true
elseif i==4 then
if x>=W - 176 and x<W - 176+47 then
cfg.adj=-1
elseif x>=W - 176+47 and x<W - 176+93 then
cfg.adj=0
elseif x>=W - 176+93 and x<=W - 36 then
cfg.adj=1
else
cfg.adj=((cfg.adj or 0)+2)% 3 - 1
end
S.save_cfg(cfg)
elseif i==5 then
if x>=W - 200 and x<W - 200+90 then
cfg.maghrib=false
elseif x>=W - 200+90 and x<=W - 20 then
cfg.maghrib=true
else
cfg.maghrib=not(cfg.maghrib ~=false)
end
S.save_cfg(cfg)
elseif i==6 then
if x>=W - 146 and x<W - 146+55 then
if cfg.lock then toggle_lock()end
elseif x>=W - 146+55 and x<=W - 36 then
if not cfg.lock then toggle_lock()end
else
toggle_lock()
end
elseif i==7 then
quote_modal=true
elseif i==8 then
local is_en=(cfg.lang=='en')
update_modal=true
update_state='checking'
update_err=nil
status=is_en and 'Checking for updates on GitHub...' or 'Memeriksa pembaruan di GitHub...'
refresh()
S.check_for_updates(cfg,function(has_update,u_info,err)
if has_update and u_info then
update_info=u_info
update_state='idle'
update_err=nil
update_modal=true
status=is_en and('New version available: v' .. u_info.version)or('Versi baru tersedia: v' .. u_info.version)
elseif err then
update_state='error'
update_err=tostring(err)
update_modal=true
status=is_en and('Update check failed: ' .. tostring(err))or('Gagal cek pembaruan: ' .. tostring(err))
else
local cur_v=S.APP_VERSION
update_state='up_to_date'
update_info=u_info or{version=cur_v}
update_err=nil
update_modal=true
status=is_en and('MuslimInk is up to date (v' .. cur_v .. ').')or('MuslimInk sudah versi terbaru (v' .. cur_v .. ').')
end
refresh()
end)
end
return
end
if cy>=622 and cy<=622+64 and x>=20 and x<=W - 20 then
about_expanded=not about_expanded
if not about_expanded then
settings_scroll_y=0
else
settings_scroll_y=180
end
return
end
end
local function handle_tap_main(x,y)
if y>=2 and y<=52 and x>=W - 64 then
drawer_open=true
return
end
if y>=2 and y<=52 and x>=W - 144 and x<W - 64 then
cfont_modal=true
return
end
if y>=54 and y<=134 then
screen='hijri'
return
end
if y>=140 and y<=272 and x>=W - 150 then
cfont_modal=true
return
end
for i=1,4 do
local bx,by,bw,bh=shalat_action_rect(i)
if x>=bx and x<bx+bw and y>=by and y<by+bh then
status=nil
if i==1 then
open_country_list()
elseif i==2 then
ensure_schedules(true)
elseif i==3 then
month_offset=0
screen='month'
elseif i==4 then
toggle_lock()
end
return
end
end
end
local function handle_tap_tasbih(x,y)
ensure_tasbih()
if y>=2 and y<=52 and x>=W - 64 then
drawer_open=true
return
end
if y>=2 and y<=52 and x>=W - 144 and x<W - 64 then
cfont_modal=true
return
end
if y>=56 and y<=216 then
if x<W // 2 then switch_dhikr(-1)else switch_dhikr(1)end
return
end
if y>=570 and y<=635 then
if x>=20 and x<128 then
switch_dhikr(-1)
elseif x>=128 and x<236 then
switch_dhikr(1)
elseif x>=236 and x<352 then
cycle_tasbih_target()
elseif x>=352 and x<=460 then
tsb.count=0
F.save_tasbih(tsb)
end
return
end
if(y>=220 and y<=545)or(y>=640 and y<=780)then
inc_tasbih()
end
end
local function handle_tap_doa(x,y)
local total=#F.DUA_LIST
if y>=2 and y<=52 and x>=W - 64 then
drawer_open=true
return
end
if y>=2 and y<=52 and x>=W - 144 and x<W - 64 then
cfont_modal=true
return
end
if doa_list_mode then
if y>=60 and y<60+total*63 and x>=20 and x<=W - 20 then
local idx=(y - 60)// 63+1
if idx>=1 and idx<=total then
doa_idx=idx
doa_list_mode=false
end
return
end
if y>=706 and y<=780 then
doa_list_mode=false
return
end
return
end
if y>=710 and y<=780 then
if x>=20 and x<156 then
doa_idx=((doa_idx - 2)% total)+1
elseif x>=172 and x<308 then
doa_list_mode=true
elseif x>=324 and x<=460 then
doa_idx=(doa_idx % total)+1
end
end
end
local function handle_tap_hijri(x,y)
if y>=2 and y<=52 and x>=W - 64 then
drawer_open=true
return
end
if y>=2 and y<=52 and x>=W - 144 and x<W - 64 then
cfont_modal=true
return
end
if y>=64 and y<=190 then
hijri_modal=true
return
end
if y>=700 and y<=780 and x>=20 and x<=W - 20 then
local now_info=S.now(cfg)
local hy,hm,hd=S.effective_hijri(now_info,cfg)
cal_hy=hy
cal_hm=hm
selected_hd=hd
screen='hijri_cal'
refresh()
return
end
end
local function handle_tap_hijri_cal(x,y)
if y>=2 and y<=52 and x>=W - 64 then
drawer_open=true
return
end
if y>=2 and y<=52 and x>=W - 144 and x<W - 64 then
cfont_modal=true
return
end
if y>=56 and y<=120 then
if x>=20 and x<=80 then
switch_hijri_month(-1)
return
elseif x>=W - 80 and x<=W - 20 then
switch_hijri_month(1)
return
end
end
if y>=162 and y<568 and x>=23 and x<457 then
local days,days_count=S.load_hijri_month(cal_hy,cal_hm,cfg)
days_count=days_count or 30
local first_wd=(days and days[1] and days[1].wd)or 0
local c=(x - 23)// 62
local r=(y - 162)// 67
if c>=0 and c<=6 and r>=0 and r<=5 then
local slot=r*7+c
local hd=slot - first_wd+1
if hd>=1 and hd<=days_count then
selected_hd=hd
status=nil
refresh()
return
end
end
end
if y>=710 and y<=778 then
local bw=(W - 40 - 24)// 4
for i=1,4 do
local bx=20+(i - 1)*(bw+8)
if x>=bx and x<bx+bw then
if i==1 then
switch_hijri_month(-1)
elseif i==2 then
goto_today_hijri()
elseif i==3 then
switch_hijri_month(1)
elseif i==4 then
fetch_hijri_month(cal_hy,cal_hm)
end
return
end
end
end
end
local function handle_tap_kiblat(x,y)
if y>=2 and y<=52 and x>=W - 64 then
drawer_open=true
return
end
if y>=2 and y<=52 and x>=W - 144 and x<W - 64 then
cfont_modal=true
return
end
if(y>=64 and y<=138 and x>=20 and x<=W - 20)or
(y>=690 and y<=760 and x>=36 and x<=W - 36)then
open_country_list()
end
end
local function handle_tap_list(x,y,list,on_pick)
if y>=2 and y<=52 and x>=W - 64 then
drawer_open=true
return
end
if y>=2 and y<=52 and x>=W - 144 and x<W - 64 then
cfont_modal=true
return
end
local total_pages=math.max(1,(#list+PER_PAGE - 1)// PER_PAGE)
if y>=710 and y<=780 then
if x>=20 and x<156 then
if page>1 then page=page - 1 end
elseif x>=172 and x<308 then
if screen=='kab' then
screen='prov'
page=1
elseif screen=='prov' or screen=='city' then
open_country_list()
else
screen=prev_screen or 'main'
end
status=nil
elseif x>=324 and x<460 then
if page<total_pages then page=page+1 end
end
return
end
if y>=60 and y<60+PER_PAGE*64 and x>=20 and x<=W - 20 then
local row=(y - 60)// 64+1
local idx=(page - 1)*PER_PAGE+row
local item=list[idx]
if item then on_pick(item,idx)end
end
end
local function handle_tap_month(x,y)
if y>=2 and y<=52 and x>=W - 64 then
drawer_open=true
return
end
if y>=2 and y<=52 and x>=W - 144 and x<W - 64 then
cfont_modal=true
return
end
if y>=720 and y<=782 then
if x>=16 and x<158 then
screen='main'
elseif x>=158 and x<322 then
month_offset=(month_offset==0)and 1 or 0
elseif x>=322 and x<=W - 16 then
local now_info=S.now(cfg)
local ty,tm=now_info.y,now_info.m
if month_offset==1 then
if tm==12 then ty,tm=ty+1,1 else tm=tm+1 end
end
fetch_month(ty,tm,cfg.prov,cfg.kab)
end
end
end
local function handle_tap_custom_coords(x,y)
if y>=2 and y<=52 and x>=W - 64 then
drawer_open=true
return
end
if y>=2 and y<=52 and x>=W - 144 and x<W - 64 then
cfont_modal=true
return
end
if y>=60 and y<=122 and x>=20 and x<=W - 20 then
coords_state.active_field=1
coords_state.status_err=nil
refresh()
return
end
if y>=128 and y<=190 and x>=20 and x<=W - 20 then
coords_state.active_field=2
coords_state.status_err=nil
refresh()
return
end
if y>=196 and y<=252 and x>=20 and x<=W - 20 then
coords_state.active_field=3
coords_state.status_err=nil
refresh()
return
end
if y>=258 and y<=306 and x>=20 and x<=W - 20 then
local total_m=#F.CUSTOM_METHODS
coords_state.method_idx=(coords_state.method_idx % total_m)+1
coords_state.status_err=nil
refresh()
return
end
local cur_key=(coords_state.active_field==1 and 'lat')
or(coords_state.active_field==2 and 'lon')
or 'tz'
if y>=344 and y<=696 and x>=16 and x<=W - 16 then
local r=nil
if y<428 then r=1
elseif y<516 then r=2
elseif y<604 then r=3
else r=4 end
local c=nil
if x<124 then c=1
elseif x<236 then c=2
elseif x<348 then c=3
else c=4 end
if r and c then
local val=coords_state[cur_key] or ''
coords_state.status_err=nil
if r==1 then
if c==1 then if #val<10 then coords_state[cur_key]=val .. '1' end
elseif c==2 then if #val<10 then coords_state[cur_key]=val .. '2' end
elseif c==3 then if #val<10 then coords_state[cur_key]=val .. '3' end
elseif c==4 then
if #val>0 then coords_state[cur_key]=val:sub(1,-2)end
end
elseif r==2 then
if c==1 then if #val<10 then coords_state[cur_key]=val .. '4' end
elseif c==2 then if #val<10 then coords_state[cur_key]=val .. '5' end
elseif c==3 then if #val<10 then coords_state[cur_key]=val .. '6' end
elseif c==4 then
if val:sub(1,1)=='-' then
coords_state[cur_key]=val:sub(2)
else
coords_state[cur_key]='-' .. val
end
end
elseif r==3 then
if c==1 then if #val<10 then coords_state[cur_key]=val .. '7' end
elseif c==2 then if #val<10 then coords_state[cur_key]=val .. '8' end
elseif c==3 then if #val<10 then coords_state[cur_key]=val .. '9' end
elseif c==4 then
if not val:find('%.')and #val<10 then
coords_state[cur_key]=(val=='' and '0' or val).. '.'
end
end
elseif r==4 then
if c==1 then
coords_state.active_field=(coords_state.active_field % 3)+1
elseif c==2 then
if #val<10 then coords_state[cur_key]=val .. '0' end
elseif c==3 then
coords_state[cur_key]=''
elseif c==4 then
local lon_n=tonumber(coords_state.lon)or 0
local calc_tz=math.floor((lon_n+7.5)/ 15.0)
if calc_tz<-12 then calc_tz=-12 elseif calc_tz>14 then calc_tz=14 end
coords_state.tz=(calc_tz>=0 and '+' or '').. tostring(calc_tz)
end
end
refresh()
return
end
end
if y>=712 and y<=780 then
if x>=16 and x<=152 then
screen=prev_screen or 'country'
refresh()
return
elseif x>=160 and x<=W - 16 then
local is_en=(cfg.lang=='en')
local lat_n=tonumber(coords_state.lat)
local lon_n=tonumber(coords_state.lon)
local tz_n=tonumber(coords_state.tz)
if not lat_n or lat_n<-90 or lat_n>90 then
coords_state.status_err=is_en and 'Invalid Latitude (-90 to +90)' or 'Lintang tidak valid (-90 s.d +90)'
refresh()
return
end
if not lon_n or lon_n<-180 or lon_n>180 then
coords_state.status_err=is_en and 'Invalid Longitude (-180 to +180)' or 'Bujur tidak valid (-180 s.d +180)'
refresh()
return
end
if not tz_n or tz_n<-12 or tz_n>14 then
coords_state.status_err=is_en and 'Invalid Timezone (-12 to +14)' or 'Zona waktu tidak valid (-12 s.d +14)'
refresh()
return
end
local m_idx=coords_state.method_idx or 1
local m_info=F.CUSTOM_METHODS[m_idx] or F.CUSTOM_METHODS[1]
cfg.country='GPS Manual'
cfg.prov='GPS Manual'
cfg.kab=string.format('%.2f°, %.2f°',lat_n,lon_n)
cfg.lat=lat_n
cfg.lon=lon_n
cfg.tz=tz_n
cfg.fajr_ang=m_info.fajr
cfg.isha_ang=m_info.isha or 18.0
cfg.asr_factor=m_info.asr or 1.0
cfg.isha_fixed_min=m_info.isha_fixed
cfg.method=m_info.name
cfg.method_id=m_info.mid
cfg.has_saved=true
S.save_cfg(cfg)
local now_info=S.now(cfg)
local days=S.generate_month(now_info.y,now_info.m,cfg)
if days then
local want=cfg.prov .. '|' .. cfg.kab
local body='loc=' .. want .. '\n'
for d=1,#days do
local r=days[d]
body=body .. string.format('%d=%s,%s,%s,%s,%s,%s,%s,%s\n',
d,r[1],r[2],r[3],r[4],r[5],r[6],r[7],r[8])
end
S.write(S.cache_name(now_info.y,now_info.m),body)
end
screen='main'
status=is_en and 'Custom coordinates saved!' or 'Koordinat kustom berhasil disimpan!'
refresh()
return
end
end
end
local function key_ok(ev)
if ev.phase and ev.phase ~='down' and ev.phase ~='press' then return false end
if ev.repeat_count and tonumber(ev.repeat_count)and tonumber(ev.repeat_count)>0 then return false end
local t=now_ms()
if ev.key==last_key and t>0 and(t - last_key_ms)>=0 and(t - last_key_ms)<160 then
return false
end
last_key,last_key_ms=ev.key,t
return true
end
function on_input(c,ev)
ERR=nil
if type(ev)~='table' then return false end
if ev.type=='pointer' then
if ev.phase=='down' then
touch_down_y=tonumber(ev.y)or 0
end
if ev.phase=='up' or ev.gesture=='tap' then
local x,y=tonumber(ev.x)or 0,tonumber(ev.y)or 0
local ok,err=pcall(function()
if check_drawer_tap(x,y)then return end
if check_update_modal_tap(x,y)then return end
if check_cfont_modal_tap(x,y)then return end
if check_quote_modal_tap(x,y)then return end
if check_hijri_modal_tap(x,y)then return end
if screen=='settings' then
local is_exp=(about_expanded==true)
local max_scroll=is_exp and 660 or 0
if max_scroll>0 and touch_down_y and math.abs(touch_down_y - y)>25 then
local delta=touch_down_y - y
settings_scroll_y=math.max(0,math.min(max_scroll,settings_scroll_y+delta))
touch_down_y=nil
return
elseif max_scroll>0 and ev.gesture=='swipe_up' then
settings_scroll_y=math.min(max_scroll,settings_scroll_y+180)
return
elseif max_scroll>0 and ev.gesture=='swipe_down' then
settings_scroll_y=math.max(0,settings_scroll_y - 180)
return
end
touch_down_y=nil
end
if screen=='country' then
handle_tap_list(x,y,country_names,function(item,idx)
local c=F.WORLD_COUNTRIES[idx]
if c then
if c.is_id then
open_prov_list()
elseif c.is_custom then
open_custom_coords_screen()
else
open_city_list(c)
end
end
end)
elseif screen=='city' then
handle_tap_list(x,y,city_names,function(item,idx)
if selected_country and selected_country.cities[idx] then
local c=selected_country.cities[idx]
cfg.country=selected_country.name
cfg.prov=selected_country.name
cfg.kab=c.name
cfg.lat=c.lat
cfg.lon=c.lon
cfg.tz=c.tz
cfg.fajr_ang=c.fajr_ang or 18.0
cfg.isha_ang=c.isha_ang or 18.0
cfg.asr_factor=c.asr_factor or 1.0
cfg.isha_fixed_min=c.isha_fixed_min
cfg.method=c.method or 'MWL'
cfg.method_id=selected_country.method_id or c.method_id or 3
cfg.has_saved=true
S.save_cfg(cfg)
local now_info=S.now(cfg)
S.load_month(now_info.y,now_info.m,cfg.prov,cfg.kab,cfg)
local next_y=(now_info.m==12)and(now_info.y+1)or now_info.y
local next_m=(now_info.m==12)and 1 or(now_info.m+1)
S.load_month(next_y,next_m,cfg.prov,cfg.kab,cfg)
status=(cfg.lang=='en' and 'Location set to ' or 'Lokasi disetel ke ').. c.name .. ' (' .. selected_country.name .. ')'
screen=prev_screen or 'main'
ensure_schedules(true)
end
end)
elseif screen=='prov' then
handle_tap_list(x,y,prov_list,function(p)open_kab_list(p)end)
elseif screen=='kab' then
handle_tap_list(x,y,kab_list,function(k)
cfg.country='Indonesia'
cfg.prov=selected_prov
cfg.kab=k
local c=F.PROV_COORDS[selected_prov] or F.PROV_COORDS['DKI Jakarta']
cfg.lat=c[1]
cfg.lon=c[2]
if c[2]<115 then cfg.tz=7 elseif c[2]<125 then cfg.tz=8 else cfg.tz=9 end
cfg.fajr_ang=20.0
cfg.isha_ang=18.0
cfg.asr_factor=1.0
cfg.method='Kemenag'
cfg.method_id=20
cfg.has_saved=true
S.save_cfg(cfg)
local now_info=S.now(cfg)
S.load_month(now_info.y,now_info.m,cfg.prov,cfg.kab,cfg)
local next_y=(now_info.m==12)and(now_info.y+1)or now_info.y
local next_m=(now_info.m==12)and 1 or(now_info.m+1)
S.load_month(next_y,next_m,cfg.prov,cfg.kab,cfg)
screen=prev_screen or 'main'
ensure_schedules(true)
end)
elseif screen=='month' then
handle_tap_month(x,y)
elseif screen=='custom_coords' then
handle_tap_custom_coords(x,y)
elseif screen=='settings' then
handle_tap_settings(x,y)
else
if screen=='tasbih' then
handle_tap_tasbih(x,y)
elseif screen=='doa' then
handle_tap_doa(x,y)
elseif screen=='hijri' then
handle_tap_hijri(x,y)
elseif screen=='hijri_cal' then
handle_tap_hijri_cal(x,y)
elseif screen=='kiblat' then
handle_tap_kiblat(x,y)
else
handle_tap_main(x,y)
end
end
end)
if not ok then ERR=tostring(err)end
refresh()
return true
end
end
if ev.type=='key' and key_ok(ev)then
if ev.key=='back' then
if drawer_open then
drawer_open=false
refresh()
return true
elseif update_modal then
if update_state ~='downloading' then
update_modal=false
refresh()
end
return true
elseif cfont_modal then
cfont_modal=false
refresh()
return true
elseif quote_modal then
quote_modal=false
refresh()
return true
elseif hijri_modal then
hijri_modal=false
refresh()
return true
elseif screen=='hijri_cal' then
screen='hijri'
refresh()
return true
elseif screen=='settings' then
screen=prev_screen or 'main'
settings_scroll_y=0
refresh()
return true
elseif screen=='doa' and doa_list_mode then
doa_list_mode=false
refresh()
return true
elseif screen=='kab' then
screen='prov'
page=1
refresh()
return true
elseif screen=='prov' or screen=='city' then
open_country_list()
return true
elseif screen=='country' then
screen=prev_screen or 'main'
refresh()
return true
elseif screen=='custom_coords' then
screen=prev_screen or 'country'
refresh()
return true
elseif screen ~='main' then
screen='main'
refresh()
return true
end
return false
elseif screen=='settings' then
local is_exp=(about_expanded==true)
local max_scroll=is_exp and 660 or 0
if ev.key=='down' or ev.key=='right' then
settings_scroll_y=math.min(max_scroll,settings_scroll_y+160)
refresh()
return true
elseif ev.key=='up' or ev.key=='left' then
settings_scroll_y=math.max(0,settings_scroll_y - 160)
refresh()
return true
end
elseif screen=='tasbih' then
if ev.key=='ok' or ev.key=='down' or ev.key=='right' then
inc_tasbih()
refresh()
return true
elseif ev.key=='up' or ev.key=='left' then
switch_dhikr(1)
refresh()
return true
end
elseif screen=='doa' then
local total=#F.DUA_LIST
if ev.key=='down' or ev.key=='right' or ev.key=='ok' then
doa_idx=(doa_idx % total)+1
refresh()
return true
elseif ev.key=='up' or ev.key=='left' then
doa_idx=((doa_idx - 2)% total)+1
refresh()
return true
end
elseif(ev.key=='up' or ev.key=='left')and(screen=='prov' or screen=='kab')then
if page>1 then page=page - 1;refresh()end
return true
elseif(ev.key=='down' or ev.key=='right')and(screen=='prov' or screen=='kab')then
local list=(screen=='prov')and prov_list or kab_list
local total_pages=math.max(1,(#list+PER_PAGE - 1)// PER_PAGE)
if page<total_pages then page=page+1;refresh()end
return true
end
end
return false
end
function on_tick(c)
local now_info=S.now(cfg)
if now_info.cur_min ~=last_min then
last_min=now_info.cur_min
refresh()
end
end
function on_load(c)
pcall(function()
cfg=S.load_cfg()
local now_info=S.now(cfg)
last_min=now_info.cur_min
tsb=F.load_tasbih(now_info.day)
pcall(function()ctx:set_tick(30000)end)
pcall(function()ctx:set_tick_rate(30000)end)
ensure_schedules(false)
end)
end
function on_leave(c)
keep_wifi(1)
end
