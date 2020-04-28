; pause.g
; called when a print from SD card is paused
;
; generated by RepRapFirmware Configuration Tool v2.1.8 on Mon Apr 13 2020 22:32:46 GMT-0400 (Eastern Daylight Time)
M83            ; relative extruder moves
G1 E-10 F3600  ; retract 10mm of filament

;Original Pause
;G91            ; relative positioning
;G1 Z5 F360     ; lift Z by 5mm
;G90            ; absolute positioning
;G1 X0 Y0 F6000 ; go to X=0 Y=0

M98 P"0:/macros/Position Scripts/Front and Center"

;Move front and center
;G91
;G0 Z5
;G90 			; ensure absolute 
;G0 X100 Y200 f4000	; move front and center
