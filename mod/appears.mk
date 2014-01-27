VERSION = $(shell ocamlc -version)
VERMAIN = $(shell echo $(VERSION) | sed 's/\([0-9]*.[0-9]*\).[0-9]*/\1/')

URL = http://caml.inria.fr
URN = /pub/distrib/ocaml-$(VERMAIN)/ocaml-$(VERSION).tar.gz
URI = $(URL)$(URN)
CURL = curl -s
DIGDUMPER = md5sum

.PHONY: all
all: unix.mli.$(VERSION)
	$(DIGDUMPER) $<
	cat unix.mli-$(VERSION).md5

unix.mli.$(VERSION):
	$(CURL) $(URI) | tar xzfO - ocaml-$(VERSION)/otherlibs/unix/unix.mli > $@

.PHONY: clean
clean:
	$(RM) ./unix.mli.$(VERSION)

