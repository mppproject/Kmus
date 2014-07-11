#include <stddef.h>
#include <stdint.h>

#include "isr.h"



void disable_interrupt();
void enable_interrupt();

extern void gdt_install();
extern void idt_install();
extern void isr_install();
extern void irq_install();
extern void timer_install();
extern void keyboard_install();

extern void idt_set_gate(int num, uint32_t base, uint16_t sel, uint8_t flags);

extern void irq_install_handler(int irq, void (*handler)(struct regs *r));
extern void irq_uninstall_handler(int irq);

extern unsigned char *memcpy(unsigned char *dest, const unsigned char *src, int count);
extern unsigned char *memset(unsigned char *dest, unsigned char val, int count);
extern size_t strlen(const char *str);

extern unsigned char inportb(unsigned short port);
extern void outportb(unsigned short port, unsigned char data);

