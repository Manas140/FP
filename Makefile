PREFIX?=	/usr
BINDIR=		${PREFIX}/bin

all:
	@echo Run \'make install\' to install fp on your device

install:
	@mkdir -p $(DESTDIR)$(BINDIR)
	@cp fp $(DESTDIR)$(BINDIR)/fp
	@chmod 755 $(DESTDIR)$(BINDIR)/fp
	@echo fp installed.

uninstall:
	@rm -rf $(DESTDIR)$(BINDIR)/fp
	@rmdir -p --ignore-fail-on-non-empty $(DESTDIR)$(BINDIR)
	@echo fp uninstalled.
