.global cb_8130FB8
.thumb
.thumb_func
cb_8130FB8:
ldr r3, =0x2020630
mov r1, #0x2E
ldrh r2, [r0,r1]
lsl r1, r2, #4
add r1, r1, r2
lsl r1, r1, #2
add r1, r1, r3
add r1, #0x2B
ldrb r1, [r1]
strh r1, [r0, #0x26]
bx lr
