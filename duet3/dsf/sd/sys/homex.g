; homeX.g
; called to home and measure the X axis
;

G91			; relative positioning

;home min
M574 X2 S1		; set high endstop
G1 X-250 H1 F1800
M574 X1 S1		; set low endstop
G1 X-2 F360
G1 X-250 H1 F1800	; Home X to 0 "quickly"

G1 X5 F360		; back off endstop

M574 X1 S1		; set low endstop
G1 X-250 H1 F360	; Home X to 0 "slowly"

G90               	; absolute positioning
