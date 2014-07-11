# Declare constants used for creating a multiboot header.

.set ALIGN,   1<<0
.set MEMINFO, 1<<1
.set FLAGS,   ALIGN | MEMINFO
.set MAGIC,   0x1BADB002
.set CHECKSUM, -(MAGIC + FLAGS)
	
# Declare a header as in the Multiboot Standard. We put this into a special
# section so we can force the header to be in the start of the final program.
# You don't need to understand all these details as it is just magic values that
# is documented in the multiboot standard. The bootloader will search for this
# magic sequence and recognize us as a multiboot kernel.

.section .multiboot
.align 4
.long MAGIC
.long FLAGS
.long CHECKSUM

# Currently the stack pointer register (esp) points at anything and using it may
# cause massive harm. Instead, we'll provide our own stack. We will allocate
# room for a small temporary stack by creating a symbol at the bottom of it,
# then allocating 16384 bytes for it, and finally creating a symbol at the top.
.section .bootstrap_stack
stack_bottom:
.skip 16384
stack_top:

# The linker script specifies _start as the entry point to the kernel and the
# bootloader will jump to this position once the kernel has been loaded. It
# doesn't make sense to return from this function as the bootloader is gone.

.section .text
.global _start
.type _start, @function
_start:
	# Welcome to kernel mode! We now have sufficient code for the bootloader to
	# load and run our operating system. It doesn't do anything interesting yet.
	# Perhaps we would like to call printf("Hello, World\n"). You should now
	# realize one of the profound truths about kernel mode: There is nothing
	# there unless you provide it yourself. There is no printf function. There
	# is no <stdio.h> header. If you want a function, you will have to code it
	# yourself. And that is one of the best things about kernel development:
	# you get to make the entire system yourself. You have absolute and complete
	# power over the machine, there are no security restrictions, no safe
	# guards, no debugging mechanisms, there is nothing but what you build.

	# By now, you are perhaps tired of assembly language. You realize some
	# things simply cannot be done in C, such as making the multiboot header in
	# the right section and setting up the stack. However, you would like to
	# write the operating system in a higher level language, such as C or C++.
	# To that end, the next task is preparing the processor for execution of
	# such code. C doesn't expect much at this point and we only need to set up
	# a stack. Note that the processor is not fully initialized yet and stuff
	# such as floating point instructions are not available yet.

	# To set up a stack, we simply set the esp register to point to the top of
	# our stack (as it grows downwards).

	movl $stack_top, %esp

	# We are now ready to actually execute C code. We cannot embed that in an
	# assembly file, so we'll create a kernel.c file in a moment. In that file,
	# we'll create a C entry point called kernel_main and call it here.
	call kernel_main

	# In case the function returns, we'll want to put the computer into an
	# infinite loop. To do that, we use the clear interrupt ('cli') instruction
	# to disable interrupts, the halt instruction ('hlt') to stop the CPU until
	# the next interrupt arrives, and jumping to the halt instruction if it ever
	# continues execution, just to be safe. We will create a local label rather
	# than real symbol and jump to there endlessly.
	cli
	hlt
.Lhang:
	jmp .Lhang

# handle gdt
.global gdt_flush
.type gdt_flush, @function
gdt_flush:
	lgdt gp
	mov $0x10, %ax
	mov %ax, %dx
	mov %ax, %es
	mov %ax, %fs
	mov %ax, %gs
	mov %ax, %ss
	ljmp $0x08, $flush2
flush2:
	ret

# handle idt
.global idt_load
.type idt_load, @function
idt_load:
	lidt idtp
	ret

# In just a few pages in this tutorial, we will add our Interrupt
# Service Routines (ISRs) right here!
.global isr0
.type isr0, @function
.global isr1
.type isr1, @function	
.global isr2
.type isr2, @function
.global isr3
.type isr3, @function
.global isr4
.type isr4, @function
.global isr5
.type isr5, @function
.global isr6
.type isr6, @function
.global isr7
.type isr7, @function
.global isr8
.type isr8, @function
.global isr9
.type isr9, @function
	
