# This currently builds a user space program and not a useful library

CFLAGS=	-Wall -g -ansi -pedantic

LIB=	libmsr.a
LIBSRCS=	serialio.c
LIBOBJS=	serialio.o

UTIL=	msr
UTILSRCS=	msr.c
UTILOBJS=	msr.o

all:	$(LIB) $(UTIL)

$(LIB): $(LIBOBJS)
	ar rcs $(LIB) $(LIBOBJS)

$(UTIL): $(UTILOBJS)
	$(CC) -o $(UTIL) $(UTILOBJS) -L. -lmsr

install:
	install -m655 msr $(DESTDIR)/usr/bin/msr

clean:
	rm -rf *.o *~ $(LIB) $(UTIL)