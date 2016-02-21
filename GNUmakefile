-include ../GNUmakefile.inc

SRCS=		luaproxy.c
LIB=		proxy

LUAVER?=	$(shell lua -v 2>&1 | cut -c 5-7)
LUAINC?=	/usr/include/lua${LUAVER}

CFLAGS+=	-O3 -Wall -fPIC -I/usr/include -I${LUAINC}
LDADD+=		-L/usr/lib

LIBDIR=		/usr/lib/lua/${LUAVER}

${LIB}.so:	${SRCS:.c=.o}
		cc -shared -o ${LIB}.so ${CFLAGS} ${SRCS:.c=.o} ${LDADD}

clean:
		rm -f *.o *.so
install:
	install -d ${DESTDIR}${LIBDIR}
	install ${LIB}.so ${DESTDIR}${LIBDIR}
