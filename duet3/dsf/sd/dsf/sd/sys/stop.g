; stop.g
; called when M0 (Stop) is run (e.g. when a print from SD card is cancelled)
;
; generated by RepRapFirmware Configuration Tool v2.1.8 on Mon Apr 13 2020 22:32:46 GMT-0400 (Eastern Daylight Time)

M98 P"0:/macros/Front and Center"

;;Move front and center
;G91
;G0 Z5
;G90 			; ensure absolute 
;G0 X100 Y200 f4000	; move front and center

