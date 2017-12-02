help:
	@echo 'Makefile for DASH X11                                                   '
	@echo '                                                                        '
	@echo 'Usage:                                                                  '
	@echo '   make all                         compile native C code               '
	@echo '   make clean                       remove generated shared library     '
	@echo '                                                                        '
	@echo 'Tip: You might need to export your JAVA_HOME location                   '

all: libx11.so

libx11.so:
	gcc -O3 -fPIC -shared -I $(JAVA_HOME)/include/ \
	-I $(JAVA_HOME)/include/linux/ \
    hashblock.cpp  \
	luffa.c  \
    simd.c  \
    keccak.c  \
    aes_helper.c  \
    echo.c  \
    blake.c  \
    jh.c  \
    skein.c  \
    shavite.c  \
    bmw.c  \
    groestl.c  \
    cubehash.c \
	-o libx11.so


clean:
	[ ! -f libx11.so ] || \
	rm libx11.so



