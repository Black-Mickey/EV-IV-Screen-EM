.gba
.thumb
.create "test.gba",0x8000000
.close
.open "bpee0.gba","test.gba", 0x8000000

//DEFINE YOUR FREE OFFSET HERE
.org 0x8F90000
ldr r0, =main_func+1
bx r0
.pool
.importobj "build/linked.o"
.close