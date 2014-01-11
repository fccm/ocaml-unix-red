VERSION = $(shell ocamlc -version)
VERMAIN = $(shell echo $(VERSION) | sed 's/\([0-9]*.[0-9]*\).[0-9]*/\1/')

URL = http://caml.inria.fr
URN = /pub/distrib/ocaml-$(VERMAIN)/ocaml-$(VERSION).tar.gz
URI = $(URL)$(URN)
CURL = curl -s
DIGDUMPER = md5sum

.PHONY: all
all:
	$(CURL) $(URI) | tar xzf - ocaml-$(VERSION)/otherlibs/unix/unix.mli
	mv ocaml-$(VERSION)/otherlibs/unix/unix.mli ./unix.mli.$(VERSION)
	rmdir ocaml-$(VERSION)/otherlibs/unix/
	rmdir ocaml-$(VERSION)/otherlibs/
	rmdir ocaml-$(VERSION)/
	$(DIGDUMPER) ./unix.mli.$(VERSION)
	cat unix.mli-$(VERSION).md5

.PHONY: clean
clean:
	$(RM) ./unix.mli.$(VERSION)

