.thumb @make the assembler assemble it in thumb
.global load_icons @make it a global function
.thumb_func @make the assembler know that the function is in thumb
load_icons:
push {r4-r7,lr}
sub sp, sp, #0x8
ldr r4, =pal_graphics
mov r0, r4
ldr r3, =gpu_pal_obj_alloc_tag_and_apply
bl bx_r3
add r4, #8
mov r0, r4
ldr r3, =gpu_pal_obj_alloc_tag_and_apply
bl bx_r3
add r4, #8
mov r0, r4
ldr r3, =gpu_pal_obj_alloc_tag_and_apply
bl bx_r3
mov r4, sp
ldr r0, =pal_pc_hand
str r0, [r4]
ldr r0, =0x1303
str r0, [r4, #4]
mov r0, sp
ldr r3, =gpu_pal_obj_alloc_tag_and_apply
bl bx_r3
ldr r0, =bitmap_pc_hand
str r0, [r4]
ldr r0, =0x1406
strh r0, [r4, #6]
ldr r0, =0x400
strh r0, [r4, #4]
mov r0, sp
ldr r3, =gpu_tile_obj_alloc_tag_and_upload
bl bx_r3

check_start:
ldr r0, =0x20244E9
ldrb r4, [r0] @pokemon_quanitity
mov r5, #0

loop:
ldr r0, =0x20244EC
mov r1, #0x64
mul r1, r5
add r0, r1, r0
bl egg_check
cmp r0, #1
beq load_icon_egg
ldr r0, =0x20244EC
mov r1, #0x64
mul r1, r5
add r0, r1, r0
bl get_species
cmp r0, #0
beq back

load_icon_image:
mov r7, r0
ldr r1, =0x857BCA8
lsl r0, r0, #2
add r0, r1, r0
ldr r0, [r0]
str r0, [sp]
ldr r0, =0x400
mov r1, sp
strh r0, [sp, #4]
ldr r0, =0x1400
add r0, r5, r0
strh r0, [r1, #6]
mov r0, sp
ldr r3, =gpu_tile_obj_alloc_tag_and_upload
bl bx_r3
bl obj_spawn
add r5, #1
cmp r5, r4
bne loop
b back

load_icon_egg:
ldr r0, =0x8d8fc74
str r0, [sp]
ldr r0, =0x400
mov r1, sp
strh r0, [sp, #4]
ldr r0, =0x1400
add r0, r5, r0
strh r0, [r1, #6]
mov r0, sp
ldr r3, =gpu_tile_obj_alloc_tag_and_upload
bl bx_r3
mov r7, #0xFF
bl obj_spawn
add r5, #1
cmp r5, r4
bne loop

back:
bl load_hand
add sp, sp, #0x8
pop {r4-r7,pc}
.ltorg @same as .pool?

get_species:
push {lr}
mov r1, #0xB
ldr r3, =pokemon_getattr
bl bx_r3
pop {pc}
.ltorg

egg_check:
push {lr}
mov r1, #0x2D
ldr r3, =pokemon_getattr
bl bx_r3
pop {pc}
.ltorg

obj_spawn:
push {r4,lr}
sub sp, sp, #0x18
mov r1, sp
ldr r0, =0x1400
add r0, r5
strh r0, [r1]
cmp r7, #0xFF
beq spawn_egg
ldr r0, =0x857C388
add r0, r7, r0
ldrb r0, [r0]
b spawn_back

spawn_egg:
mov r0, #1

spawn_back:
ldr r2, =0x1300
add r0, r2, r0
strh r0, [r1, #2]
ldr r0, =image_anims
str r0, [r1, #8]
ldr r0, =oam
str r0, [r1, #4]
mov r0, #0
str r0, [r1, #12]
ldr r0, =0x80008A9
str r0, [r1, #0x14]
ldr r0, =rotscale
str r0, [r1, #0x10]
bl load_coords
mov r0, sp
mov r3, #0
ldr r4, =template_instanciate_forward_search
bl bx_r4
add sp, sp, #0x18
pop {r4, pc}
.ltorg

load_coords:
cmp r5, #3
blt upper
mov r0, #32
sub r1, r5, #3
mul r0, r1
mov r1, #0x98
add r1, r0, r1
mov r2, #0x68
b coo_back

upper:
mov r0,#32
mul r0, r5
mov r1, #0x98
add r1, r0, r1
mov r2, #0x48

coo_back:
bx lr

load_hand:
push {r4, lr}
sub sp, sp, #0x18
mov r4, sp
ldr r0, =0x1406
strh r0, [sp]
ldrh r0, =0x1303
strh r0, [r4, #2]
ldr r0, =image_anims
str r0, [r4, #8]
ldr r0, =oam2
str r0, [r4, #4]
mov r0, #0
str r0, [r4, #12]
ldr r0, =0x80008A9
str r0, [r4, #0x14]
ldr r0, =rotscale
str r0, [r4, #0x10]
mov r0, sp
mov r1, #0x9A
mov r2, #0x48
mov r3, #0
ldr r4, =template_instanciate_forward_search
bl bx_r4
ldr r4, =0x203D904
strb r0, [r4]
add sp, sp, #0x18
pop {r4, pc}
.ltorg

bx_r3:
bx r3

bx_r4:
bx r4

.align 2
pal_pc_hand:
	.byte   0,  0, 82, 86, 74, 45,255,127,249,127,235,118,139,102, 10, 82
	.byte 170, 61, 74, 45,  0,  0,123,123,148, 90, 82, 86,206, 61, 74, 45

pal_gfx_1:
	.byte 108, 66, 16, 58,247, 94,255,127,151, 34,222, 23,154, 33, 94, 22
	.byte 241,125, 44,101,221, 77,223, 82, 20,127,173, 78,140, 45,  8, 33
pal_gfx_2:
	.byte 108, 66,206, 57,247, 94,255,127,111, 38, 51, 39,210, 39,221, 77
	.byte  94,122,151, 46,158, 23,222, 87, 90, 55, 60, 21,140, 45,  8, 33
pal_gfx_3:
	.byte 108, 66,239, 61,247, 90,255,127,206,101,180,122, 22, 46, 29, 71
	.byte 184, 22,222, 23,158, 41,242,101,152,102,183, 76,140, 45,  8, 33

pal_graphics:
.word pal_gfx_1
.word 0x1300
.word pal_gfx_2
.word 0x1301
.word pal_gfx_3
.word 0x1302

image_anims:
.word img_anim

img_anim:
.hword 0,8,0x10,8,0xFFFE,0

oam:
.hword 0,0x8000,0x400,0

oam2:
.hword 0,0x8000,0,0

rotscale:
.word rot_null

rot_null:
.hword 0x100
.hword 0x100
.word 0x0
.hword 0x7FFF
.hword 0x0
.word 0x0

bitmap_pc_hand:
	.byte   0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0
	.byte   0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0
	.byte   0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0
	.byte   0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0, 16,  0,  0, 16, 33
	.byte   0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0
	.byte   0,  0,  1,  0,  0, 17, 18,  0, 17, 34, 35,  1, 34, 51, 59, 18
	.byte   0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0
	.byte   0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0
	.byte   0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0
	.byte   0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0
	.byte   0,  0, 33, 50,  0, 16, 50, 51,  0, 33, 51, 51, 16, 50, 51, 51
	.byte  16, 50, 51, 51, 33, 51, 51,187, 33, 51,179,187, 33, 51,179, 44
	.byte  51, 51,179, 35, 51, 51,179, 18, 51, 51,187, 18, 51, 51, 43,  1
	.byte  51, 51, 43,  1, 51, 51, 43,  1, 59,179, 43,  1,187,187, 44,  1
	.byte   1,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0
	.byte   0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0
	.byte   0,  0,  0,  0,  0,  0,  0, 16,  0,  0,  0, 16,  0,  0,  0, 16
	.byte   0,  0,  0, 16,  0,  0,  0, 16,  0,  0,  0,  0,  0,  0,  0,  0
	.byte  33, 51,203,204,178, 51, 43,204, 50, 51, 44, 34, 50,179, 18, 17
	.byte  50,179, 18,  0,178,203, 18,  0, 33, 34,  1,  0, 16, 17,  0,  0
	.byte 178,187, 18,  0,194,204, 18,  0, 33, 34,  1,  0, 16, 17,  0,  0
	.byte   0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0
	.byte   0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0
	.byte   0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0
	.byte   0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0
	.byte   0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0
	.byte   0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0
	.byte   0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0
	.byte   0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0
	.byte   0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0
	.byte   0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0
	.byte   0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0
	.byte   0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0
	.byte   0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0
	.byte   0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0
	.byte   0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0, 16
	.byte   0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0
	.byte   0,  0,  0,  0,  0,  0,  1,  0,  0, 17, 18,  0, 17, 34, 35,  1
	.byte   0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0
	.byte   0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0
	.byte   0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0
	.byte   0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0
	.byte   0,  0, 16, 33,  0,  0, 33, 50,  0, 16, 50, 51,  0, 33, 51, 51
	.byte  16, 50, 51, 51, 16, 50, 51, 51, 16, 50, 51, 59, 33, 59,179,187
	.byte  34, 51, 59, 18, 51, 51,179, 35, 51, 51,179, 18, 51, 51,187, 18
	.byte  51, 51, 43,  1, 51, 51, 43,  1, 51, 51, 43,  1, 51,179, 43,  1
	.byte   0,  0,  0,  0,  1,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0
	.byte   0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0
	.byte   0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0
	.byte   0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0
	.byte  33, 51,179, 44, 33, 51,179, 44, 33, 51,203,194, 33, 51,203, 34
	.byte  33, 51, 43, 17, 33, 51, 43,  1, 33,187, 44,  1, 16, 34, 18,  0
	.byte 187,187, 44,  1,188,187, 18,  0,194,204, 18,  0, 34, 34,  1,  0
	.byte  17, 17,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0
	.byte   0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0
	.byte   0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0
	.byte   0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0
	.byte   0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0
	.byte   0, 17,  1,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0
	.byte   0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0
	.byte   0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0
	.byte   0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0
	.byte   0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0
	.byte   0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0
