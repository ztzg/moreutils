BINS=isutf8
PERLSCRIPTS=sponge vidir vipe ts
MANS=sponge.1 vidir.1 vipe.1 isutf8.1 ts.1
CFLAGS=-O2 -g -Wall
CXXFLAGS=-O2 -g -Wall

all: $(BINS) $(MANS)

clean:
	rm -f $(BINS) $(MANS)

install:
	mkdir -p $(PREFIX)/usr/bin
	install -s $(BINS) $(PREFIX)/usr/bin
	install $(PERLSCRIPTS) $(PREFIX)/usr/bin
	
	mkdir -p $(PREFIX)/usr/share/man/man1
	install $(MANS) $(PREFIX)/usr/share/man/man1

check: isutf8
	./check-isutf8

isutf8.1: isutf8.docbook
	docbook2x-man isutf8.docbook

%.1: %
	pod2man --center=" " --release="moreutils" $< > $@;
