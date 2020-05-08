; homez.g
; called to home and measure the Z axis
;

G91			; relative positioning
M208 Z0 S1		; Z set minimum to 0
M208 Z250 S0		; Z set maximum to 250

;home min
M574 Z1 S1		; set low endstop
G1 Z-250 H1 F1800	; Home x to 0 "quickly"
G1 Z5 F360		; back off endstop
G1 Z-250 H1 F360	; Home x to 0 "slowly"

; measure max
M574 Z2 S1		; set high endstop
G1 Z5 F360		; back off endstop
G1 Z300 H3 F900		; measure Z
G1 Z-5 F360		; back off endstop 

;home min
M574 Z1 S1		; set low endstop
G1 Z-250 H1 F1800	; Home x to 0 "quickly"
G1 Z5 F360		; back off endstop
G1 Z-250 H1 F360	; Home x to 0 "slowly"

G90               ; absolute positioning
G0  Z{move.axes[2].max/2} F20000	; move center