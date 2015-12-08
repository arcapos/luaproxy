SRCS=		luaproxy.c
LIB=		proxy

OS!=		uname

.if ${OS} == "NetBSD"
LOCALBASE=	/usr/pkg
LDADD+=		-R/usr/lib -R${LOCALBASE}/lib
.else
LOCALBASE=	/usr/local
.endif

NOLINT=	1
CFLAGS+=	-Wall -I${LOCALBASE}/include
LDADD+=		-L${LOCALBASE}/lib

LIBDIR=		${LOCALBASE}/lib/lua/5.2

libinstall:

install:
	${INSTALL} -d ${DESTDIR}${LIBDIR}
	${INSTALL} lib${LIB}.so ${DESTDIR}${LIBDIR}/${LIB}.so

.include <bsd.lib.mk>
