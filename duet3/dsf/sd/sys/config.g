; Configuration file for Duet 3 (firmware version 3)
; executed by the firmware on start-up
;
; Originally generated by RepRapFirmware Configuration Tool v2.1.8 on Mon Apr 13 2020 22:32:46 GMT-0400 (Eastern Daylight Time)
; update by Matthew Whited

echo "Loading Configuration"

; Settings from old RAMPS based (3drag controler) board.
;M92 X79.83 Y78.65 Z397.23 E600.00
;M203 X400.00 Y400.00 Z50.00 E100.00
;M201 X5000 Y9000 Z100 E1000
;M205 S0.00 B20000 X10.00 Z0.40 E5.00
;M206 X0.00 Y0.00 Z0.00
;M301 P63.00 I2.25 D440.00

; General preferences
G90                                                     ; send absolute coordinates...
M83                                                     ; ...but relative extruder moves
M550 P"Duet 3"                                          ; set printer name

; Drives
M569 P0.2 S1                                            ; physical drive 0.2 goes forwards
M569 P0.1 S1                                            ; physical drive 0.1 goes forwards
M569 P0.0 S1                                            ; physical drive 0.0 goes forwards
M569 P0.3 S0                                            ; physical drive 0.3 goes backwards
M569 P0.4 S0                                            ; physical drive 0.4 goes backwards
M569 P0.5 S0                                            ; physical drive 0.5 goes backwards
M584 X0.2 Y0.1 Z0.0 E0.3:0.4:0.5                     ; set drive mapping
M350 X16 Y16 Z16 E16 I1                      ; configure microstepping with interpolation
M92 X79.83 Y78.65 Z397.23 E600.00            ; set steps per mm
M566 X900.00 Y900.00 Z12.00 E120.00          ; set maximum instantaneous speed changes (mm/min)
M203 X6000.00 Y6000.00 Z900.00 E1200.00      ; set maximum speeds (mm/min)
M201 X500.00 Y500.00 Z80.00 E250.00          ; set accelerations (mm/s^2)
M906 X2000 Y2000 Z2000 E2000 I30                 ; set motor currents (mA) and motor idle factor in per cent
M84 S30                                      ; Set idle timeout

; Axis Limits
M208 X0 Y0 Z0 S1					; set axis minima
M208 X200 Y200 Z200 S0					; set axis maxima

; Endstops
M574 X1 S1 P"^io4.in"					; configure active-high endstop for low end on X via pin ^io4.in
M574 Y1 S1 P"^io2.in"					; configure active-high endstop for low end on Y via pin ^io2.in
M574 Z1 S1 P"^io0.in"					; configure active-high endstop for low end on Z via pin ^io0.in

;M574 X2 S1 P"^io5.in"					; configure active-high endstop for high end on X via pin ^io5.in
;M574 Y2 S1 P"^io3.in"					; configure active-high endstop for high end on Y via pin ^io3.in
;M574 Z2 S1 P"^io1.in"					; configure active-high endstop for high end on Z via pin ^io1.in

; https://duet3d.dozuki.com/Wiki/Gcode?revisionid=HEAD#Section_M950_Create_heater_fan_or_GPIO_servo_pin
; https://duet3d.dozuki.com/Wiki/Gcode?revisionid=HEAD#Section_M581_Configure_external_trigger
;M950 J1 C"^io5.in"	; X high end endstop
;M950 J2 C"^io3.in"	; Y high end endstop
;M950 J3 C"^io1.in"	; Z high end endstop
;M581 P1 T4 S1 C0
;M581 P2 T2 S1 C0
;M581 P3 T3 S1 C0

; Z-Probe
M558 P0 H5 F120 T6000					; disable Z probe but set dive height, probe speed and travel speed
M557 X15:195 Y15:195 S20				; define mesh grid

; Heaters
M308 S0 P"temp0" Y"thermistor" T100000 B4138 A"Bed"     ; configure sensor 0 as thermistor on pin temp0
M950 H0 C"out0" T0                                      ; create bed heater output on out0 and map it to sensor 0
M143 H0 S120                                            ; set temperature limit for heater 0 to 120C
M307 H0 B0 S1.00                                        ; disable bang-bang mode for the bed heater and set PWM limit
M140 H0                                                 ; map heated bed to heater 0

;HTF1
M308 S1 P"temp1" Y"thermistor" T100000 B4138 A"HTF1"	; configure sensor 1 as thermistor on pin temp1
M950 H1 C"out1" T1                                      ; create nozzle heater output on out1 and map it to sensor 1
M143 H1 S280                                            ; set temperature limit for heater 1 to 280C
M307 H1 B0 S1.00                                        ; disable bang-bang mode for heater  and set PWM limit
M950 F0 C"out7" Q500                                    ; create fan 0 on pin out7 and set its frequency
M106 P0 S0 H-1 C"HTF1"					; set fan 0 value. Thermostatic control is turned off

