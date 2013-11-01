# -*- Mode: makefile-gmake; indent-tabs-mode: t; tab-width: 8 -*-
# please use tabs (8 width)

# List of top-level packages to install when building the
# entire system.  Dependencies will be automatically installed
# and updated as necessary.
PACKAGES := smaccmpilot smaccm-gcs-gateway

.PHONY: all
all: smaccmpilot-all

smaccmpilot-all: .cabal-sandbox
	@cabal install $(PACKAGES)
	@$(MAKE) -C smaccmpilot-stm32f4

.cabal-sandbox: $(MAKEFILE_LIST)
	@cabal sandbox init
	@cabal sandbox add-source `find . -name "*.cabal" -printf "%h\n"`

clean:
	rm -rf cabal.sandbox.config .cabal-sandbox

