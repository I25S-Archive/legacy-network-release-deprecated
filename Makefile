#
# Tagion main network makefile
#
include git.mk
include command.mk
include ddoc.mk
#REPOROOT:=$(shell git root)
LIB_PREFIX:=$(REPOROOT)/lib/

TOOLS_DIR:=$(REPOROOT)/tools
LDCTOOLS:=$(TOOLS_DIR)/ldc

TAGION_DDOC:=tagion_ddoc
TAGION_BASIC:=tagion_basic
TAGION_UTILS:=tagion_utils
TAGION_HIBON:=tagion_hibon

DDOCBUILDER:=$(TAGION_DDOC)/ddoc_builder.mk
DDOCREPO:=$(TAGION_DDOC)
DDOCROOT:=ddoc

TAGIONMODULES+=$(TAGION_BASIC)
TAGIONMODULES+=$(TAGION_UTILS)

SUBMODULES+=$(TAGIONMODULES)

#SUBMODULES+=$(TAGION_HIBON)

SECP256K1_SRC:=secp256k1
LIBP2P:=libp2pDWrapper
TAGION:=tagion_core
WASI_SDK:=wasi-sdk
TAGION_BETTERC:=tagion_betterc
HIBON_BETTERC:=hibon_betterc


#SUBMODULES+=libp2
#SUBMODULES+=wasm-micro-runtime
#SUBMODULES+=$(WASI_SDK)
#SUBMODULES+=$(TAGION_BETTERC)
#SUBMODULES+=$(HIBON_BETTERC)


TESTS:=${addsuffix -test,$(SUBMODULES)}
CLEANS:=${addsuffix -clean,$(SUBMODULES)}
DDOC:=${addsuffix -ddoc,$(SUBMODULES)}
MODULE_DFILES:=${addsuffix -dfiles,$(SUBMODULES)}
PROPER:=${addsuffix -dfiles,$(SUBMODULES)}

#INSTALL:=${addprefix install-,$(SUBMODULES)}

help:
	@echo "# Tagion main project"
	@echo "# This project includes the tools to build the Tagion network"
	@echo "# and also tools to build smart contract's"
	@echo "# git revno "$(GIT_REVNO)
	@echo "# git hash  "$(GIT_HASH)
	@echo "# git url   "$(GIT_INFO)
	@echo "# REPOROOT  "${REPOROOT}

	@echo "If the repo been clone with out --recursive then run the"
	@echo "\tmake subdate"
	@echo
	@echo "Run the unitest"
	@echo "\tmake test"
	@echo
	@echo "All the submodules can be pull by"
	@echo "\tmake spull"
	@echo
	@echo "The dependecy is cleaned by"
	@echo "\tmake clean"
	@echo

subdate:
	git submodule update --init --recursive

spull:
	git pull --recurse-submodules

test: $(TESTS)
	@echo "Unittests done"

%-test:
	$(MAKE) -C $* test

include source.mk
-include dfiles.mk
#DDOCHELP:=help-ddoc
-include $(DDOCBUILDER)
-include $(DDOCBUILDER)

proper: $(PROPER)

%-proper:
	$(MAKE) -C $* proper

clean: $(CLEANS)
	rm -f dfiles.mk

%-clean:
	$(MAKE) -C $* clean

test34:
	echo $(DDOCBUILDER)
	echo $(DDOCROOT)
	echo $(DDOCSCRIPT)
	echo $(DDOCMODULES)
	echo $(DFILES)
