EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 1 5
Title ""
Date ""
Rev ""
Comp ""
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Comp
L Connector:Screw_Terminal_01x02 J?
U 1 1 5EA7E918
P 5700 1750
F 0 "J?" H 5780 1742 50  0000 L CNN
F 1 "Screw_Terminal_01x02" H 5780 1651 50  0000 L CNN
F 2 "" H 5700 1750 50  0001 C CNN
F 3 "~" H 5700 1750 50  0001 C CNN
	1    5700 1750
	1    0    0    -1  
$EndComp
$Comp
L Connector_Generic:Conn_01x08 J?
U 1 1 5EA75482
P 3700 1300
F 0 "J?" H 3780 1292 50  0000 L CNN
F 1 "Conn_01x08" H 3780 1201 50  0000 L CNN
F 2 "" H 3700 1300 50  0001 C CNN
F 3 "~" H 3700 1300 50  0001 C CNN
	1    3700 1300
	0    -1   -1   0   
$EndComp
$Sheet
S 4500 1500 800  1350
U 5EA8EEDA
F0 "RelayDriver" 50
F1 "Relay Driver.sch" 50
F2 "Output+" O R 5300 1750 50 
F3 "Output-" O R 5300 1850 50 
F4 "Vin" I L 4500 2650 50 
F5 "Input+" I L 4500 1700 50 
F6 "Input-" I L 4500 1800 50 
F7 "Ground" I L 4500 2750 50 
$EndSheet
$Sheet
S 4500 3050 800  1350
U 5EA9DFE6
F0 "sheet5EA9DFE6" 50
F1 "Relay Driver.sch" 50
F2 "Output+" O R 5300 3300 50 
F3 "Output-" O R 5300 3400 50 
F4 "Vin" I L 4500 4200 50 
F5 "Input+" I L 4500 3250 50 
F6 "Input-" I L 4500 3350 50 
F7 "Ground" I L 4500 4300 50 
$EndSheet
$Sheet
S 4500 4600 800  1350
U 5EA9E862
F0 "sheet5EA9E862" 50
F1 "Relay Driver.sch" 50
F2 "Output+" O R 5300 4850 50 
F3 "Output-" O R 5300 4950 50 
F4 "Vin" I L 4500 5750 50 
F5 "Input+" I L 4500 4800 50 
F6 "Input-" I L 4500 4900 50 
F7 "Ground" I L 4500 5850 50 
$EndSheet
$Sheet
S 4500 6150 800  1350
U 5EA9E86A
F0 "sheet5EA9E86A" 50
F1 "Relay Driver.sch" 50
F2 "Output+" O R 5300 6400 50 
F3 "Output-" O R 5300 6500 50 
F4 "Vin" I L 4500 7300 50 
F5 "Input+" I L 4500 6350 50 
F6 "Input-" I L 4500 6450 50 
F7 "Ground" I L 4500 7400 50 
$EndSheet
$Comp
L Connector:Screw_Terminal_01x02 J?
U 1 1 5EA9F3B6
P 5700 3300
F 0 "J?" H 5780 3292 50  0000 L CNN
F 1 "Screw_Terminal_01x02" H 5780 3201 50  0000 L CNN
F 2 "" H 5700 3300 50  0001 C CNN
F 3 "~" H 5700 3300 50  0001 C CNN
	1    5700 3300
	1    0    0    -1  
$EndComp
$Comp
L Connector:Screw_Terminal_01x02 J?
U 1 1 5EA9F8FE
P 5700 4850
F 0 "J?" H 5780 4842 50  0000 L CNN
F 1 "Screw_Terminal_01x02" H 5780 4751 50  0000 L CNN
F 2 "" H 5700 4850 50  0001 C CNN
F 3 "~" H 5700 4850 50  0001 C CNN
	1    5700 4850
	1    0    0    -1  
$EndComp
$Comp
L Connector:Screw_Terminal_01x02 J?
U 1 1 5EA9F908
P 5700 6400
F 0 "J?" H 5780 6392 50  0000 L CNN
F 1 "Screw_Terminal_01x02" H 5780 6301 50  0000 L CNN
F 2 "" H 5700 6400 50  0001 C CNN
F 3 "~" H 5700 6400 50  0001 C CNN
	1    5700 6400
	1    0    0    -1  
$EndComp
Wire Wire Line
	3000 7300 4300 7300
Wire Wire Line
	3000 7400 4400 7400
Wire Wire Line
	4500 5850 4400 5850
Wire Wire Line
	4400 5850 4400 7400
Connection ~ 4400 7400
Wire Wire Line
	4400 7400 4500 7400
Wire Wire Line
	4500 5750 4300 5750
Wire Wire Line
	4300 5750 4300 7300
Connection ~ 4300 7300
Wire Wire Line
	4300 7300 4500 7300
Wire Wire Line
	4400 5850 4400 4300
Wire Wire Line
	4400 4300 4500 4300
Connection ~ 4400 5850
Wire Wire Line
	4500 4200 4300 4200
Connection ~ 4300 5750
Wire Wire Line
	4500 2750 4400 2750
Wire Wire Line
	4400 2750 4400 4300
Connection ~ 4400 4300
Wire Wire Line
	4500 2650 4300 2650
Wire Wire Line
	4300 2650 4300 4200
Connection ~ 4300 4200
Wire Wire Line
	4300 4200 4300 5750
Wire Wire Line
	3400 1500 3400 1700
Wire Wire Line
	3400 1700 4500 1700
Wire Wire Line
	4500 1800 3500 1800
Wire Wire Line
	3500 1800 3500 1500
Wire Wire Line
	3600 1500 3600 3250
Wire Wire Line
	3600 3250 4500 3250
Wire Wire Line
	3700 1500 3700 3350
Wire Wire Line
	3700 3350 4500 3350
Wire Wire Line
	3800 1500 3800 4800
Wire Wire Line
	3800 4800 4500 4800
Wire Wire Line
	3900 1500 3900 4900
Wire Wire Line
	3900 4900 4500 4900
Wire Wire Line
	4000 1500 4000 6350
Wire Wire Line
	4000 6350 4500 6350
Wire Wire Line
	4100 1500 4100 6450
Wire Wire Line
	4100 6450 4500 6450
$Comp
L Connector:Screw_Terminal_01x02 J?
U 1 1 5EA7EE61
P 2800 7400
F 0 "J?" H 2880 7392 50  0000 L CNN
F 1 "Screw_Terminal_01x02" H 2880 7301 50  0000 L CNN
F 2 "" H 2800 7400 50  0001 C CNN
F 3 "~" H 2800 7400 50  0001 C CNN
	1    2800 7400
	-1   0    0    1   
$EndComp
Wire Wire Line
	5300 1750 5500 1750
Wire Wire Line
	5500 1850 5300 1850
Wire Wire Line
	5300 3300 5500 3300
Wire Wire Line
	5300 3400 5500 3400
Wire Wire Line
	5300 6400 5500 6400
Wire Wire Line
	5300 6500 5500 6500
Wire Wire Line
	5300 4850 5500 4850
Wire Wire Line
	5300 4950 5500 4950
$EndSCHEMATC
