.TEMP 25
.OPTION

**Change your period here**
.param period=0.5n

**replace with your path**
.lib '/afs/asu.edu/users/k/p/a/kpavanga/425_lab/iPDK/hspice/saed32nm.lib' TT

**Include your .spf file here**
.include "./Full_adder_4bit.spf"

********************************************************
****SAMPLE ONLY CHANGE WITH RESPECT TO SPECIFICATIONS****
*********************************************************
.param pvdd =1.05
.param period1='period*2'
.param period2='period*4'
.param tr='30p'
.param tf='30p'
.param d='period-100p'


Vgnd gnd! 0 DC=0
Vvdd vdd! 0 DC=1.05

xtest Cin A0 B0 A1 B1 A2 B2 A3 B3 Cout SFA0 SFA3 SFA1 SFA2 gnd! vdd! Full_adder_4bit

.SUBCKT INVx04 a y
*.PININFO a:I y:O
XMM0 y a gnd! gnd! n105 m=1 w=1.68u l=30n ad=10.5f as=10.5f pd=310n ps=310n
XMM1 y a vdd! vdd! p105 m=1 w=2.56u l=30n ad=10.5f as=10.5f pd=310n ps=310n
.ENDS

xinv0 SFA0 Sinvload<0> INVx04
xinv1 SFA1 Sinvload<1> INVx04
xinv2 SFA2 Sinvload<2> INVx04
xinv3 SFA3 Sinvload<3> INVx04

vA3 A3 0 PULSE (0 1.05 d tr tf 180n period1)
vA2 A2 0 PULSE (0 1.05 d tr tf 180n period1)
vA1 A1 0 PULSE (0 1.05 d tr tf 180n period2)
vA0 A0 0 PULSE (0 1.05 d tr tf 180n period2)

vB3 B3 0 PULSE (0 0 d tr tf 180n period1)
vB2 B2 0 PULSE (0 0 d tr tf 180n period1)
vB1 B1 0 PULSE (0 0 d tr tf 180n period2)
vB0 B0 0 PULSE (0 1.05 1n tr tf 180n period2)

vCin Cin 0 DC=0

.tran 2p '9*period' Start=0.0
.probe v(*)
.option MEASDGT=5
.option post
.end
