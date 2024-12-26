.TEMP 25
.OPTION

.param period=0.5n

**replace with your path**
.lib '/afs/asu.edu/users/k/p/a/kpavanga/425_lab/iPDK/hspice/saed32nm.lib' TT

**Include your .spf file here**
.include "./Full_adder_4bit.spf"

*********************************************************
****SAMPLE ONLY CHANGE WITH RESPECT TO SPECIFICATIONS****
*********************************************************
.param pvdd =1.05
Vgnd gnd! 0 DC=0
Vvdd vdd! 0 DC=1.05

xtest ACin A0 B0 A1 B1 A2 B2 A3 B3 Cout SFA0 SFA3 SFA1 SFA2 gnd! vdd! Full_adder_4bit

.SUBCKT INVx04 a y
*.PININFO a:I y:O
XMM0 y a gnd! gnd! n105 m=1 w=1.68u l=30n ad=10.5f as=10.5f pd=310n ps=310n
XMM1 y a vdd! vdd! p105 m=1 w=2.56u l=30n ad=10.5f as=10.5f pd=310n ps=310n
.ENDS

xinv0 SFA0 Sinvload<0> INVx04
xinv1 SFA1 Sinvload<1> INVx04
xinv2 SFA2 Sinvload<2> INVx04
xinv3 SFA3 Sinvload<3> INVx04

*************Input signals***************** 
******************************************* 
vA0 A0 0 PWL(0ns 0 1ns 
+0	1.03ns	1.05	3ns 
+1.05	3.03ns	0	3.5ns
+0 	3.53ns 1.05	4ns 
+1.05 	4.03ns 0 	4.5ns
+0 	4.53ns 1.05	6ns
+1.05 	6.03ns 0 	6.5ns)
*******************************************
vA1 A1 0 PWL(0ns 0 1ns 
+0	1ns	0	3ns
+0	3.03ns	1.05	5ns
+1.05 	5.03ns 0 	6ns
+0	6.03ns	1.05	6.5ns)
*******************************************
vA2 A2 0 PWL(0ns 0 1ns 
+0	1ns	0	3ns
+0	3.03ns	1.05	4ns
+1.05 	4.03ns 0 	5ns
+0	5.03ns	1.05	6ns)
*******************************************
vA3 A3 0 PWL(0ns 0 1ns 
+0	1ns	0	2ns
+0	2.03ns	1.05	2.5ns
+1.05 	2.53ns 0 	4ns
+0	4.03ns	1.05	5ns
+1.05 	5.03ns 0 	6ns)

*******************************************

*******************************************
vB0 B0 0 PWL(0ns 0 1ns 
+0	1ns	0	1.5ns
+0	1.53ns	1.05	2ns
+1.05 	2.03ns 0 	3ns
+0	3.03ns	1.05	5ns
+1.05 	5.03ns 0 	5.5ns
+0	5.53ns	1.05	6ns) 
*******************************************
vB1 B1 0 PWL(0ns 0 1ns 
+0	1.03ns	1.05	3ns
+1.05	3.03ns	0	5ns
+0	5.03ns	1.05	6ns
+1.05	6.03ns	0	6.5ns)
*******************************************
vB2 B2 0 PWL(0ns 0 1ns 
+0	1.03ns	1.05	3ns
+1.05	3.03ns	0	4ns
+0	4.03ns	1.05	5ns
+1.05	5.03ns	0	6ns)
*******************************************
vB3 B3 0 PWL(0ns 0 1ns 
+0	1ns	0	5ns
+0	5.03ns	1.05	6ns)
*******************************************

vCin Cin 0 DC=0

.measure tran Pow AVG power from='period*2' to='14*period'
.measure tran TotCurrent INTEGRAL i(Vvdd) from='2*period' to='14*period'

.tran 2p '8n' Start=0.0
.probe v(*)
.option MEASDGT=5
.option post
.end


