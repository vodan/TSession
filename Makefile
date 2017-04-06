TARGET1  = TSession
TARGET2  = TSessionSave
SESSIONS = ./sessions/*

PREFIX = $(DESTDIR)/usr/local
BINDIR = $(PREFIX)/bin
DATAROOTDIR = $(PREFIX)/share
DATADIR = $(DATAROOTDIR)/$(TARGET)
SESSIONDIR = $(DATADIR)/sessions

ifeq ($(COMPLETION_DIR),)
ifneq ($(wildcard /etc/bash_completion.d),)
	COMPLETION_DIR = $(DESTDIR)/etc/bash_completion.d
endif
endif
ifeq ($(COMPLETION_DIR),)
ifneq ($(wildcard /usr/share/bash-completion/completions),)
	COMPLETION_DIR = $(DESTDIR)/usr/share/bash-completion/completions
endif
endif
ifeq ($(COMPLETION_DIR),)
	COMPLETION_DIR = $(DATADIR)
endif

install-copy: $(DATADIR) $(SESSIONDIR)
	install -D $(TARGET1) $(BINDIR)/$(TARGET1)
	install -D $(TARGET2) $(BINDIR)/$(TARGET2)
	install -D $(SESSIONS) $(SESSIONDIR)/

install_completion:
	install -D bash_completion.sh $(COMPLETION_DIR)/$(TARGET1)


uninstall:
	-rm $(BINDIR)/$(TARGET1)
	-rm $(BINDIR)/$(TARGET2)
	-rm $(DATADIR)

$(DATADIR):
	-mkdir -p $@
$(SESSIONDIR):
	-mkdir -p $@

# write session path into scripts.
install: install-copy install_completion
	-sed -e 's|SESSIONDIR=.*$$|SESSIONDIR="$(SESSIONDIR)"|g' -i $(BINDIR)/$(TARGET1) $(BINDIR)/$(TARGET2) $(COMPLETION_DIR)/$(TARGET1)

.PHONY: install uninstall
