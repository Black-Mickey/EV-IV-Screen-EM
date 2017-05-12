AS=arm-none-eabi-as
LD=arm-none-eabi-ld
OBJCOPY=arm-none-eabi-objcopy
CC=arm-none-eabi-gcc

ASFLAGS=-mthumb
CFLAGS= -std=gnu11 -mthumb -mthumb-interwork -mcpu=arm7tdmi -fno-inline -mlong-calls -march=armv4t -Wall -Wextra -Wconversion -O2
LDFLAGS=-z muldefs --relocatable

.PHONY: clean,objects

all: objects
	$(LD) $(LDFLAGS) -T linker.lsc -T bpee.ld -o "build\linked.o" "build\main.o" "build\cb_execute.o" "build\sub_bg_init.o" "build\task_loader.o" "build\tiles_load.o" "build\string_print.o" "build\decrypt_and_print.o" "build\load_icons.o" "build\task_02.o" "build\resource.o" "build\callback8130FB8.o"
	armips insert.asm
	@echo "Compilation Completed."
	

objects:
	mkdir -p build
	$(CC) $(CFLAGS) -c "src\resource.c" -o "build\resource.o"
	$(CC) $(CFLAGS) -c "src\main.c" -o "build\main.o"
	$(CC) $(CFLAGS) -c "src\cb_execute.c" -o "build\cb_execute.o"
	$(CC) $(CFLAGS) -c "src\sub_bg_init.c" -o "build\sub_bg_init.o"
	$(CC) $(CFLAGS) -c "src\task_loader.c" -o "build\task_loader.o"
	$(CC) $(CFLAGS) -c "src\tiles_load.c" -o "build\tiles_load.o"
	$(CC) $(CFLAGS) -c "src\string_print.c" -o "build\string_print.o"
	$(CC) $(CFLAGS) -c "src\decrypt_and_print.c" -o "build\decrypt_and_print.o"
	$(AS) $(ASFLAGS) -c "src\load_icons.s" -o "build\load_icons.o"
	$(AS) $(ASFLAGS) -c "src\callback8130FB8.s" -o "build\callback8130FB8.o"
	$(CC) $(CFLAGS) -c "src\task_02.c" -o "build\task_02.o"
	
clean:
	rm build//*