.global isr10
.type isr10, @function
.global isr11
.type isr11, @function	
.global isr12
.type isr12, @function
.global isr13
.type isr13, @function
.global isr14
.type isr14, @function
.global isr15
.type isr15, @function
.global isr16
.type isr16, @function
.global isr17
.type isr17, @function
.global isr18
.type isr18, @function
.global isr19
.type isr19, @function
	
.global isr20
.type isr20, @function
.global isr21
.type isr21, @function	
.global isr22
.type isr22, @function
.global isr23
.type isr23, @function
.global isr24
.type isr24, @function
.global isr25
.type isr25, @function
.global isr26
.type isr26, @function
.global isr27
.type isr27, @function
.global isr28
.type isr28, @function
.global isr29
.type isr29, @function
	
.global isr30
.type isr30, @function
.global isr31
.type isr31, @function

# isr definiation start here
# 0: Divide by zero exception
isr0:
	cli
	pushl $0
	pushl $0
	jmp isr_common_stub

# 1: Debug exception
isr1:
	cli
	pushl $0
	pushl $1
	jmp isr_common_stub

# 2: Non maskable interrupt exception
isr2:
	cli
	pushl $0
	pushl $2
	jmp isr_common_stub
# 3: Breakpoing exception
isr3:
	cli
	pushl $0
	pushl $3
	jmp isr_common_stub
# 4: Into detected overflow exception
isr4:
	cli
	pushl $0
	pushl $4
	jmp isr_common_stub
# 5: Out of bounds exception
isr5:
	cli
	pushl $0
	pushl $5
	jmp isr_common_stub
# 6: Invalid opcode exception
isr6:
	cli
	pushl $0
	pushl $6
	jmp isr_common_stub
# 7: No coprocessor exception
isr7:
	cli
	pushl $0
	pushl $7
	jmp isr_common_stub
# 8: Double fault exception (with error code!)
isr8:
	cli
	pushl $8 # alread push one error code 
	jmp isr_common_stub
# 9: Coprocessor segment overrun exception
isr9:
	cli
	pushl $0
	pushl $9
	jmp isr_common_stub

# 10: Bad tss exception
isr10:
	cli
	pushl $10
	jmp isr_common_stub

# 11: Segment no present exception
isr11:
	cli
	pushl $11
	jmp isr_common_stub
# 12: Stack fault exception
isr12:	
	cli
	pushl $12
	jmp isr_common_stub

# 13: General protection fault exception
isr13:
	cli
	pushl $13
	jmp isr_common_stub

# 14: Page fault exception
isr14:
	cli
	pushl $14
	jmp isr_common_stub

# 15: Unkonwn interrupt exception
isr15:
	cli
	pushl $0
	pushl $15
	jmp isr_common_stub

# 16: Coprocessor fault exception
isr16:
	cli
	pushl $0
	pushl $16
	jmp isr_common_stub
# 17: Alignment check exception
isr17:
	cli
	pushl $0
	pushl $17
	jmp isr_common_stub

# 18: Machine check exception
isr18:
	cli
	pushl $0
	pushl $18
	jmp isr_common_stub

# 19: Reserved exception
isr19:	
	cli
	pushl $0
	pushl $19
	jmp isr_common_stub

# 20: Reserved exception
isr20:	
	cli
	pushl $0
	pushl $20
	jmp isr_common_stub

# 21: Reserved exception
isr21:	
	cli
	pushl $0
	pushl $21
	jmp isr_common_stub

# 22: Reserved exception
isr22:	
	cli
	pushl $0
	pushl $22
	jmp isr_common_stub

# 23: Reserved exception
isr23:	
	cli
	pushl $0
	pushl $23
	jmp isr_common_stub
# 24: Reserved exception
isr24:	
	cli
	pushl $0
	pushl $24
	jmp isr_common_stub
# 25: Reserved exception
isr25:	
	cli
	pushl $0
	pushl $25
	jmp isr_common_stub
# 26: Reserved exception
isr26:	
	cli
	pushl $0
	pushl $26
	jmp isr_common_stub

# 27: Reserved exception
isr27:	
	cli
	pushl $0
	pushl $27
	jmp isr_common_stub

# 28: Reserved exception
isr28:	
	cli
	pushl $0
	pushl $28
	jmp isr_common_stub

# 29: Reserved exception
isr29:	
	cli
	pushl $0
	pushl $29
	jmp isr_common_stub

