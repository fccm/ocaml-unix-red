VERSION = $(shell ocamlc -version)
VERMAIN = $(shell echo $(VERSION) | sed 's/\([0-9]*.[0-9]*\).[0-9]*/\1/')

LICFILE = LICENSE-ocaml-$(VERSION)

URL = http://caml.inria.fr
URN = /pub/distrib/ocaml-$(VERMAIN)/ocaml-$(VERSION).tar.gz
URI = $(URL)$(URN)
CURL = curl -s

.PHONY: all
all: $(LICFILE)

$(LICFILE):
	$(CURL) $(URI) | tar xzfO - ocaml-$(VERSION)/LICENSE > $@

.PHONY: clean
clean:
	$(RM) $(LICFILE)

