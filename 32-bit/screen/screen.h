#ifndef __SCREEN_H
#define __SCREEN_H

#define  VGA_WIDTH  80
#define  VGA_HEIGHT 25

#define  VGA_ADDR_REG 0x3D4
#define  VGA_DATA_REG 0x3D5

/* Hardware text mode color constants. */

enum vga_color
{
	COLOR_BLACK = 0,
	COLOR_BLUE = 1,
	COLOR_GREEN = 2,
	COLOR_CYAN = 3,
	COLOR_RED = 4,
	COLOR_MAGENTA = 5,
	COLOR_BROWN = 6,
	COLOR_LIGHT_GREY = 7,
	COLOR_DARK_GREY = 8,
	COLOR_LIGHT_BULE = 9,
	COLOR_LIGHT_GREEN = 10,
	COLOR_LIGHT_CYAN = 11,
	COLOR_LIGHT_RED = 12,
	COLOR_LIGHT_MAGENTA = 13,
	COLOR_LIGHT_BROWN = 14,
	COLOR_WHITE = 15,
};

extern void _terminal_initialize();
extern void _terminal_set_color(uint8_t color);
extern uint8_t _make_color(enum vga_color fg, enum vga_color bg);
extern void _screen_print_str(unsigned char *msg);
extern void _screen_cls();
extern void _screen_print_char(unsigned char c);
extern void _screen_print_dec(uint32_t n);
extern void _screen_print_hex(uint32_t n);

#endif
