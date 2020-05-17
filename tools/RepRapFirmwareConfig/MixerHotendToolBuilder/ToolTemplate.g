M98 P"0:/macros/Config Scripts/Change Toolhead"
M98 P"0:/macros/Config Scripts/Tool Setups/Parts Fan"

M451						; FFF Mode

;Heater 1 (HTF1)
M308 S1 P"temp1" Y"thermistor" T100000 B4138 A"HTF1"	; configure sensor 1 as thermistor on pin temp1
M950 H1 C"out1" T1			; create nozzle heater output on out1 and map it to sensor 1
M143 H1 S280				; set temperature limit for heater 1 to 280C

;Hotend Fan
M950 F1 C"out4" Q50			; create fan 2 on pin out4 and set its frequency
M106 P1 S0 H1 T30 C"Hotend"		; set fan 2 value. Thermostatic control is turned on

;Tools
<<DefinitionsHere>>
M92 E96.2001				; Feed rate

;Tuning result for heaters
M307 H1 A424.6 C236.6 D6.6 S1.0 V24.0 B0 ; tune heater for reprap diamond

;Set filament size 
M200 D1.75

echo "Configured for 3 to 1 Bowden Hotend"

M28 "0:/sys/lasttool.g"
M98 P"0:/macros/Config Scripts/Setup 3 to 1 Hotend"
M29