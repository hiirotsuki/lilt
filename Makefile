CC := gcc
CFLAGS := -std=gnu99
CFLAGS_TILT := -DLILT_TITLE_SET -DTMT_UNICODE_MAP -DTMT_MODE_MSGS
LIBS :=
SDL_LIBS := -lSDL

prefix ?= /usr/local
bindir ?= $(prefix)/bin

.PHONY: all clean install
all: lilt

lilt: lilt.c tmt.c tmt.h font.h font4x8.h palette.h
	$(CC) $(CFLAGS_TILT) $(CFLAGS) -o $@ lilt.c tmt.c $(LIBS) $(SDL_LIBS)

install: lilt
	install -d $(DESTDIR)$(bindir)
	install -m 755 lilt $(DESTDIR)$(bindir)/lilt

clean:
	rm -f lilt
