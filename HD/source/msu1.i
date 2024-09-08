;########################################
;# MEDIA STREAMING UNIT (MSU) REGISTERS #
;########################################
; XASM VERSION
; based on docs from
; https://helmet.kafuka.org/msu1.htm

	public	msu_status,msu_read,msu_id,msu_id2,msu_id3,msu_id4,msu_id5,msu_id6
	public	msu_seek,msu_seek2,msu_seek3,msu_seek4,msu_track,msu_track2,msu_volume,msu_control
	public	status_databusy,status_audiobusy,status_audiorepeat,status_audioplaying,status_trackmissing
	public	status_revision1,status_revision2,status_revision3
	public	audiostate_none,audiostate_norepeat,audiostate_repeat

; The MSU1 registers range from 
; $2000 to $2007. Their functions
; are different between reading and 
; writing.

; READING
msu_status	equ	$2000 ; Status port
msu_read	equ	$2001 ; Data read port
msu_id		equ	$2002 ; Identification bytes
msu_id2		equ $2003 ; contains ASCII string "S-MSU1"
msu_id3		equ $2004
msu_id4		equ $2005
msu_id5		equ $2006
msu_id6		equ $2007

; WRITING
msu_seek	equ	$2000 ; Data seek port
msu_seek2	equ	$2001
msu_seek3	equ	$2002
msu_seek4	equ	$2003
msu_track	equ	$2004 ; Current audio track
msu_track2	equ	$2005
msu_volume	equ	$2006 ; track volume from 0 - 255 ($FF)
msu_control	equ	$2007 ; stop/play/repeat track

; #################
; # MSU CONSTANTS #
; #################

; ## MSU_STATUS register ($2000) ##
status_databusy			equ %10000000 ; 128
status_audiobusy		equ %01000000 ; 64
status_audiorepeat		equ %00100000 ; 32
status_audioplaying		equ %00010000 ; 16
status_trackmissing		equ %00001000 ; 8
; Chip revision, will either report 1 or 2 depending on the emulator/hardware
status_revision1		equ %00000100 ; 4
status_revision2		equ %00000010 ; 2
status_revision3		equ %00000001 ; 1

; ## MSU_CONTROL register ($2007) ##
; Bit 0: Play track flag
; Bit 1: Repeat track flag
; Bit 2: Pause track flag
; Bits 3 - 7: unused
audiostate_none		equ	%00000000 ; 0
audiostate_norepeat	equ	%00000001 ; 1
audiostate_repeat	equ	%00000011 ; 3
audiostate_pause	equ	%00000100 ; 4

; Standard Volume for BGM
; (Volume can be further tweaked by adjusting normalization in tracks.json)
MusicVolume	equ	$FF

; BEGIN LIST OF MSU-1 TRACK IDS

; Episode I: Knee-Deep in the Dead
D_E1M1	equ	11	; At DOOM's Gate
D_E1M2	equ	12	; The Imp's Song
D_E1M3	equ 13	; Dark Halls
D_E1M4	equ	14	; Kitchen Ace (and Taking Names)
D_E1M5	equ	15	; Suspense
D_E1M6	equ 16	; On the Hunt
D_E1M7	equ	17	; Demons on the Prey
D_E1M8	equ	18	; Sign of Evil
D_E1M9	equ	19	; Hiding the Secrets

; Episode II: The Shores of Hell
D_E2M1	equ	21	; I Sawed the Demons
D_E2M2	equ	22	; The Demons from Adrian's Pen
D_E2M3	equ D_INTER ;23	; Intermission from DOOM
D_E2M4	equ	24	; They're Going to Get You
D_E2M5	equ	D_E1M7 ;25 ; Demons on the Prey
D_E2M6	equ 26	; Sinister
D_E2M7	equ	27	; Waltz of the Demons
D_E2M8	equ	28	; Nobody Told me About id (Cyberdemon Boss)
D_E2M9	equ	29	; Untitled (Mouth for War)

; Episode III: Inferno!
D_E3M1	equ	D_E2M9 ;31	; Untitled (Mouth for War)
D_E3M2	equ	32	; Donna to the Rescue
D_E3M3	equ 33	; Deep into the Code
D_E3M4	equ	D_E1M8 ;34	; Sign of Evil
D_E3M5	equ	D_E1M7 ;35	; Demons on the Prey
D_E3M6	equ D_E1M6 ;36	; On the Hunt
D_E3M7	equ	D_E2M7 ;37	; Waltz of the Demons
D_E3M8	equ	38	; Facing the Spider (Spider Mastermind Boss)
D_E3M9	equ	D_E1M9 ;39	; Hiding the Secrets

; Special stuff
D_INTRO	equ	1	; Introduction
D_INTER	equ	2	; Intermission from DOOM

; END LIST OF MSU-1 TRACK IDS

; EOF