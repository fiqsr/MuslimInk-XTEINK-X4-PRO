local CF=(function()
local CF={}
CF[1]={name="Rounded",big={h=82,w=[=[fW``ebc_ecD]=],c=[=[j:hn^_uXs<]=],r=[=[@$-$<%5$9&;$8'=$6(A$5)C$4*E$3+G$2,I$1-K$0.L$0/M$/04$I05$.14$K13$.22$L23$M32$-32%-51$N42%,62$O61$O72$,71%P81%Q:0$+91&+<0$Q;1'R?0$*=1'*A0%R@1+SH0,)C16*V0%RQ1*RX0%*X1'+\0$QZ1&Q]0$+]1&P^1&,`1%,b2$Oa1%-c1$Nc1$-d2$Md2$.e2$Le2$.f3$Kf3$/g4$Ig4$/hN$0iL$1jJ$2kI$2lH$3mF$4nD$6o@$7p>$9q:$;r6$?s/$>$)$<%-$:&0$8'3$6(5$4)7$2*:$0+<$.,>$--?$,.@$+/A%*1B%*33$+40$+5.$,6+$.7($;31_<o/%=q-$>r+$?s)$;$.$7%6$5&:$3'>$1(A$0)D$.*G$-+I$,,J$+-L$*.N%)06$D05$)14$G12$)22$H22$)31$I31$*4/$J40$*5.$+6,$-7($K50&L8/,KA/%JC0$JD/$IE0%HG0$GH1$FI1%EK1$DL2$CM2$BN2$AO3$@P3$?Q3$>R3$=S3$<T3$;U4$:V4$9W4$8X4$7Y4$6Z4$5[4$4\4$3]4$2^4$1_4$0`4$/a4$.b4$-c4$,d4$+e4$*f5$)gQ$)hS$(iU&(lV%)nT%*pR$+qP$-rM$:$/$6%7$3&<$1'@$0(C$.)F$-*H$,+J$+,L$*-N$*.O%*04$C07$*11$F14$*2/$H23$+3-$I32$,4*$.5&$J41%K60*K=/$J>0%I@0$HA1$FB2$DC4$>D9$9E=$7F=$7G<$6H;$6I9$6J<$6K>$6L@$7M@$7NA$9O@$>P<$DQ7$GR5$IS3$JT3$KU2$LV1$MW1&NZ0(M_1%La2$*b)$Lb1$)c,$Kc2$(d.$Jd3$(e0$Ie3$'f3$Gf5$'g6$Dg7$'hT$'iS$(jQ%)lO$*mL$,nI$-oG$/pC$1q?$4r9$9s0$L$)$K%+$J&-$I'/$H(1$G)2%F+3$E,4%D.5$C/6%B17$A28%@49$?5:%>7;$=8<$=9/$<:/$;;0$;</$:=/$9>0$9?/$8@0$7A0$7B/$6C0$5D0$5E/$4F0$3G0%2I0$1J0%0L0$/M0%.O0$-P1$-Q0$,R0$+S1$+T0$*U0$)V1$)W0$(X1$J9/C(Y0$IY7$'Z[$'[\%']]((b[$)cY$+dV$Ie0.Jp/$Jq.$Kr,$Ms)$2%E$0&I$/'K$.(M$-)N(-.M$,/M$,0L$,10',5/*+<0'>A0$;B6$+@/'9C:$+DJ$+EK$+FL$+GN%+IO$+JP$+KQ$+L3$FL6$,M0$IM4$-N-$JN3$.O*$KO3$LP2$MQ2%NS1&OV1*O]0$N^1&.a%$Ma2$+b*$*c-$Lb2%)d/$Kd3$)e1$Ie4$)f3$Gf6$)g6$Dg8$)hR%*jP$*kO$+lM$,mK$.nH$/oF$1pB$3q>$6r8$:s0$D$($C%+$B&-$A'/$@(0%?*1$>+2%=-2%</2$;02%:22$932%852$861$772$682$691$5:2$4;2%3=2$3>1$2?2$1@2$1A1$AA-$0BB$0CD$/DG$/EH$.FK$.GL$-HN$-IO$,JQ$,KR$+L9$FL8$+M6$JM5$+N4$LN3$*O4$MO3$*P3$NP2$*Q2$OQ2$)R2%PR1%PT2$)T1&(W1))]0$QU1.)^1&P`2$)a2$Pa1$*b1$Ob2$*c2$Nc3$*d3$Md3$+e3$Le4$+f5$Kf4$,g6$Hg7$,hR$-iP$.jO$/kM$0lK$1mI$2nF$3oD$5p@$7q<$9r8$=s0$+%M$*&Q$)'S$((U$')V'(-U%)/T$*0R$M1/$L20$L3/$K40$K5/$J60%J8/$I90$I:/$H;0%G=0%F?0&EB0%DD0%CF1$CG0%BI0%AK0%@M1$@N0$?O1$?P0%>R1$>S0$=T1$=U0$<V1%;X1%;Z0$:[1%9]1%8_1&7b1%6d1%5f2$5g1$4h2$4i1%3k2$3l1%3n0%3p/$4q.$5r,$7s($>$/$:%7$7&<$5'@$4(C$3)E$1*H$0+K$/,L$/-M$..8$E.8$-/4$I/4$-03$K03$-12$L12$,22$M22$,31%N31%,50$O50$+61'O61(,:0'O;0&,>1$N>1$-?0$N?0$-@1$M@1$.A1$LA1$.B2$KB2$/C3$IC3$0D6$DD7$1EI$2FG$3GE$5HA$6I?$4JC$2KF$1LI$0MK$/NM$.O6$FO7$-P4$JP4$,Q3$LQ3$,R2$MR2$+S2$NS2$+T1$OT1$*U1%PU1%QW0$)W1()\0$)]1(QX1-Pb2$)b2%Pc1$*d2$Od2$*e3$Ne3$+f3$Mf3$+g4$Lg4$,h6$Jh5$,iS$-jQ$.kO$/lM$0mK$1nI$2oG$4pC$6q?$9r9$=s1$=$/$9%7$6&<$4'@$3(C$1)F$0*I$/+K$.,M$--O$,.P$+/R$+07$G07$*15$J14$)24$K24$)33$L33$)42$M43$N52$(52%O61%(71%'92$':1+P81.OC2$(B1&OD1$(E2$(F3$NE2%)G2$MG3$)H3$LH3$*I4$KI4$*J5$IJ6$+K7$FK8$,LR$,MQ$-NP$.ON$/PM$0QK$2RI$3SG$5TE$8UA$;V.$GV2$GW1$FX1$EY2$EZ1$D[2$C\2$C]1$B^2$A_2%@a2$?b2%>d2$=e3$=f2$<g2%;i2$:j2%9l2$9m1%9o0$:p.%;r,$=s($0.)$./-$-0/$,11$,22$+33$+44)+:3$,;2$-<0$.=.$/>,$2?&$0S*$.T-$-U/$,V1$,W2$+X3$+Y4)+_3$,`2$-a0$.b.$/c+$]=]},sm={h=26,w=[=[8366767677-]=],c=[=[<+8958?3B<+]=],r=[=[*$*$)%,$(&.$''0$&(($0('$0)($&)'%%+($1*'%1,(%2.'(13($%,',%5($&6'$14'&&7($07($'8($/8($'90$(:.$);+$,<%$*$'$(%)$'&+$%'-%&)&$*)(5+;&$,<$$)$)$'%-$&&/$%'1$%('$.(($%)&$/)'$0*&%/,'&./'$-0($,1($+2($*3($)4($(5($'6($&7($%8)$%92&)$)$'%-$&&/$%'1$%('$.(($/)''--($).+$)/*$)0,$*1,$/2($03''%7&$/7($$8)$.8)$$92$%:0$';,$*<&$/$&$.%(%-')$,(*%+*+$*+'$*,&$)-'$(.'%'0'$&1'%%3'$/+',$44$$55%%73$/8''0<$$'$.$&%0&&('&&+&%%-'$*-*$%.0$%/1$&0'$.0)$'1$$/1($02((%7&$/7($%8($.8)$%91$&:/$';-$+<%$-$%$,%'$+&($+''$*(($))($)*'$(+($(,'$'--$&.0$&/1$%0*$.0)$%1($01($12'%14(%%2'(16'$%7($07($&8($/8)$&91$':/$);+$,<%$%$1$$%3%%'2$0(&$/)'%.+'%
CF[2]={name="Serif",big={h=79,w=[=[lVdciee`jeB]=],c=[=[n=etLguTu=]=],r=[=[A$0$>%6$;&;$9'?$8(B$6)E$5*2$J*2$4+2$L+2$3,2$L,3$2-3$M-2$1.3$N.2$0/4$N/3$003$N04$O13$/14%O24$.34$O35$P44$-45&P55%P76$,75%Q85%+96'Q:6'Q>7%*=6'R@6&RC72)A75RR6&*S6'QU7%*W7$+X6&QW6'Q[5$P\6$,[5&-^5%P]5&P`4$.`4%Oa5$Ob4$/b4%Oc3$0d3$Nd4$1e3$Ne3$2f2$Mf3$2g3$Mg2$3h2$Lh2$4i2$Ki2$6j2$Jj2$7kD$8lB$:m>$<n:$>o5$Bp-$B%($@&*$>',$<(.$:)0$8*2$6+4$4,6$2-8$0.:$./<$,0>$*1@$(2B%(4&$149$258$367S2f8%2h9$1i:$0j<$/k?$,lD$*mI%*oH$<$/$9%6$6&;$5'>$3(B$2)D$1*F$0+H$/,J$.-L$-.M$,/O$,0P$+1Q$+2,$;2A$*3*$>3?$*4($?4>$*5'$A5<$)6'$*7%$B6;%+8$$C8:$D99$D::%E<8)EB7&EE6%DG6%DI5$CJ5%BL5$BM4$AN4$@O4$@P3$?Q3$>R3$=S3$<T2$;U2$:V1$9W1$8X0$7Y0$6Z/$5[.$Z[&$3\.$Y\'$2]-$X]($1^,$V^*$/_,$S_-$.`Q$,aS$+bT$)cV%)eU))kT(>$-$9%6$6&<$4'@$2(C$1)F$0*H$/+J$.,L$
CF[3]={name="Bold",big={h=81,w=[=[fW``ebc_ecD]=],c=[=[j;jnU^uS}r<]=],r=[=[@#-$<$5$9%;$8&=$6'A$5(C$4)E$3*G$2+I$1,K$0-L$0.M$//4$I/5$.04$K03$.12$L13$M22$-22%-41$N32%,52$O51$O62$,61%P71%Q90$+81&+;0$Q:1'R>0$*<1'*@0%R?1+SG0,)B16*U0%RP1*RW0%*W1'+[0$QY1&Q\0$+\1&P]1&,_1%,a2$O`1%-b1$Nb1$-c2$Mc2$.d2$Ld2$.e3$Ke3$/f4$If4$/gN$0hL$1iJ$2jI$2kH$3lF$4mD$6n@$7o>$9p:$;q6$?r/$?$+$=%.$;&1$9'3$7(5$5)7$3*9$2+:$0,<$.->$,.@$+/A%*1B%*33$*42$*50$*6.$*7,$*8*$*9($*:'$;31`;p0$<q.$;#.$7$6$5%;$3&?$1'B$0(E$/)G$.*I$-+K$,,L$+-N$+.O$*/6$C/7$)04$F05$)12$H13$)21$I22$*3/$J32$+4-$-5*$K41%/6'$17$$L60%L81&M;0$L<0(KA1$KB0$JC1%IE1%HG1$GH2$FI2%EK2$DL2$CM3$BN3$AO3$@P3$?Q4$>R4$=S4$<T4$<U3$;V3$:W3$9X3$8Y3$7Z3$6[4$5\4$4]4$3^4$2_4$1`4$0a4$/b4$.c4$-d4$,e4$+fQ%*hS$)iT%(kU((pT$)qR$:#/$6$7$3%=$2&?$0'C$.(F$-)I$,*K$++L$*,N$)-P%)/4$C/7$)02$F04$*1/$H13$+2-$I22$,3+$-4)$J31%/5%$K50*K</$J=0%I?0$H@1$GA1$EB2$AC6$6D@$6E>$6F=$6G;$6H9$6I<$6J>$6K@$6LA$6MB$6NC$BO8$FP5$HQ4$JR2$KS2$LT1%MV1'NZ0%M\1'L`2$,a'$La1$+b)$Kb2$*c,$Jc3$)d.$Id3$(e1$Ge5$(f4$Df7$'gT$'hS$(iQ%)kO$*lM$,mI$-nG$/oC$1p?$4q:$8r1$L$,$K%.$J&/$I'0%H)1$G*2%F,3$E-4%D/5$C06%B27$A38%@59$?6:%>8;$=9/%<;/$<<.$;=/$:>/$:?.$9@/$8A/%7C/$6D/%5F/$4G0$4H/$3I/$2J0$2K/$1L0$0M0$0N/$/O0$.P0$.Q/$-R0$,S0%+U0$*V0%J9/B)X1$IX9$(YZ$(Z[$'[\+'c[$Id00Jq.$/$K$-%N,,.O$,/N$,00',4/*+;0(>@0$;A6$9B:$+@/'8C=$+DK$+EL$+FN$+GO%*IQ$*JR$*K4$FK7$+L1$IL4$,M.$JM4$.N+$KN3$2O%$LO2$MP2%NR1%OT0$OU1*O\0$N]1&/`%$M`2$.a'$-b*$La2%,c,$Kc3$+d/$Id4$*e2$Ge6$)f6$Df8$)gS$)hR$)iQ$*jO$+kM$,lK$.mH$0nE$1oB$3p>$6q8$:r1$C$/$A%1$@&2$?'3$?(2$>)2%=+2$<,2%;.2$;/1$:02$912$921$832$841$751$662$671$581%4:1$3;2$3<1$2=1$1>2$1?1$A@/$0@1%?A5$/BG$/CH$.DK$-EM$-FN$-GO$,HQ$,IR$+J9$GJ7$+K6$JK5$*L5$LL4$*M4$MM3$*N3$NN2$*O2$OO2$)P2%PP1%)R1&)U0$QR1)RX0%(V1))\1&QZ1(P_2$)_2%P`1$Oa2$*a2%Nb3$*c3$Nc2$+d3$Ld4$+e5$Ke4$,f7$Hf7$-gQ%.iO$/jM$0kK$1lI$2mG$4nC$5oA$7p=$:q7$=r1$)$S$'%W+'-V%(/T$M0/$L10$L2/$K30$K4/$J50%I70%I9/$H:0%G<0%F>0%F@/$EA0%DC0%CE0%BG1$BH0%AJ0%@L1$@M0$?N1$?O0%>Q1$>R0$=S1$=T0$<U1%;W1%;Y0$:Z1$:[0$9\1%8^1%7`1&6c1%5e1%4g2$4h1%3j1%2l2$2m1$1n2$1o1%1q/$>#/$:$7$8%<$6&@$4'C$3(F$1)I$0*K$0+L$/,M$.-7$F-7$..3$J.4$-/3$K/3$-02$,12$M02%,21%N21%O41*,40,O;0%,=1$N=1$->0$N>0$-?1$M?1$.@1$L@1$.A2$KA2$/B3$IB3$0C6$EC6$1DI$2EG$3FE$5GA$6H?$4IC$3JF$1KI$0LK$/MN$.N6$GN6$-O4$JO4$,P3$LP3$,Q2$NQ2$+R2$OR1$+S1$OS2$*T1%PT1%*V0$QV1(R[0$)W1-Q\1()a2$*b1$Pa2%*c2$*d3$Oc2%+e3$Ne3$+f4$Lf4$,g5$Jg6$,hS$-iQ$.jO$/kN$0lK$1mI$2nG$4oC$6p?$9q9$=r1$=#/$9$6$6%<$4&@$2'D$1(F$0)H$/*K$.+M$-,N$,-P$+.R$+/7$G/7$*05$I05$*13$K14$)23$L23$)32$M33$N42$(42%O51%(61%'82$'91,P71/(B1%OC1%(D2%NE2$)F2$MF3$)G3$MG2$*H3$KH4$*I4$JI5$+J6$HJ6$+KS$,LR$-MP$.NO$/OM$0PL$1QJ$3RH$5SE$7T3$IT1$;U+$HU1$GV1%FX1$EY2$EZ1$D[1%C]1$B^2$B_1$A`1$@a2$@b1$?c2$>d2$>e1$=f2$=g1$<h2$;i2%:k2$9l2%8n2%7p2$8q/$0-)$..-$-//$,01$,12$+23$+34)+93$,:2$-;0$.<.$/=,$2>&$0R*$.S-$-T/$,U1$,V2$+W3$+X4)+^3$,_2$-`0$.a.$/b+$]=]},sm={h=26,w=[=[8366767677-]=],c=[=[<+8:4:?2A>+]=],r=[=[*$*$)%,$(&.$''0$&(($0('$0)($&)'%%+($1*'%1,(%2.'(13($%,',%5($&6'$14'&&7($07($'8($/8($'90$(:.$);+$,<%$+$&$)%)$(&*$&',$%(-$%)'$%*&$*)(6)$)$'%-$&&/$%'1$%('$.(($&)%$/)($0*'&/-'%./($-0($,1($+2)$*3)$*4($)5($(6($'7($&8)$%92&)$)$'%-$&&/$%'1$%('$.(($&)%$/)''.-'$).+$)/*$)0,$)1-$/2($03''%7&$/7($%8'$.8)$$92$%:0$';-$+<%$0$%$/%'$.&($-')%,)*$+*+$++&$*,'$)-'%(/'$'0'%&2'$%3'$/+',%43$$55&/8'''$/$&%0&&('&&+&%%-'$*-*$%.0$%/1$%0($.0)$'1$$/1($02(%14'$05(%&7%$/7($%8($.8)$%91$&:/$(;,$+<%$-$&$,%'$+&($*'($*('$))($)*'$(+'$',($'
CF[4]={name="Slab",big={h=78,w=[=[hWbcgee`geB]=],c=[=[d3ixL^rP}r=]=],r=[=[?$0$;%8$9&<$7'@$6(B$4)F$3*H$2+J$1,L%0.N$//P$/06$H07$.16$J16$.25$K25$-35$L35$-44$M44$,55$M55$,64%N64%N85$+84&*;5$O94&O<5$*<4(P=4(PB5$QC43)A46PS5$)T5$PT4(*U4(+Z4&OY4'N]4%,]4&M_5$-`4$M`4$-a5$La5$.b5$Kb5$.c6$Jc6$/d7$Hd7$/eP$0fN$1gL%2iJ$3jH$4kF$6lB$7m@$9n<$<o6$@p.$:%/$7&2$5'4$3(6$1)8$/*:$-+<$*,?+*4-$*5*$*6($*7&$*8$$544S*dJ.*oI$<$/$9%6$6&;$4'?$3(A$1)D$0*G$/+H$.,J$
CF[5]={name="Inline",big={h=81,w=[=[fW``ebc_ecA]=],c=[=[«D§ÈyÖÄH]=],r=[=[@#-$<$5$9%:$8&=$6'A$5(-$K(-$4)+$N)+$3**$P**$2+*$@+-$Q+*$1,)$=,3$S,)$0-)$;-7$T-($0.($:.9$T.)$//)$9/;$U/)$.0)$80*$J0+$V0($71*$L1)$V1)$.1(%62)$M2)$W2($63($N3)$W3)$-3(%54)$O4($55($X4(%,5(%P5(%,7'$46(&Y6(&Q7(&Z9'$+8(&39(%R:'$+;'$3;'$Z:(&R;(&S>'$[='%*<('2<('*@'%2@'%S?()[?(*\F'-TE'/)B(61B(6[P()*U'%2U'%SQ()SW'$[V'&*W('2W('RX(&+['$R['$ZY(&Z\'$3[(&Q\(%+\(&Y](%4^(%P^(%Y_'$4`)$O`)$,_(&5a($Oa($X`(%5b)$Nb)$-b(%6c)$Mc)$Wb(%7d)$Ld)$.d(%7e+$Je+$Vd(%/f($8f.$Ff.$Uf($/g)$9g:$Tg)$0h)$;h6$Sh)$1i)$<i4$Ri)$1j*$?j.$Qj*$2k*$Pk*$3l+$Nl+$4m-$Km-$6nA$7o>$9p:$;q6$?r/$@$$$D$'$>%&$<&($:'*$8(,$6).$5*/$3+1$1,,$/-,$-.,$<,(&+/,$;/)$+0+$90+$+1)$71-$+2'$52/$+3%$331$14,$/5,$-6,$,7+$+8*$+9)$+:'$+;%$<4(aD%(p;#.$7$6$4%;$2&?$0'B$/(.$G(-$.),$J)+$,*,$K*+$+++$;+-$M+)$*,*$8,3$N,)$)-*$6-7$O-)$).)$4.:$P.($(/)$3/<$)0'$20+$F0*$Q/(%*1%$11*$H1)$02*$I2)$R1(%/3)$S3'$.4)$J3(%.5($/6&$07$$K5('L9'$K:((S4(.K?'$S?'$J@(%R@(&IB(%HD(%QC(&GF($FG)$PF(%FH($OH($EI($NI)$DJ)$NJ($CK)$MK)$LL)$BL)%LM($AN)$KN)$@O)$JO)$?P)$IP)$>Q)$=R)$HQ)%<S*$GS)$;T*$FT)$:U*$EU)$:V)$DV)$9W)$CW)$8X)$BX*$7Y)$BY)$6Z)$AZ)$5[)$@[)$4\)$?\)$3])$>])$2^)$=^)$1_*$<_)$0`*$;`)$/a*$:a)$.b*$9b*$-c*$8c*$,d*$7d*$+e*$6eE$*f*$)g*$5fF%(h*$4hG$(i)$3iH$(j(&(mS(;#/$7$6$4%<$2&@$0'C$.(/$H(,$-),$J)+$,*+$L**$*++$;+.$N+)$*,*$8,4$O,)$*-($6-8$P-)$+.&$4.;$,/$$2/>$Q.(%10,$G0*$/1,$I1)$R0(%.2+$S2'$.3*$J2(%/4'$05%$K4(*S3(+S;'$J;(%I=)$H>)$R<(&G?)$E@+$Q?(%DA+$PA($AB-$OB)$:C2$NC)$5D6$MD*$5E5$LE*$5F7$KF*$5G?$9H:$BI1$FJ/$IK-$5L.$LL+$5M3$NM*$5N6$ON*$5O9$PO*$:P5$RP($BQ/$RQ)$FR,$SR)$HS+$JT*$TS(%KU)$LV)$MW($UU(&NX'$NY((N^'$VX'*-_%$,`&$M_(%,a'$La)$U_(&+b*$Kb)$Ub'$,c*$Jc)$-d+$Id*$Tc(%.e,$Fe,$Se($(f%$/f1$Af0$Rf)$'g($0g?$Qg)$'h)$2h<$Ph)$'i*$4i8$Oi*$(j*$8j0$Nj*$)k+$Lk+$*l,$Jl,$+m.$Gm.$-nF$/oC$1p>$3q:$7r2$K$&%J&'$I'(%H))$G**%F,+$E-,%D/-$C0.$C1($B2)$A3)$A4($@5)$?6)$I1()?7($>8)$H7)%=9)$G9*$=:($<;)$F:+%;<)$E<,$;=($:>)$D=-%9?)$C?($9@($B@)$8A)$BA($8B($AB($7C($@C)$6D)$@D($6E($?E)$5F($>F)$4G)$>G($4H($=H)$3I($<I)$2J)$<J($2K($;K)$1L($:L)$0M)$:M($0N($9N)$/O($8O)$.P)$8P($.Q($7Q)$-R($6R)$,S)$6S($,T($5T)$+U)$4U)$*V)$4V($*W($3W)$I?(<Q$(W)X)$(Y)$2X?%(Z($1Z@$'[)$0[A$QX2''\($']'&I\('Q\(''`J'Q`2'Id(1Qd(1/$K$/%L&.(L$.)(*6,E'60D$61'&.0'(54(+-5(+5<''=?-$5@9$-='(4A=$4B?$4CA$4D*$ID-$LE,$NF+$4E(&>G,$PG*$4H9$QH)$,B(+4I<$RI)$4J=$SJ)$4K?$TK($,J'&4L+$HL,$-M&$3M($JM*$UL(%/N$$3N&$LN)$3O$$MO)$VN(%WP'$NP(%WQ(&OR(&PU'&PX($PY'&XT'+O\(&/_$$W\('.`&$N_(%.a'$Ma($-b)$Lb)$V`(&-c+$Kc)$Uc($.d,$Jd)$Td)$0e,$Ge,$Te($*f%$1f1$Bf0$Sf)$*g&$3g=$Rg)$)h($4h;$Qh)$(i+$7i6$Pi*$)j+$:j0$Oj*$*k,$Mk+$,l,$Kl,$-m.$Hm.$/nE$1oB$3p>$6q8$:r0$A$'$J$($@%($I%($?&)$H&)$?'($H'($>()$G()$>)($G)($F*)$=*(%F+($<,($;-)$E,(%;.($D.($:/)$C/)$:0($C0($91)$B1)$92($B2($83)$A3)$84($A4($75(%@5(%67($?7($58)$>8)$59($>9($4:)$=:)$4;($=;($3<)$<<)$3=($<=($2>)$;>)$2?($;?.$1@)$:@5$1A($:A8$0B($9B;$/C)$8C>$/D($8D*$ID/$.E)$7E)$ME,$.F($7F($OF+$-G)$6G)$AG)$QG*$-H($6H($<H2$RH*$,I)$5I<$TI)$5J>$UJ)$,J(%4K@$VK($4L.$IL,$VL)$+L(%3M,$LM*$WM($+N'$3N+$MN*$3O)$NO)$XN(%*O(%2P)$OP)$YP'$*Q'$PQ($2Q(%YQ(%QR(%RT'$ZS'%1S(')R())X'%1W''RU(,ZU(,)Z((1[('Z^'$*_'$Q^(%2_(%P`)$3a($Pa($Y_(&*`(&3b)$Ob)$4c)$Nc)$Xb(%+c(%4d*$Ld*$,e($5e,$Je+$Wd(%,f)$6f0$Ef/$Vf($-g)$7g<$Ug)$.h)$9h9$Th)$.i*$;i5$Si)$/j*$>j/$Rj*$0k+$Pk+$1l,$Nl,$2m.$Km-$4nC$5o@$7p<$:q7$>r/$'$W'',W$'-V%'/U$L0($L1'$T0(%K2(%S2(%S4'$J4(%R5($J6'$R6'$I7($I8'$Q7(%Q9'$H9(%P:($P;'$G;(%G='$O<(%F>(%N>(%N@'$E@(%MA(%DB(%DD'$LC(%LE'$CE(%KF(%BG(%JH(%AI(%@K)$IJ(&@L(%HM(%?N(%>P(%GO(&=R)$FR(%=S(%ET(%<U(%EV'$;W)$;X($DW(%:Y)$CY(%:Z(%9\(%B[(&8^)$8_($A^(%7`)$7a(%@`(&6c)$6d($?c(%5e)$5f($>e(%4g)$=g)$4h($=h(%3i)%3k($<j(%2l)$;l)$2m($;m(%1n)%:o(%0p)%9q($>#/$:$7$7%=$5&A$4'C$2(.$K(.$1),$N),$0*+$P*+$0+)$>+/$R+*$/,)$;,5$S,)$.-)$:-7$T-)$..($8.;$U.)$7/=$-/(%60+$J0+$V/(%61)$L1)$52)$M2)$W1(%,1(&53($N3($X3'%X5(',4')44(*O4(*X9'%5;'$O;'$,:(&5<($N<($W;(%6=($M=($-=(%6>)$L>)$V=(%-?)$7?)$J?*$U?)$.@)$8@*$I@*$T@)$/A($9A+$GA+$TA($/B)$;B5$RB*$0C*$=C1$QC*$1D*$?D-$PD*$2E+$AE-$NE+$4F+$DF3$5G,$FG0$6H-$IH,$4I2$KI,$2J+$<J-$NJ+$1K+$>K-$OK+$0L*$>L0$QL*$/M)$;M5$SM)$.N)$:N,$EN,$TN)$-O)$8O,$HO+$UO)$,P)$7P+$JP*$VP)$,Q($6Q*$KQ*$WQ($5R)$MR)$+R(%4S)$NS)$XR(%4T($OT($*T(%YT(%*V'$3U(%PU(%QW(&ZV(')W(')['&RZ''[Z'(2W(-Q^(&)^('3a($Pa($Z_(&3b)$Ob)$Zb'$4c)$Nc)$*b(&4d*$Md*$Yc(%+e($5e+$Ke+$Xe($+f)$6f-$Hf-$Wf)$,g)$7g=$-h)$8h;$Vg)%-i*$:i7$Ti*$.j*$<j3$Sj*$/k+$Ak)$Qk+$0l,$Ol,$1m.$Lm.$3nE$4oC$7p>$9q9$=r1$<#/$8$7$6%;$4&?$2'C$1(-$I(-$0)+$L),$.*+$N*+$-++$=+.$P+*$-,)$:,4$Q,*$,-)$7-9$R-)$+.)$6.;$S.)$+/($5/>$T/)$40+$H0,$U0($*0(%31*$J1*$U1)$22)$L2)$V2($)2(%13)$M3)$14($N4($05)$W3(&(4(&O5(%X6'$(7'$06(%P7((X7((Y<'$Q<'&'8(-/8(-(B'$P?('X=()0B(%0D)$OC(%XC'%(C(&1E($NE)$1F)$MF)$WE(%)F(%2G*$LG*$WG'$*H($3H*$JH,$*I)$4I,$GI.$VH(%+J($5J@$+K)$6K>$UJ(%,L)$8L<$TL)$-M)$:M3$KM($TM($.N*$>N+$JN)$SN)$/O*$JO($SO($0P,$IP)$RP)$1Q/$HQ)$RQ($3R>$QR)$4S<$QS($6T9$9U6$PT(%>V0$OV($EW)$NW)$EX($NX($DY)$MY)$DZ($MZ($C[)$L[)$C\($L\($B])$K])$B^($K^($A_(%J_(%@a($Ia($?b)$Hb)$?c($Hc($>d)$Gd)$>e($Ge($=f)$Ff)$=g($Fg($Eh)$<h(%Ei($;j(%Dj(%:l($Cl($9m)$Bm)$9n($Bn($8o)$Ao)$8p($Ap($7q($@q($1-%$..+$-/-$,0/$+11$+2)$42($+3($+4'$*5($53('+6(%47($+81$,9/$-:-$.;+$0<'$/T*$-U-$,V/$+W1$+X)$3X)$+Y($4Y($+Z'$*[($+\'$5Z(&+]($4]($+^1$,_/$-`.$.a+$0b'$]=]},sm={h=26,w=[=[8366767677,]=],c=[=[R.LPJDXE`U.]=],r=[=[*$*$)%&$/%&$(&%$,&&$1&%$''%$*'*$2'%$&(%$)(%$0(%$3($$))$$1)$$3)%$&)$%(*%$1*%%4*$%%+%%(+$%%-$*'-%*4,%+2,$,%4%%(4$%15%$44$%&6$$(6%$16$$&7%$)7$$07%$36%%'8$$)8&$/8%$'9%$+9($28%%(:%$0:&$);+$,<%$-$$$*%%$(&'$&'&$+'$$&($$)(&$')&$&*%$+)$6-%%:)$)$'%'$-%'$&&%$+&%$0&%$%'%$('*$%($$'(%$.(%$1'%%&)%$/)%'2)$'/-$$..%$1-%%./$$-0%$0/%%,1%$/1%$+2%$.2%$*3%$-3%$)4%$-4$$(5%$,5%$'6%$+6%$&7%$*7%$%8&$)8-$%9%$(9.$%:$$%;1$)$)$'%'$.%&$%&&$+&&$0&%$%'$$('+$1'%$'(%$/($$')$$/)%&2($'.,%$1,%$,-&$1-$$).($0.%$*/*$)0$$/0&$)1)$11%$-2&$22$$/3%$23%$04%%34$%06'$&7%$/7%$27%$'8&$-8&$28$$$9%$(9*$19%$%:&$/:&$';,$*<&$1$$$/$$%.&%$-'&%,)%$/)$$+*%$++$$.*%%*,%$-,&$)-%$,-%$).$$,.$$(/%$+/%$'0%$*0%$'1$$*1$$&2%$)2%$%3%$(3%$/-$*1%%2%4$$(4+$14($'5,$15'$$5%%.6%$16%$$7/$17($/8$'18%''$/%)'-$&&%()($&&+'$(,%$(-,$(.%$/.&$(/*$1/%$&,$((0,$20%$(1$$01%%31$%13$&33%&06%$36$$&7%$07$$'8&$.8&$27%%%9%$)9)$19%$&:&$/:&$';-$+<%$,$$$/$$$.%%$+%%%.&$$*'%$-'%$*($$-($$))%$,)%$)*$$(+%$+*%%(,$$*,%$'-%$*-*$'.$$).%$0.&$&/%$)/*$2/%$&0$$(0,$30$$%1%$(1%$01%$31%$12%%24$$%2$''2%'(6$$15%%42$(%6%%(7%$07%$37%$&8$$)8&$/8%$38$$&9%$*9)$29%$':&$0:&$);,$,<%$$$3$%%2$$'3$/(%%2($%/*$$1*%$.+%$1+$$.,$$0,%$--%$0-$$-.$$/.%%,/%%/0$$,1$$.1%$+2%$.2$$+3$$-3%%*4%%-5$$,6%$)6%%,7$$)8$$(9%$+8%%(:$$';%$*:%%*$*$(%'$/%&$'&%$,&&$1&%$&'%$*'*$2'%$)(%$0(%%1*$$&($'()%&0+%$3(%'&,%$),%$/,%$3,$$'-%$*-)$2-%$(.%$,.&$0.&$(/'$//&$'0&$+0'$10%$&1%$*1&$.1&$21%$&2$$)2%$02%$32%$%3%$(3%$13$$43$%%4$&(4$&14%&45%%(7%$17$$47$$%7%%)8%$/8&$38%$&9%$*9)$29%$':&$1:%$(;-$,<%$)$*$'%'$.%'$&&&$+&&$1&%$&'$$)'*$2'%$%(%$((%$/(%$3($$%)$$')%$0)%$$*%''*$'1*$'%.$$'.%$0.%$3)%)%/%$(/%$//&$3/$$&0%$)0+$20%$'1%$/1%$21$$(2+$12%$*3)$13$$04%$-4%%05$$,6%$/6%$,7$$+8%$.7%%+9$$*:%$-9%%*;$$,;%$'&$$&''$%(%%((%%&*&$&2&$&3'$%4%$(4%$&5'$'6%$]=]}}
CF[6]={name="Arabic",big={h=81,w=[=[ON[b[U^__[E]=],c=[=[<DTWodF{{aJ]=],r=[=[5I%$5J'$4K*$4L+$3M.$2N0$2O2$1P4$1Q5$0R7$0S8$/T:%.V;$-W;%-Y:$/Z8$0[6$2\3$3]2$5^/$6_.$8`+$9a)$;b'$<c%$5)$$3*'$1+)$0,+$/-,$...$-//$-00%,22&,53&,84$-93$-:4$.;3%/=2$/>3$0?2%0A3$1B2%2D1$2E2$3F1&4I1&5L0&6O0&7R/(8W.&8Z/&9]-,:f,':j+):p*%>r&$4)&$Q)'$2*($1+*$0,+$/--$Q*)'...$-/0%P.*&,11$O1+%,22%N3,$N4+$M5,$,43&L6-$,74$K7.$-83$J8/$-96$H91$-:K$.;J%/=I$/>H$0?G$0@F$1AE$1BD$2CC$2DB$2EA$3F?$3G>$4H;$4I8$4J1$5K0$5L1%6N0'7R0(8W/)9].,:f,*:m+(>r&$6)$$X)&$4*&$J*&$2+)$1,*$0-,$H+)&X*)'/.-$H.*$.//%I/)&-11%X.*(I2*%-32%,54$W3+&H4+&V6,$-63%G7-$U7-$-84$F8<$-95$E9=$.:S%/<R%0>P&1AN$1BM$2CL$2DK$3E=$PE+$3F<$RF'$4G:$4H9$4I6$5J0$5K1%6M0&7P0(8U/(9Z.):`-,:i,);o*&?r&$D$$$B%'$A&($?'*$=(,$<).$;*/$9+0$8,1$7-2$6.3$5/4$404$315$226$136$046$055$/65$/74$/82$.92$.:0$.;/$-<.$-=,$->+$-?,$,@/$,A1$,B3$,C6$,D9$,E;$,F<$+G=$,H<$,I=$-J<$.K<$/L;$0M:$2N7$3O5$6P2$8Q/$9R-$9S,$8T,$8U+$7V,$6W,$6X+$5Y+%4[+$4\*$3]+$3^*%2`+$2a,$2b-$2c0$Rc&$2dF$2eG%2gF$3hD%4jB$4kA$5l?$6m=$7n<$8o:$:p6$<q3$@r-$</)$:0-$91/$723$734$645$557$469$37:$38;$29<$2:=$1;>$0<?$0=@$/>A%/@.$>@2$.A-$@A1$.B,$BB/$CC.$-C,%-E+$DD-%EF,$,F+%EG-$,H*$+I+$FH,%+J*&GJ+'*M*&*P)&HN*+GV+$GW*$)S*)FX+$)Y+$EY,$)Z,$DZ-$)[-$C[.$)\.$B\/$)]1$?]1$)^G%*`E%*bD$*cC$+dB$+eA$+f@$,g>$-h<$-i;$.j9$0k5$2l2$5m,$*(%$))*$)*/$D*+$)+G%(-I''1I'&5J%'7H$*8E$-9B$2:0$E:*$D;+*CB,)CH-*CO.(CT/$DU.%DW/&DZ0%E\0&E_1%Fa1%Fc2%Ge2&Hh0$Hi/$Hj.$Ik,%Im+$Jn)$Jo($Jp'$Kq%$-)$$+*&$T*%$)+)$S+&$(,*$S,'$'-,$R-)$'.-$R.*$&/.$Q/,$%00%Q0-%%21$P2/$P30$$32%O42%$53%O61$N72$$74%N81$M92$%94&M:1%&<4$L<1$'=3$'>4$L=0%(?3%K?0%KA/$)A3%JB0$*C3%+E2$JC/&+F3$,G2$IF/%,H3$IH.$HI/$-I2%.K2$HJ.%HL-$/L1%GM.$0N1%1P0$GN-&1Q1$FQ-%2R0%2T1$FS,%EU-$3U0%4W0%EV,&EY+$5Y/%DZ,$6[/%7].$D[+&7^/$D^*$7_7$8`6$8a5$9b4%9d3$:e2%:g1$;h0&<k.%=m,$=n+$=o)$>p'$>q%$>r$$C)$$B*%$@+($?,)$=-+$<.-$;/.%;1/$:20%:41$952%973$884$895%7;6$7<7$7=*$?=/$6>+&@>/&5A,$@A0$5B+$AB/$AC0%4C,&3F-$BE0%BG1$3G,%CH0$2I-%CI1%1K.$DK1%1L-%DM2$0N.$EN1$0O-$EO2%/P.%.R/$FQ2%.S.$FS3$GT2$GU3$-T/&HV2$,W/%HW3%+Y0$+Z/$IY3%*[0%J[3%J]4$)]0%K^3$(_1$K_4$'`1%&b2$L`4&&c1$Mc4%%d2%Ne3%$f2%%h0$Og2%&i/$'j.$Pi0%Qk/$(k,%Ql.$)m*$*n)$Rm,%+o'$So*$,p&$Sp)$-q$$Tq&$Tr$$7'($5(-$3)1$2*3$1+5$0,7$/-9$..:$./;$-0<$,1>%+3@%*5A$*6,$863$)7+$:72$)8*$;81$<90$)9)%=:/$(;*&>;.&(>+$(?,$(@.$?>-&(A1$?A.$(BE%)DD&*GC%+IB%,KA$-L@$.M?$0N=$2O<$5P-$@P.$AQ-&AT.&AW/&AZ0&B]0%B_1%Ca1&Cd2$De1$Df2%Eh1$Ei0$Ej/$Fk-$Fl,$Fm+$Gn)$Go($Gp'$Hq%$Hr$$1+$$1,&$0-)$/.+$//-$.0/$.10$-22$-33$,45%+65$*76$+84$-92$/:/$0;-$2<+$3=)$5>&$6?%$1U%$1V&$0W)$/X+$/Y-$.Z/$.[1$-\3%,^5$+_6$+`5%,b3$.c0$/d/$1e,$2f+$4g($5h&$6i%$]=]},sm={h=26,w=[=[1046425554-]=],c=[=[+/1488/9<5/]=],r=[=[)/$$(0&$(1($'2*$&3+$'4)$(5($*6%$'&&$&''$&((%&*)$'+(%(-'$(.($)/''*3&$*4'%*6&(+;%$(%$$'&&$1%%&&''%&)($0(&%&*/$'+.%(-,$(.+$(/($)0'(*5&(*:%$'%%$&&&$.%%&&''%.(&$3%%'&)($.)*$&*2%',0$'-/$(.*$(/'$(0($)1'(*6&&*9%%-$$$+%&$*&'$)'($(()$'))$'*'$'+%$&,'$&-)$&.+%'0+$)1($*2&$)3&$)4%$(5%%(7.%)9,$):+$+;($*''$)()$()*$(*+$'+,$',&$,,($&-&$--'$&.%%..&%%0&$/0%&%1%&.3&$%4&$-4'$%5.%&7,$&8+$(9($%&-$%'.$$(/$$).$&*,$-+%)-1&'-5'$.6&$.7'&/:%$/;$$1&%$$&&%1'&$0('$0)($#((&0*'$$+(%/+'%/-&$%-(%&/'$..'%&0($.0&%'1'%(3'%-2&&)5)&*8'%+:%$+;$$+&%$*''&)*)%),%$,,'%(-&%,.($'/'$-/'%'0&%-1($&2'$&3&$.2(%%4'%/4(%/6)$$6'%#8($07(%$9&$19'$%:%$1:&$2;$$)%&$(&($''*$&(+$&),$+*'$%*%%%,&$,+&%%--%&/,%(1*$-2&&-5'&-8($.9'$.:&$.;%$'&%$&''$&(($%))$&*'$(+%$'3%$&4'$&5($%6)$'7&$(8%$]=]}}
return CF
end)()
local S=(function()
local function A(r,i,e)return{ref=r,id=i,en=e}end
local S={}
S.W,S.H=480,800
S.KEYS={'imsak','subuh','terbit','dhuha','dzuhur','ashar','maghrib','isya'}
S.IS_WAJIB={false,true,false,false,true,true,true,true}
S.WAJIB_IDX={2,5,6,7,8}
S.LANGS={
id={
labels={'Imsak','Subuh','Terbit','Dhuha','Dzuhur','Ashar','Maghrib','Isya'},
next_card='MENUJU WAKTU SHALAT',next_card_tom='MENUJU SHALAT (BESOK)',next_badge='Berikutnya',
sec_today='JADWAL HARI INI',sec_tomorrow='JADWAL BESOK',now_prayer='Saatnya waktu shalat!',
lock_no_data='Jadwal Bulan Ini Belum Ada',lock_no_l1='Buka aplikasi Jadwal Sholat & Wi-Fi',lock_no_l2='untuk memilih lokasi dan unduh jadwal.',
hari={'Minggu','Senin','Selasa','Rabu','Kamis','Jumat','Sabtu'},
bulan={'Januari','Februari','Maret','April','Mei','Juni','Juli','Agustus','September','Oktober','November','Desember'},
bulan_short={'Jan','Feb','Mar','Apr','Mei','Jun','Jul','Agu','Sep','Okt','Nov','Des'},
hijri_bulan={'Muharram','Safar','Rabiul Awwal','Rabiul Akhir','Jumadil Ula','Jumadil Akhira','Rajab','Syaban','Ramadhan','Syawwal','Dzulqadah','Dzulhijjah'},
},
en={
labels={'Imsak','Fajr','Sunrise','Dhuha','Dhuhr','Asr','Maghrib','Isha'},
next_card='COUNTDOWN TO PRAYER',next_card_tom='COUNTDOWN TO PRAYER (TOMORROW)',next_badge='Next Up',
sec_today="TODAY'S SCHEDULE",sec_tomorrow="TOMORROW'S SCHEDULE",now_prayer="It's time to pray!",
lock_no_data='No Prayer Schedule Found',lock_no_l1='Open Jadwal Sholat app & connect Wi-Fi',lock_no_l2='to select location and download schedule.',
hari={'Sunday','Monday','Tuesday','Wednesday','Thursday','Friday','Saturday'},
bulan={'January','February','March','April','May','June','July','August','September','October','November','December'},
bulan_short={'Jan','Feb','Mar','Apr','May','Jun','Jul','Aug','Sep','Oct','Nov','Dec'},
hijri_bulan={'Muharram','Safar','Rabi al-Awwal','Rabi al-Thani','Jumada al-Ula','Jumada al-Akhirah','Rajab','Shaban','Ramadan','Shawwal','Dhu al-Qadah','Dhu al-Hijjah'},
}
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
next_name=L.jumat
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
function S.card(gg,x,y,w,h,lw,double_border)
S.round_rect(gg,x,y,w,h,14,nil,true,0)
S.round_rect(gg,x,y,w,h,14,lw or 2)
if double_border then
S.round_rect(gg,x+3,y+3,w - 6,h - 6,11,1)
end
end
function S.divider(gg,y,x1,x2)
x1=x1 or 24
x2=x2 or(S.W - 24)
gg:line(x1,y,x2,y,{line_width=1})
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
local BLACK={fill=true}
local function decode_glyph(gl)
if gl.dec then return gl.dec end
local dec={}
local rstr=gl.r or ''
local n=#rstr
local idx=1
while idx+7<=n do
local rx=tonumber(rstr:sub(idx,idx+1),16)or 0
local ry=tonumber(rstr:sub(idx+2,idx+3),16)or 0
local rw=tonumber(rstr:sub(idx+4,idx+5),16)or 1
local rh=tonumber(rstr:sub(idx+6,idx+7),16)or 1
dec[#dec+1]={rx,ry,rw,rh}
idx=idx+8
end
gl.dec=dec
return dec
end
function S.big_clock(gg,hhmm,cx,y,h,cfont_idx)
local fset=(CF and CF[cfont_idx or 1])or(CF and CF[1])
if not fset then
S.center_text(gg,cx,y+(h - 30)// 2,hhmm,'large')
return
end
local pack=(h>=60)and fset.big or fset.sm
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
local rects=decode_glyph(gl)
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
gg:text(x+20,y+36,info.next_name,{font=S.font('large')})
gg:text(x+20,y+68,S.fit_text(info.cd_str,'medium',w - 176),{font=S.font('medium')})
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
if i==5 and info.wday==5 then name=L.jumat end
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
[1]=A('QS. Ash-Sharh: 5','Maka sesungguhnya bersama kesulitan ada kemudahan,','For indeed, with hardship [will be] ease.'),
[2]=A('QS. Ash-Sharh: 6','Sesungguhnya bersama kesulitan ada kemudahan.','Indeed, with hardship [will be] ease.'),
[3]=A('QS. Ash-Sharh: 7','Maka apabila engkau telah selesai (dari suatu urusan), tetaplah bekerja keras (untuk urusan yang lain),','So when you have finished [your duties], then stand up [for worship].'),
[4]=A('QS. Ash-Sharh: 8','Dan hanya kepada Tuhanmulah engkau berharap.','And to your Lord direct [your] longing.'),
[5]={ref="QS. Ar-Ra'd: 28",id='(yaitu) orang-orang yang beriman dan hati mereka manjadi tenteram dengan mengingat Allah. Ingatlah, hanya dengan mengingati Allah-lah hati menjadi tenteram.',en='Those who have believed and whose hearts are assured by the remembrance of Allah. Unquestionably, by the remembrance of Allah hearts are assured.'},
[6]=A('QS. Ibrahim: 7','Sesungguhnya jika kamu bersyukur, niscaya Aku akan menambah (nikmat) kepadamu.','If you are grateful, I will surely increase you [in favor].'),
[7]=A('QS. Ta-Ha: 14','Sungguh, Aku ini Allah, tidak ada tuhan selain Aku, maka sembahlah Aku dan laksanakanlah shalat untuk mengingat-Ku.','Indeed, I am Allah. There is no deity except Me, so worship Me and establish prayer for My remembrance.'),
[8]=A('QS. Al-Anbiya: 87','Tidak ada tuhan selain Engkau, Mahasuci Engkau. Sungguh, aku termasuk orang-orang yang zalim.','There is no deity except You; exalted are You. Indeed, I have been of the wrongdoers.'),
[9]={ref="QS. Al-'Ankabut: 45",id='Dirikanlah shalat. Sesungguhnya shalat itu mencegah dari (perbuatan) keji dan mungkar.',en='Establish prayer. Indeed, prayer prohibits immorality and wrongdoing.'},
[10]=A('QS. At-Talaq: 3','Dan barangsiapa bertawakal kepada Allah, niscaya Allah akan mencukupkan (keperluan)nya.','And whoever relies upon Allah - then He is sufficient for him.'),
[11]=A('QS. Ad-Duha: 3','Tuhanmu tidak meninggalkan engkau (Muhammad) dan tidak (pula) membencimu.','Your Lord has not taken leave of you, [O Muhammad], nor has He detested [you].'),
[12]=A('QS. Ad-Duha: 5','Dan sungguh, kelak Tuhanmu pasti memberikan karunia-Nya kepadamu, sehingga engkau menjadi puas.','And your Lord is going to give you, and you will be satisfied.'),
[13]=A('QS. Ghafir: 60','Berdoalah kepada-Ku, niscaya akan Kuperkenankan bagimu.','Call upon Me; I will respond to you.'),
[14]=A('QS. Ar-Rahman: 13','Maka nikmat Tuhanmu yang manakah yang kamu dustakan?','So which of the favors of your Lord would you deny?'),
[15]={ref="QS. Al-A'la: 1",id='Sucikanlah nama Tuhanmu Yang Mahatinggi.',en='Exalt the name of your Lord, the Most High.'},
[16]=A('QS. An-Nasr: 3','Maka bertasbihlah dengan memuji Tuhanmu dan mohonlah ampunan kepada-Nya.','Then exalt [Him] with praise of your Lord and ask forgiveness of Him.'),
[17]={ref="QS. Asy-Syu'ara: 80",id='Dan apabila aku sakit, Dialah yang menyembuhkan aku.',en='And when I am ill, it is He who cures me.'},
[18]=A('QS. Al-Hadid: 4','Dan Dia bersama kamu di mana saja kamu berada.','And He is with you wherever you are.'),
[19]=A('QS. Al-Baqarah: 152','Maka ingatlah kepada-Ku, Aku pun akan ingat kepadamu. Bersyukurlah kepada-Ku, dan janganlah kamu ingkar kepada-Ku.','So remember Me; I will remember you. And be grateful to Me and do not deny Me.'),
[20]=A('QS. Al-Baqarah: 153','Wahai orang-orang yang beriman! Mohonlah pertolongan (kepada Allah) dengan sabar dan shalat.','O you who have believed, seek help through patience and prayer.'),
[21]=A('QS. Al-Hujurat: 10','Sesungguhnya orang-orang mukmin itu bersaudara, karena itu damaikanlah antara kedua saudaramu.','The believers are but brothers, so make settlement between your brothers.'),
[22]=A('QS. Al-Hujurat: 13','Sesungguhnya yang paling mulia di antara kamu di sisi Allah ialah orang yang paling bertakwa.','Indeed, the most noble of you in the sight of Allah is the most righteous of you.'),
[23]=A('QS. An-Nahl: 128','Sungguh, Allah beserta orang-orang yang bertakwa dan orang-orang yang berbuat kebaikan.','Indeed, Allah is with those who fear Him and those who are doers of good.'),
[24]=A('QS. Al-Baqarah: 195','Dan berbuat baiklah. Sungguh, Allah menyukai orang-orang yang berbuat baik.','And do good; indeed, Allah loves the doers of good.'),
[25]={ref="QS. Ali 'Imran: 139",id='Dan janganlah kamu (merasa) lemah, dan jangan (pula) bersedih hati, sebab kamu paling tinggi (derajatnya), jika kamu orang beriman.',en='So do not weaken and do not grieve, and you will be superior if you are [true] believers.'},
[26]={ref="QS. Ali 'Imran: 200",id='Wahai orang-orang yang beriman! Bersabarlah kamu dan kuatkanlah kesabaranmu dan tetaplah bersiap-siaga dan bertakwalah kepada Allah.',en='O you who have believed, persevere and endure and remain stationed and fear Allah.'},
[27]=A('QS. An-Nisa: 103','Sungguh, shalat itu adalah kewajiban yang ditentukan waktunya atas orang-orang yang beriman.','Indeed, prayer has been decreed upon the believers a decree of specified times.'),
[28]=A('QS. Al-Fajr: 27','Wahai jiwa yang tenang!','O reassured soul,'),
[29]=A('QS. Al-Fajr: 28','Kembalilah kepada Tuhanmu dengan hati yang ridha dan diridhai-Nya.','Return to your Lord, well-pleased and pleasing [to Him],'),
[30]=A('QS. Al-Furqan: 74','Ya Tuhan kami, anugerahkanlah kepada kami pasangan kami dan keturunan kami sebagai penyenang hati (kami).','Our Lord, grant us from among our wives and offspring comfort to our eyes.'),
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
if pool_idx and S.BUILTIN_AYAHS[pool_idx] then
text=S.BUILTIN_AYAHS[pool_idx].en
ref=S.BUILTIN_AYAHS[pool_idx].ref
else
local L=S.LANGS.en
local q=L.quotes[((day or 0)% #L.quotes)+1]
text=q[1] .. ' ' .. q[2]
ref=q[3]
end
elseif not is_en and(not text or text=='')then
if pool_idx and S.BUILTIN_AYAHS[pool_idx] then
text=S.BUILTIN_AYAHS[pool_idx].id
ref=S.BUILTIN_AYAHS[pool_idx].ref
else
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
return S
end)()
local asked_at=nil
local function try_fetch_month(now_info,cfg)
if not cfg.prov or not cfg.kab then return end
if asked_at and(now_info.epoch - asked_at)<900 then return end
asked_at=now_info.epoch
pcall(function()
local body_req=string.format(
'{"provinsi":"%s","kabkota":"%s","bulan":%d,"tahun":%d}',
cfg.prov,cfg.kab,now_info.m,now_info.y
)
ctx.net:request({
url='https://equran.id/api/v2/shalat',
method='POST',
headers={['Content-Type']='application/json'},
body=body_req,
timeout_ms=25000,
},function(c,resp)
pcall(function()
if type(resp)~='table' or type(resp.body)~='string' then return end
local cache_s=S.parse_schedule_json(resp.body,cfg.prov,cfg.kab)
if cache_s then
S.write(S.cache_name(now_info.y,now_info.m),cache_s)
pcall(function()ctx:invalidate()end)
end
end)
end)
end)
end
function on_draw(c,gg)
if not gg then return end
local ok,err=pcall(function()
gg:clear(0)
local cfg=S.load_cfg()
local L=S.L(cfg)
local now_info=S.now(cfg)
local info=S.compute(now_info,cfg)
S.draw_app_icon(gg,20,12,50)
gg:text(82,14,S.fit_text(now_info.date_str,'medium',S.W - 102),{font=S.font('medium')})
gg:text(82,40,S.fit_text(info.hijri_str,'small',S.W - 102),{font=S.font('small')})
S.big_clock(gg,now_info.hhmm,S.W // 2,68,96,cfg.cfont)
local sub_loc=(cfg.country=='Indonesia' or not cfg.country)and(cfg.prov or 'DKI Jakarta')or(cfg.country or 'Indonesia')
local loc_str=(cfg.kab or 'Kota Jakarta').. '  •  ' .. sub_loc
local lw=math.min(S.text_w(loc_str,'small')+28,S.W - 40)
local lx=(S.W - lw)// 2
S.round_rect(gg,lx,172,lw,26,13,nil,true,0)
S.round_rect(gg,lx,172,lw,26,13,1)
S.center_text(gg,S.W // 2,176,loc_str,'small',lw - 16)
if not info.has_data then
try_fetch_month(now_info,cfg)
S.card(gg,24,218,S.W - 48,180,2,true)
S.center_text(gg,S.W // 2,252,L.lock_no_data,'large',S.W - 80)
S.center_text(gg,S.W // 2,298,L.lock_no_l1,'small',S.W - 80)
S.center_text(gg,S.W // 2,324,L.lock_no_l2,'small',S.W - 80)
else
S.draw_next_card(gg,20,208,S.W - 40,114,info,cfg.cfont)
S.draw_timeline(gg,20,332,S.W - 40,34,info)
end
S.try_fetch_quote(now_info,cfg,info)
S.divider(gg,614,24,S.W - 24)
S.draw_quote(gg,624,now_info.day,cfg)
end)
if not ok then
pcall(function()
gg:text(12,760,'Lock err: ' .. tostring(err):sub(1,42),{font=S.font('small')})
end)
end
end
function on_load()end
function on_tick()end
function on_input()return false end
