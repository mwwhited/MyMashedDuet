; homeZ.g
; called to home and measure the Z axis
;

G91			; relative positioning

;home min
M574 Z2 S1		; set high endstop
G1 Z-250 H1 F900
M574 Z1 S1		; set low endstop
G1 Z-5 F360
G1 Z-250 H1 F900	; Home Z to 0 "quickly"

G1 Z5 F360		; back off endstop

M574 Z1 S1		; set low endstop
G1 Z-250 H1 F360	; Home Z to 0 "slowly"

G90               	; absolute positioning
