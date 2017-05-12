# EV-IV-Screen

* How to use
1. Make sure that you have Devkitarm and make installed. armips v0.8/0.9 is required.     
2. Download this repo.   
3. Assign the free space you want to use in insert.asm.   
4. A clean EMERALD ROM named "bpee0.gba" should be in the directory.   
5. Open your cmd prompt and type in make. Then press enter.   
6. "test.gba" is generated, that's the output ROM.   
7. Write a script to test (You should callasm to the offset of insertion).   

Example:
lock  
faceplayer  
callasm 0x8F90001  //I inserted the code at 0x8F90000  
msgbox 0x8FD0013 0x2 //string: "It's nice, huh?"  
releaseall  
end
