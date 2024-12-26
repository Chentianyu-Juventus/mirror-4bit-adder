# mirror-4bit-adder
Lab #4: Design of a 4-bit Adder
Design goal: An 4-bit adder that minimizes the Power, Delay, and Area. 
Technology: For all the transistors, L = 30nm and VDD = 1.05V. The signal transition time (Tr) is 
defined at 10% to 90% of VDD. All input signals, including the clock, have Tr = 30ps. The load at 
each output bit is 4 minimum sized INV.
The minimum sized NMOS transistor you can use has WN = 300nm. If you use sizes smaller than 
this, you will lose credit. You will use Wp to match the LH and HL delay (as in Lab 1) for all of 
your gates.
Design approaches: You are free to choose any architecture for design. 
Performance metrics: Delay is defined based on the 50% transition points. You need to find the 
worst case delay of the adder. The Average Power is the switching power averaged over 10 test 
input sequences (see Table 1 for test sequences). Both Delay and Power should be simulated from 
the post-layout schematics, with the load (4 min. sized inverters).
Minimum design specifications are: Delay<400ps, Area <150m2
, and Power < 100W (for 5.5ns @0.5ns/bit)
Testbench: The testbench for testing your circuit and measuring specifications is provided. Please 
use this testbench. 
Score: The overall score for your design is calculated based on the following formula:
𝑆𝑐𝑜𝑟𝑒 =400𝑝𝑠/𝐷𝑒𝑙𝑎𝑦 +100𝜇𝑊/𝑃𝑜𝑤𝑒𝑟 +150𝜇𝑚2/𝐴𝑟𝑒𝑎
Report: Your report should provide the following items: 
1. Results: the values of your worst case delay, average power, total layout area, and score 
as calculated with respect to the formula above. Please list them in a table on the cover 
page of your report.
2. Circuit schematics at the transistor level: the 1-bit adder, and the architecture of the 4-
bit adder. Include all your transistor sizes.
3. Layout: show the layout of your 1-bit adder, the entire adder design.
