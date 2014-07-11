#ifndef COMMON_H
#define COMMON_H


typedef unsigned int   u32int;
typedef          int   s32int;
typedef unsigned short u16int;
typedef          short s16int;
typedef unsigned char  u8int;
typedef          char  s8int;
#ifdef __cplusplus
extern "C"
{
#endif
void outb( unsigned short port, unsigned char val );
#ifdef __cplusplus
}
#endif
#endif // COMMON_H