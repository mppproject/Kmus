
#ifndef __KBD_H
#define __KBD_H

/* keyboard light depends follow */
#define M_SCROLL_LOCK  1 << 0
#define M_NUMBER_LOCK  1 << 1
#define M_CAPS_LOCK    1 << 2

/* other status */
#define M_ALT        1 << 3
#define M_CONTROL    1 << 4
#define M_L_SHIFT    1 << 5
#define M_R_SHIFT    1 << 6


#define i8042_REG_DATA 0x60
#define i8042_REG_CTL  0x64


/* KBDUS means US Keyboard Layout. This is a scancode table
*  used to layout a standard US keyboard. I have left some
*  comments in to give you an idea of what key is what, even
*  though I set it's array index to 0. You can change that to
*  whatever you want using a macro, if you wish! */

enum s_key {
	CONTROL = 200,
	ALT = 201,
	LEFT_SHIFT = 202,
	RIGHT_SHIFT = 203,
	CAPS_LOCK = 204,
	F1 = 205,
	F2 = 206,
	F3 = 207,
	F4 = 208,
	F5 = 209,
	F6 = 210,
	F7 = 211,
	F8 = 212,
	F9 = 213,
	F10 = 214,
	F11 = 215,
	F12 = 216,
	NUMBER_LOCK = 217,
	SCROLL_LOCK = 218,
	HOME = 219,
	END = 220,
	UP_ARROW = 221,
	DOWN_ARROW = 222,
	LEFT_ARROW = 223,
	RIGHT_ARROW = 224,
	PAGE_UP = 225,
	PAGE_DOWN = 226,
	INSERT = 227,
	DELETE = 228,
	UNDEFINED = 229
};



unsigned char kbdus[128] = 
{
   0,  27, '1', '2', '3', '4', '5', '6', '7', '8',	/* 9 */
  '9', '0', '-', '=', '\b',	/* Backspace */
  '\t',			/* Tab */
  'q', 'w', 'e', 'r',	/* 19 */
  't', 'y', 'u', 'i', 'o', 'p', '[', ']', '\n',	/* Enter key */
  CONTROL,  /* 29   - Control */
  'a', 's', 'd', 'f', 'g', 'h', 'j', 'k', 'l', ';',	/* 39 */
 '\'', '`',   LEFT_SHIFT,	/* Left shift */
 '\\', 'z', 'x', 'c', 'v', 'b', 'n',			/* 49 */
  'm', ',', '.', '/',   RIGHT_SHIFT,	/* Right shift */
  '*',
    ALT,	/* Alt */
  ' ',	/* Space bar */
    CAPS_LOCK,	/* Caps lock */
    F1,	  /* 59 - F1 key ... > */
    F2,   F3,   F4,   F5,   F6,   F7,   F8,   F9,
    F10,	/* < ... F10 */
    NUMBER_LOCK,	/* 69 - Num lock*/
    SCROLL_LOCK,	/* Scroll Lock */
    HOME,	/* Home key */
    UP_ARROW,	/* Up Arrow */
    PAGE_UP,	/* Page Up */
  '-',
    LEFT_ARROW,	/* Left Arrow */
    0,
    RIGHT_ARROW,	/* Right Arrow */
  '+',
    END,	/* 79 - End key*/
    DOWN_ARROW,	/* Down Arrow */
    PAGE_DOWN,	/* Page Down */
    INSERT,	/* Insert Key */
    DELETE,	/* Delete Key */
    0,   0,   0,
    F11,	/* F11 Key */
    F12,	/* F12 Key */
    UNDEFINED,	/* All other keys are undefined */
};

	
#endif
