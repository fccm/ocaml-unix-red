OCAMLC = ocamlc
OCAMLOPT = ocamlopt

.PHONY: all lib
all: lib
lib: redUnix.cma
opt: redUnix.cmxa

redUnix.cmi: redUnix.mli
	$(OCAMLC) -c $<

redUnix.cmo: redUnix.ml redUnix.cmi
	$(OCAMLC) -c $<

redUnix.cmx: redUnix.ml redUnix.cmi
	$(OCAMLOPT) -c $<

redUnix.cma: redUnix.cmo
	$(OCAMLC) -a -o $@ unix.cma $<

redUnix.cmxa: redUnix.cmx
	$(OCAMLOPT) -a -o $@ $<


.PHONY: clean
clean:
	$(RM) redUnix.cm[ioxa] redUnix.cmx[as]

