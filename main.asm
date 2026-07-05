.include "ATxmega128A1Udef.inc"

.cseg
.org 0x0000
    rjmp START

START:
    ; Stack pointer
    ldi r16, low(RAMEND)
    out CPU_SPL, r16
    ldi r16, high(RAMEND)
    out CPU_SPH, r16

    ; PC0 as output
    ldi r16, 0x01
    sts PORTC_DIRSET, r16

    ; TCC0 Channel A in FRQ mode
    ldi r16, TC_WGMODE_FRQ_gc | TC0_CCAEN_bm
    sts TCC0_CTRLB, r16

MAIN:
    ; Twinkle Twinkle Little Star
    rcall NOTE_C4
    rcall DELAY_NOTE
    rcall NOTE_OFF
    rcall DELAY_GAP

    rcall NOTE_C4
    rcall DELAY_NOTE
    rcall NOTE_OFF
    rcall DELAY_GAP

    rcall NOTE_G4
    rcall DELAY_NOTE
    rcall NOTE_OFF
    rcall DELAY_GAP

    rcall NOTE_G4
    rcall DELAY_NOTE
    rcall NOTE_OFF
    rcall DELAY_GAP

    rcall NOTE_A4
    rcall DELAY_NOTE
    rcall NOTE_OFF
    rcall DELAY_GAP

    rcall NOTE_A4
    rcall DELAY_NOTE
    rcall NOTE_OFF
    rcall DELAY_GAP

    rcall NOTE_G4
    rcall DELAY_LONG
    rcall NOTE_OFF
    rcall DELAY_GAP

    rcall NOTE_F4
    rcall DELAY_NOTE
    rcall NOTE_OFF
    rcall DELAY_GAP

    rcall NOTE_F4
    rcall DELAY_NOTE
    rcall NOTE_OFF
    rcall DELAY_GAP

    rcall NOTE_E4
    rcall DELAY_NOTE
    rcall NOTE_OFF
    rcall DELAY_GAP

    rcall NOTE_E4
    rcall DELAY_NOTE
    rcall NOTE_OFF
    rcall DELAY_GAP

    rcall NOTE_D4
    rcall DELAY_NOTE
    rcall NOTE_OFF
    rcall DELAY_GAP

    rcall NOTE_D4
    rcall DELAY_NOTE
    rcall NOTE_OFF
    rcall DELAY_GAP

    rcall NOTE_C4
    rcall DELAY_LONG
    rcall NOTE_OFF
    rcall DELAY_PAUSE

    rjmp MAIN

; -----------------------------------------
; Notes for F_CPU = 2 MHz, Prescaler = 64
; -----------------------------------------

NOTE_C4:
    ldi r16, low(59)       ; 262 Hz
    sts TCC0_CCA, r16
    ldi r16, high(59)
    sts TCC0_CCA+1, r16
    ldi r16, TC_CLKSEL_DIV64_gc
    sts TCC0_CTRLA, r16
    ret

NOTE_D4:
    ldi r16, low(52)       ; 294 Hz
    sts TCC0_CCA, r16
    ldi r16, high(52)
    sts TCC0_CCA+1, r16
    ldi r16, TC_CLKSEL_DIV64_gc
    sts TCC0_CTRLA, r16
    ret

NOTE_E4:
    ldi r16, low(46)       ; 330 Hz
    sts TCC0_CCA, r16
    ldi r16, high(46)
    sts TCC0_CCA+1, r16
    ldi r16, TC_CLKSEL_DIV64_gc
    sts TCC0_CTRLA, r16
    ret

NOTE_F4:
    ldi r16, low(44)       ; 349 Hz
    sts TCC0_CCA, r16
    ldi r16, high(44)
    sts TCC0_CCA+1, r16
    ldi r16, TC_CLKSEL_DIV64_gc
    sts TCC0_CTRLA, r16
    ret

NOTE_G4:
    ldi r16, low(39)       ; 392 Hz
    sts TCC0_CCA, r16
    ldi r16, high(39)
    sts TCC0_CCA+1, r16
    ldi r16, TC_CLKSEL_DIV64_gc
    sts TCC0_CTRLA, r16
    ret

NOTE_A4:
    ldi r16, low(35)       ; 440 Hz
    sts TCC0_CCA, r16
    ldi r16, high(35)
    sts TCC0_CCA+1, r16
    ldi r16, TC_CLKSEL_DIV64_gc
    sts TCC0_CTRLA, r16
    ret

NOTE_OFF:
    ldi r16, TC_CLKSEL_OFF_gc
    sts TCC0_CTRLA, r16
    ret

; -----------------------------------------
; Delays
; -----------------------------------------

DELAY_NOTE:
    ldi r20, 6
DN1:
    ldi r21, 255
DN2:
    ldi r22, 255
DN3:
    dec r22
    brne DN3
    dec r21
    brne DN2
    dec r20
    brne DN1
    ret

DELAY_LONG:
    ldi r20, 10
DL1:
    ldi r21, 255
DL2:
    ldi r22, 255
DL3:
    dec r22
    brne DL3
    dec r21
    brne DL2
    dec r20
    brne DL1
    ret

DELAY_GAP:
    ldi r20, 1
DG1:
    ldi r21, 120
DG2:
    dec r21
    brne DG2
    dec r20
    brne DG1
    ret

DELAY_PAUSE:
    ldi r20, 12
DP1:
    ldi r21, 255
DP2:
    dec r21
    brne DP2
    dec r20
    brne DP1
    ret