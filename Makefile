#						  			#
#						  			#
#			KMUS MAKE FILE 			#
#						  			#
#						  			#


OBJ=help
BINDIR=obj
WININSTDIR=install
ARCHDIR=targz

all: $(OBJ)

help:
	@echo  '**************************************'	
	@echo  '*  Kmus installation    *'
	@echo  '**************************************'
	@echo
	@echo  'make run              : Run Kmus (should have qemu)'
	@echo  'make compil-32        : Compile Kmus'
	@echo  'make build-iso-32     : Generate iso'

compil-32: compilmsg
compilmsg:
	@echo ===================[Compiling Kmus]===================
	mmc -c 32-bit/kernel.m++  -o kc.o -std=gnu99 -ffreestanding -O2 
	mmc -c 32-bit/driver/keyb.m++ -o kb.o -std=gnu99 -ffreestanding -O2
	mmc -c 32-bit/cmd_init.m++  -o cmdi.o -std=gnu99 -ffreestanding -O2
	mmc -c 32-bit/kktab.m++  -o kktab.o -std=gnu99 -ffreestanding -O2
	mmc -c 32-bit/ktop.m++  -o ktop.o -std=gnu99 -ffreestanding -O2
	mmc -c 32-bit/timer.m++  -o timer.o -std=gnu99 -ffreestanding -O2
	mmc -c 32-bit/fct_mem.m++  -o fmem.o -std=gnu99 -ffreestanding -O2
	mmc -c 32-bit/need.m++  -o need.o -std=gnu99 -ffreestanding -O2
	mmc -c 32-bit/gdt/gdt.m++  -o gdt.o -std=gnu99 -ffreestanding -O2
	mmc -c 32-bit/idt/idt.m++  -o idt.o -std=gnu99 -ffreestanding -O2
	mmc -c 32-bit/idt/error_idt.m++  -o eidt.o -std=gnu99 -ffreestanding -O2
	mmc -c 32-bit/pic/pic.m++  -o pic.o -std=gnu99 -ffreestanding -O2
	mmc -c 32-bit/VGA/vga.m++  -o vvga.o -std=gnu99 -ffreestanding -O2
	mmc -c 32-bit/screen/screen.m++  -o screen.o -std=gnu99 -ffreestanding -O2
	mmc -c 32-bit/m7taj.m++  -o m7.o -std=gnu99 -ffreestanding -O2
	mmc -c 32-bit/shell/m32.m++  -o m32.o -std=gnu99 -ffreestanding -O2
	mmc -c 32-bit/tm.m++  -o tm.o -std=gnu99 -ffreestanding -O2
	#mmc -c 32-bit/tasks/init_task.m++  -o itask.o -std=gnu99 -ffreestanding -O2
	#mmc -c 32-bit/shell/m32.m++ -o m32.o -std=gnu99 -ffreestanding -O2
	ld -m elf_i386 -T 32-bit/linker.ld -o kernel kasm.o sasm.o kc.o kb.o cmdi.o  kktab.o timer.o fmem.o need.o gdt.o idt.o eidt.o pic.o vvga.o ktop.o screen.o m7.o m32.o tm.o
	@echo ===================[Finished]===================

run: runmsg
runmsg:
	@echo ===================[Running Kmus]===================
	qemu-system-i386 -kernel kernel
	@echo ===================[Finished]===================
build-iso-32: buildisomsg
buildisomsg:
	@echo ===================[Building iso]===================
	grub-mkrescue -o kmus-32.iso isodir
	@echo ===================[Finished]===================


