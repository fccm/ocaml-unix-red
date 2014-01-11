OCAMLC = ocamlc
OCAMLOPT = ocamlopt
OCAMLRUN = ocamlrun
RUNDIR = ../mod

.PHONY: all opt
all: try
opt: tryopt

redUnix.cma:
	$(MAKE) -C $(RUNDIR) -f appears.mk
	$(MAKE) -C $(RUNDIR) -f reduces.mk
	$(MAKE) -C $(RUNDIR) -f compiles.mk

redUnix.cmxa:
	$(MAKE) -C $(RUNDIR) -f appears.mk
	$(MAKE) -C $(RUNDIR) -f reduces.mk
	$(MAKE) -C $(RUNDIR) -f compiles.mk opt

client.byte: redUnix.cma client.ml
	$(OCAMLC) -I $(RUNDIR) redUnix.cma client.ml -o client.byte

client.opt: redUnix.cmxa client.ml
	$(OCAMLOPT) unix.cmxa -I $(RUNDIR) redUnix.cmxa client.ml -o client.opt

.PHONY: try
try: client.byte
	$(OCAMLRUN) $<

.PHONY: tryopt
tryopt: client.opt
	./$<

.PHONY: clean
clean:
	$(RM) *.o *.cm[iox] *.opt *.byte

