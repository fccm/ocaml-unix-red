This project tries to explore a possible way to resolve
issues listed in "ocaml-unix-portability-issues".


===@ How to use?

First you should make the file "unix.mli.4.01.0" appear in the directory "mod":

 $ make -C mod -f appears.mk

Later, let it disappear with:

 $ make -C mod -f appears.mk clean

Then you can reduce this Unix module to "redUnix.mli" which we hope will be
a portable subset:

 $ make -C mod -f reduces.mk

This reduction can also be evaporated with:

 $ make -C mod -f reduces.mk clean

Then the compilation might proceed through the following invocation:

 $ make -C mod -f compiles.mk

You will probably now be willing to see if we can do something of some use:

 $ make -C try -f client.mk

In order to leave the place clean, you may try:

 $ make -C mod -f cleans.mk


===@ Which Version?

Current attempts:
- 4.00.1
- 4.01.0


===@ Licensing?

Try to decrypt the file LICENSE-ocaml-<VERSION>
after extraction from the upstream:

 $ make -f LICENSE.mk
 $ less LICENSE-ocaml-*

