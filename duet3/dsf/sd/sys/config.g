; Configuration file for Duet 3 (firmware version 3)
; executed by the firmware on start-up
; update by Matthew Whited (c) 04/2020+

M118 "Starting Configuration!"

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
M584 X0.2 Y0.1 Z0.0 E0.3:0.4:0.5			; set drive mapping
M350 X16 Y16 Z16 E16 I1					; configure microstepping with interpolation
M92 X79.83 Y78.65 Z397.23 E600.00			; set steps per mm
M566 X900.00 Y900.00 Z12.00 E120.00			; set maximum instantaneous speed changes (mm/min)
M203 X20000 Y20000 Z3000 E6000				; set maximum speeds (mm/min)
M201 X5000.00 Y5000.00 Z100.00 E1000.00			; set accelerations (mm/s^2)
M906 X2000 Y2000 Z2000 E2000 I30			; set motor currents (mA) and motor idle factor in per cent
M84 S30							; Set idle timeout

; Axis Limits
M208 X0 Y0 Z0 S1					; set axis minima
M208 X216 Y200 Z220 S0					; set axis maxima

; Endstops
M574 X1 S1 P"^io4.in+^io5.in"				; configure active-high endstop for low end on X via pin ^io4.in
M574 Y1 S1 P"^io2.in+^io3.in"				; configure active-high endstop for low end on Y via pin ^io2.in
M574 Z1 S1 P"^io0.in+^io1.in"				; configure active-high endstop for low end on Z via pin ^io0.in

; Z-Probe
M558 P0 H5 F120 T6000					; disable Z probe but set dive height, probe speed and travel speed
M557 X15:195 Y15:195 S20				; define mesh grid

;Power Supply
M308 S3 P"temp3" Y"thermistor" T100000 B4138 A"PS"	; configure sensor 3 as thermistor on pin temp3 for Power supply
M950 F3 C"out9" Q500                                    ; create fan 3 on pin out9 and set its frequency
M106 C"Power Supply" P3 H-1 S0.0			; Power supply fan (3) linked to pwoer supply temp (3) Turn on at 35C

; Tools
;Tools are configured in 0:/macros/Config Scripts

; Configure outputs for Relay Controller
M950 P0 C"io6.out"					; setup relay 0
M42 P0 S0						; set relay 0 off
M950 P1 C"io7.out"					; setup relay 1
M42 P1 S0						; set realy 1 off
M950 P2 C"io8.out"					; setup relay 2
M42 P1 S0						; set realy 2 off

; configure bed
M98 P"0:/macros/Config Scripts/Heated Bed - 200x200 Glass"

; Execute config-override.g
M501							; Execute config-override.g
M98 P"0:/sys/lasttool.g"				; Configure tool for last manual selection

M118 "Loaded Configuration"


