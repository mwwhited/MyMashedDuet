; homeall.g
; called to home all axes
;

M574 X1 Y1 Z1 S1	; set low endstop
G91                     ; relative positioning
G1 H2 Z5 F3000          ; lift Z relative to current position
G1 H1 X-205 Y-205 F1800 ; move quickly to X and Y axis endstops and stop there (first pass)
G1 H2 X5 Y5 F3000       ; go back a few mm
G1 H1 X-205 Y-205 F360  ; move slowly to X and Y axis endstops once more (second pass)
G1 H1 Z-205 F360        ; move Z down stopping at the endstop
G90                     ; absolute positioning
G92 Z0                  ; set Z position to axis minimum (you may want to adjust this)

;G91					; relative positioning
;home min
;M574 X2 Y2 Z2 S1			; set high endstops
;G1 X-250 Y-250 Z-250 H1 F900
;M574 X1 Y1 Z1 S1			; set low endstops
;G1 X-5 Y-5 Z-5 F360
;G1 X-250 Y-250 Z-250 H1 F1800		; Home 0 "quickly"
;G1 X5 Y5 Z 5 F360			; back off endstops
;G1 X-250 Y-250 H1 F360			; Home 0 "slowly"
;G90               			; absolute positioning
