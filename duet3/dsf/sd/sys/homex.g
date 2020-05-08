; homex.g
; called to home and measure the X axis
;

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
