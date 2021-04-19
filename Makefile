# bewm - dynamic window manager
# See LICENSE file for copyright and license details.

include config.mk

SRC = drw.c bewm.c util.c
OBJ = ${SRC:.c=.o}

all: options bewm

options:
	@echo bewm build options:
	@echo "CFLAGS   = ${CFLAGS}"
	@echo "LDFLAGS  = ${LDFLAGS}"
	@echo "CC       = ${CC}"

.c.o:
	${CC} -c ${CFLAGS} $<

${OBJ}: config.h config.mk

config.h:
	cp config.def.h $@

bewm: ${OBJ}
	${CC} -o $@ ${OBJ} ${LDFLAGS}

clean:
	rm -f bewm ${OBJ} bewm-${VERSION}.tar.gz

dist: clean
	mkdir -p bewm-${VERSION}
	cp -R LICENSE Makefile README config.def.h config.mk\
		bewm.1 drw.h util.h ${SRC} bewm.png transient.c bewm-${VERSION}
	tar -cf bewm-${VERSION}.tar bewm-${VERSION}
	gzip bewm-${VERSION}.tar
	rm -rf bewm-${VERSION}

install: all
	mkdir -p ${DESTDIR}${PREFIX}/bin
	cp -f bewm ${DESTDIR}${PREFIX}/bin
	chmod 755 ${DESTDIR}${PREFIX}/bin/bewm
	mkdir -p ${DESTDIR}${MANPREFIX}/man1
	sed "s/VERSION/${VERSION}/g" < bewm.1 > ${DESTDIR}${MANPREFIX}/man1/bewm.1
	chmod 644 ${DESTDIR}${MANPREFIX}/man1/bewm.1

uninstall:
	rm -f ${DESTDIR}${PREFIX}/bin/bewm\
		${DESTDIR}${MANPREFIX}/man1/bewm.1

.PHONY: all options clean dist install uninstall