;HTF2
M308 S2 P"temp2" Y"thermistor" T100000 B4138 A"HTF2"	; configure sensor 2 as thermistor on pin temp2
M950 H2 C"out2" T2                                      ; create nozzle heater output on out2 and map it to sensor 2
M143 H2 S280                                            ; set temperature limit for heater 2 to 280C
M307 H2 B0 S1.00                                        ; disable bang-bang mode for heater  and set PWM limit
M950 F1 C"out8" Q500					; create fan 1 on pin out8 and set its frequency
M106 P1 S0 H-1 C"HTF2"					; set fan 1 value. Thermostatic control is turned on

; Fan 3
M950 F2 C"out4" Q50					; create fan 2 on pin out4 and set its frequency
M106 P2 S0 H1-1 C"Fan 3"				; set fan 2 value. Thermostatic control is turned on

;Power Supply
M308 S3 P"temp3" Y"thermistor" T100000 B4138 A"PS"	; configure sensor 3 as thermistor on pin temp3 for Power supply
M950 F3 C"out9" Q500                                    ; create fan 3 on pin out9 and set its frequency
M106 C"Power Supply" P3 H-1 S0.0			; Power supply fan (3) linked to pwoer supply temp (3) Turn on at 35C

; Tools
M563 P0 S"Direct Drive" D1 H1 F0                        ; define tool 0
G10 P0 X0 Y0 Z0                                         ; set tool 0 axis offsets
G10 P0 R0 S0                                            ; set initial tool 0 active and standby temperatures to 0C

;M563 P1 S"3mm Bowden" D0 H1 F0                          ; define tool 1
;G10 P1 X0 Y0 Z0                                         ; set tool 1 axis offsets
;G10 P1 R0 S0                                            ; set initial tool 1 active and standby temperatures to 0C

;M563 P2 S"Dual 1.75 Bowden" D0:1 H1:2 F0                ; define tool 2
;G10 P2 X0 Y0 Z0                                         ; set tool 2 axis offsets
;G10 P2 R0 S0                                            ; set initial tool 2 active and standby temperatures to 0C
;M568 P2 S1                                              ; enable mixing for tool 2
;M567 P2 E0.5:0.5                                        ; set mixing ratios for tool 2

;M563 P3 S"3 Color" D0:1:2 H1 F0                         ; define tool 3
;G10 P3 X0 Y0 Z0                                         ; set tool 3 axis offsets
;G10 P3 R0 S0                                            ; set initial tool 3 active and standby temperatures to 0C
;M568 P3 S1                                              ; enable mixing for tool 3
;M567 P3 E0.33:0.33:0.34                                 ; set mixing ratios for tool 3

;bank 1
M563 P10 S"Extruder 0" D0 H1 F0                          ; define tool 4
G10 P10 X0 Y0 Z0                                         ; set tool 4 axis offsets
G10 P10 R0 S0                                            ; set initial tool 4 active and standby temperatures to 0C
M563 P11 S"Extruder 1" D1 H1 F0                          ; define tool 4
G10 P11 X0 Y0 Z0                                         ; set tool 4 axis offsets
G10 P11 R0 S0                                            ; set initial tool 4 active and standby temperatures to 0C
M563 P12 S"Extruder 2" D2 H1 F0                          ; define tool 4
G10 P12 X0 Y0 Z0                                         ; set tool 4 axis offsets
G10 P12 R0 S0                                            ; set initial tool 4 active and standby temperatures to 0C
;bank 2
M563 P13 S"Extruder 3" D0 H1 F0                          ; define tool 4
G10 P13 X0 Y0 Z0                                         ; set tool 4 axis offsets
G10 P13 R0 S0                                            ; set initial tool 4 active and standby temperatures to 0C
M563 P14 S"Extruder 4" D1 H1 F0                          ; define tool 4
G10 P14 X0 Y0 Z0                                         ; set tool 4 axis offsets
G10 P14 R0 S0                                            ; set initial tool 4 active and standby temperatures to 0C
M563 P15 S"Extruder 5" D2 H1 F0                          ; define tool 4
G10 P15 X0 Y0 Z0                                         ; set tool 4 axis offsets
G10 P15 R0 S0                                            ; set initial tool 4 active and standby temperatures to 0C





; Custom settings are not defined

; Configure outpus for Relay Controller
M950 P0 C"io6.out"
M950 P1 C"io7.out"
M950 P2 C"io8.out"

;  Default all relays to off
M42 P0 S0
M42 P1 S0
M42 P2 S0

M501										 ; Execute config-override.g


