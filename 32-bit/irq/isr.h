#ifndef __ISR_H
#define __ISR_H

/* This defines what the stack looks like after an ISR was running */
struct regs {

	unsigned short gs, fs, es, ds; /* pushed the segs last */
	unsigned int edi, esi, ebp, esp, ebx, edx, ecx, eax; /* pushd by pushad */
	unsigned int int_no, err_code; /* int number and error code */
	unsigned int eip, cs, efalgs, useresp, ss; /* pushed by the process automatically */
};

void fault_install_handler(int num, void (*handler)(struct regs *r));
void fault_uninstall_handler(int num);

#endif
