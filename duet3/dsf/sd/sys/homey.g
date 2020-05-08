; homey.g
; called to home and measure the Y axis
;

G91			; relative positioning
M208 Y0 S1		; Y set minimum to 0
M208 Y250 S0		; Y set maximum to 250

;home min
M574 Y1 S1		; set low endstop
G1 Y-250 H1 F1800	; Home x to 0 "quickly"
G1 Y5 F360		; back off endstop
G1 Y-250 H1 F360	; Home x to 0 "slowly"

; measure max
M574 Y2 S1		; set high endstop
G1 Y5 F360		; back off endstop
G1 Y300 H3 F900		; measure Y
G1 Y-5 F360		; back off endstop 

;home min
M574 Y1 S1		; set low endstop
G1 Y-250 H1 F1800	; Home x to 0 "quickly"
G1 Y5 F360		; back off endstop
G1 Y-250 H1 F360	; Home x to 0 "slowly"

G90               ; absolute positioning
G0  Y{move.axes[1].max/2} F20000	; move center