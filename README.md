Kmus
====

A small 32 bit kernel compiled with Kmpp and mmc

Description
===

Kmus is a small 32 bit Kernel compiled with mmc and kmpp, a part of the Mpp-project . Coded with ASM , C , MPP , this a part of the changelog :

[27/05/2014]:

-M32 shell (Beta)

-adding GDT

-adding IDT

-adding PIC

-starting loading libmpp (functions)

-setting up timer

-detecting ram , and showing infos

-loading kmus

-showing kmus name

-Kmus showing kernel header info

-updating cursor with text

-Kmus support \n text

How To use 
===

To use Kmus , you can download the .iso file , or compile it your self using MMC and kmpp . First write :

    $ make
  
you will have this output:

     make run             : Run Kmus (should have qemu)
     make compil-32       : Compile Kmus
     make build-iso-32    : Generate iso
  
then write :

    $ make compil-32
  
To generate a iso file you'll need the grub-mkrescue .