# 30: Reserved exception
isr30:	
	cli
	pushl $0
	pushl $30
	jmp isr_common_stub

# 31: Reserved exception
isr31:	
	cli
	pushl $0
	pushl $31
	jmp isr_common_stub


# This is our common ISR stub. It saves the processor state, sets
# up for kernel mode segments, calls the C-level fault handler,
# and finally restores the stack frame.

isr_common_stub:
	pusha
	pushw %ds
	pushw %es
	pushw %fs
	pushw %gs
	mov $0x10, %ax # load kernel data segment
	mov %ax, %ds
	mov %ax, %es
	mov %ax, %fs
	mov %ax, %gs
	mov %esp, %eax
	pushl %eax # push us the stack
	call fault_handler # a special call, presrvers the '%eip'
	popl %eax
	popw %gs
	popw %fs
	popw %es
	popw %ds
	popa
	addl $8, %esp # cleans up the pushd error code and ISR number
	iret    # pops 5 things at once: CS, EIP, EFLAGS, SS, and ESP!
	
# IRQ stuff

# 32: IRQ 0
.global irq0
.type irq0, @function
irq0:
	cli
	pushl $0
	pushl $32
	jmp irq_common_stub

# 33: IRQ 1
.global irq1
.type irq1, @function
irq1:
	cli
	pushl $0
	pushl $33
	jmp irq_common_stub
# 34: IRQ 2
.global irq2
.type irq2, @function
irq2:
	cli
	pushl $0
	pushl $34
	jmp irq_common_stub
# 35: IRQ 3
.global irq3
.type irq3, @function
irq3:
	cli
	pushl $0
	pushl $35
	jmp irq_common_stub
# 36: IRQ 4
.global irq4
.type irq4, @function
irq4:
	cli
	pushl $0
	pushl $36
	jmp irq_common_stub
# 37: IRQ 5
.global irq5
.type irq5, @function
irq5:
	cli
	pushl $0
	pushl $37
	jmp irq_common_stub
# 38: IRQ 6
.global irq6
.type irq6, @function
irq6:
	cli
	pushl $0
	pushl $38
	jmp irq_common_stub
# 39: IRQ 7
.global irq7
.type irq7, @function
irq7:
	cli
	pushl $0
	pushl $39
	jmp irq_common_stub
# 40: IRQ 8
.global irq8
.type irq8, @function
irq8:
	cli
	pushl $0
	pushl $40
	jmp irq_common_stub
# 41: IRQ 9
.global irq9
.type irq9, @function
irq9:
	cli
	pushl $0
	pushl $41
	jmp irq_common_stub
# 42: IRQ 10
.global irq10
.type irq10, @function
irq10:
	cli
	pushl $0
	pushl $42
	jmp irq_common_stub
# 43: IRQ 11
.global irq11
.type irq11, @function
irq11:
	cli
	pushl $0
	pushl $43
	jmp irq_common_stub
# 44: IRQ 12
.global irq12
.type irq12, @function
irq12:
	cli
	pushl $0
	pushl $44
	jmp irq_common_stub
# 45: IRQ 13
.global irq13
.type irq13, @function
irq13:
	cli
	pushl $0
	pushl $45
	jmp irq_common_stub

# 46: IRQ 14
.global irq14
.type irq14, @function
irq14:
	cli
	pushl $0
	pushl $46
	jmp irq_common_stub
# 47: IRQ 15
.global irq15
.type irq15, @function
irq15:
	cli
	pushl $0
	pushl $47
	jmp irq_common_stub

# This is a stub that we have created for IRQ based ISRs. This calls
# '_irq_handler' in our C code. We need to create this in an 'irq.c'

irq_common_stub:
	pusha
	pushw %ds
	pushw %es
	pushw %fs
	pushw %gs
	mov $0x10, %ax
	mov %ax, %ds
	mov %ax, %es
	mov %ax, %fs
	mov %ax, %gs
	movl %esp, %eax
	pushl %eax
	call irq_handler
	popl %eax
	popw %gs
	popw %fs
	popw %es
	popw %ds
	popa
	addl $8, %esp
	iret

# Set the size of the _start symbol to the current location '.' minus its start.
# This is useful when debugging or when you implement call tracing.
.size _start, . - _start

	

