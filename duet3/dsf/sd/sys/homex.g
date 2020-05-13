; homex.g
; called to home and measure the X axis
;

G91			; relative positioning

;home min
M574 X1 S1		; set low endstop
G1 X-5 F360
G1 X-250 H1 F1800	; Home x to 0 "quickly"

G1 X5 F360		; back off endstop

M574 X1 S1		; set low endstop
G1 X-250 H1 F360	; Home x to 0 "slowly"

G90               	; absolute positioning
