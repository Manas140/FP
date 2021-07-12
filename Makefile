BINDIR=/usr/local/bin

all:
	@echo Run \'sudo make install\' to install fp on your device

install:
	@mkdir -p $(DESTDIR)$(BINDIR)
	@cp fp $(DESTDIR)$(BINDIR)/fp
	@chmod 755 $(DESTDIR)$(BINDIR)/fp
	@echo fp installed.

uninstall:
	@rm -rf $(BINDIR)/fp
	@echo fp uninstalled.
