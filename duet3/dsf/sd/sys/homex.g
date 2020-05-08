; homex.g
; called to home the X axis
;
; generated by RepRapFirmware Configuration Tool v2.1.8 on Mon Apr 13 2020 22:32:46 GMT-0400 (Eastern Daylight Time)
;G91               ; relative positioning
;G1 H2 Z5 F6000    ; lift Z relative to current position
;G1 H1 X-205 F1800 ; move quickly to X axis endstop and stop there (first pass)
;G1 H2 X5 F6000    ; go back a few mm
;G1 H1 X-205 F360  ; move slowly to X axis endstop once more (second pass)
;G1 H2 Z-5 F6000   ; lower Z again
;G90               ; absolute positioning

G91			; relative positioning
M208 X0 S1		; X set minimum to 0
M208 X250 S0		; X set maximum to 250

;home min
M574 X1 S1		; set low endstop
G1 X-250 H1 F1800	; Home x to 0 "quickly"
G1 X5 F360		; back off endstop
G1 X-250 H1 F360	; Home x to 0 "slowly"

; measure max
M574 X2 S1		; set high endstop
G1 X5 F360		; back off endstop
G1 X300 H3 F900		; measure X
G1 X-5 F360		; back off endstop 

;home min
M574 X1 S1		; set low endstop
G1 X-250 H1 F1800	; Home x to 0 "quickly"
G1 X5 F360		; back off endstop
G1 X-250 H1 F360	; Home x to 0 "slowly"

G90               ; absolute positioning
G0  X{move.axes[0].max/2} F20000	; move center
