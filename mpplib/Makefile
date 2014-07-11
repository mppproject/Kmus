#___  ___                 ______          _           _
#|  \/  |                 | ___ \        (_)         | |
#| .  . |_ __  _ __ ______| |_/ / __ ___  _  ___  ___| |_
#| |\/| | '_ \| '_ \______|  __/ '__/ _ \| |/ _ \/ __| __|
#| |  | | |_) | |_) |     | |  | | | (_) | |  __/ (__| |_
#\_|  |_/ .__/| .__/      \_|  |_|  \___/| |\___|\___|\__|
#       | |   | |                       _/ |
#       |_|   |_|                      |__/
#
#[+]MPP is a C-based programming language that allows you to code more easily in Darija.
#[+]Author : Naper & XDarker
#[+]Web site : www.naper.eu
#[+]Web site : mpp-project.org
#Filename: Makefile
OBJ=help
BINDIR=obj
WININSTDIR=install
ARCHDIR=targz

all: $(OBJ)

help:
	@echo  '**************************************'	
	@echo  '*  MPP lib Building    *'
	@echo  '**************************************'
	@echo
	@echo  'make compil-32        : Build libmpp for 32 bit'
	@echo  'make compil-64        : Build libmpp for 64 bit'
	@echo  'make link-32          : linking libmpp for 32 bit'
	@echo  'make link-64          : linking libmpp for 64 bit'

compil-32: compilmsg
compilmsg:
	@echo ===================[Compiling Kmus]===================
	gcc -c mpp_gen/mpp.c -o mpp.o
	gcc -c mpp_gen/itisal.c -o itisal.o
	gcc -c mpp_gen/x9ra.c -o x9ra.o
	gcc -c mpp_gen/xkhda.c -o xkhda.o
	gcc -c mpp_gen/xw7al.c -o xw7al.o
	gcc -c mpp_gen/xw9ra.c -o xw9ra.o
	gcc -c mpp_gen/xwktab.c -o xwktab.o
	gcc -c mpp_sys/_f3al.c -o _f3al.o
	@echo ===================[Finished]===================
link-32: linkmsg
linkmsg:
	@echo ===================[Compiling Kmus]===================
	ar -q libmpplinux.a mpp.o itisal.o x9ra.o xkhda.o xw7al.o xw9ra.o xwktab.o _f3al.o mit.o
	@echo ===================[Finished]===================
