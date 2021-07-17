BINDIR=/usr/local/bin
FONTDIR=$(HOME)/.fonts/.
UNAME_S := $(shell uname -s)
ifeq ($(UNAME_S),Linux)
	FONTDIR=$(HOME)/.fonts/.
endif
ifeq ($(UNAME_S),Darwin)
	FONTDIR=$(HOME)/Library/Fonts/.
endif
all:
	@echo Run \'make install\' to install fp on your device

install:
	@cp FiraCode-Bold.ttf $(FONTDIR)
	@echo [*] Fonts Installed.
	@sudo mkdir -p $(BINDIR)
	@sudo cp fp $(BINDIR)/fp
	@sudo chmod 755 $(BINDIR)/fp
	@echo [*] fp Installed.

uninstall:
	@sudo rm -rf $(BINDIR)/fp
	@echo [*] fp Uninstalled.
