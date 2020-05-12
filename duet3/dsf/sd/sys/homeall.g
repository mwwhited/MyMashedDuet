; homeall.g
; called to home all axes
;


M574 X1 Y1 Z1 S1		; set low endstop
G91                     ; relative positioning
G1 H2 Z5 F3000          ; lift Z relative to current position
G1 H1 X-205 Y-205 F1800 ; move quickly to X and Y axis endstops and stop there (first pass)
G1 H2 X5 Y5 F3000       ; go back a few mm
G1 H1 X-205 Y-205 F360  ; move slowly to X and Y axis endstops once more (second pass)
G1 H1 Z-205 F360        ; move Z down stopping at the endstop
G90                     ; absolute positioning
G92 Z0                  ; set Z position to axis minimum (you may want to adjust this)
