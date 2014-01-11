VERSION = $(shell ocamlc -version)

.PHONY: all
all: redUnix.mli

redUnix.mli: unix.mli.$(VERSION)
	cat $< > $@
	patch -p0 < redUnix.mli-$(VERSION).patch

unix.mli.$(VERSION):
	$(MAKE) -f appears.mk

.PHONY: clean
clean:
	$(RM) redUnix.mli

