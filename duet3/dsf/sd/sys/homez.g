; homez.g
; called to home and measure the Z axis
;

G91			; relative positioning

;home min
M574 Z1 S1		; set low endstop
G1 Z-250 H1 F1800	; Home x to 0 "quickly"
G1 Z5 F360		; back off endstop
G1 Z-250 H1 F360	; Home x to 0 "slowly"

G90               ; absolute positioning