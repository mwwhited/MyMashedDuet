; homey.g
; called to home and measure the Y axis
;

G91			; relative positioning

;home min
M574 Y1 S1		; set low endstop
G1 Y-250 H1 F1800	; Home Y to 0 "quickly"
G1 Y5 F360		; back off endstop
G1 Y-250 H1 F360	; Home Y to 0 "slowly"

G90               ; absolute positioning
