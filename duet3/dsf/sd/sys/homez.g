; homeZ.g
; called to home and measure the Z axis
;


M906 X800 Y800 Z800 E800 I30	; reduce current to increase slip when hitting limits

G91				; relative positioning

;home min
M574 Z1 S1			; set low endstops
G1 Z-250 H1 F1800		; Home to 0 "quickly"
G1 Z5 F360			; back off endstops
G1 Z-250 H1 F360		; Home to 0 "slowly"

G90               		; absolute positioning

M906 X2000 Y2000 Z2000 E2000 I30; restore current 