# ======================================================================
# Makefile for Scidb for Unix operating systems
# ======================================================================

# ======================================================================
#    _/|            __
#   // o\         /    )           ,        /    /
#   || ._)    ----\---------__----------__-/----/__-
#   //__\          \      /   '  /    /   /    /   )
#   )___(     _(____/____(___ __/____(___/____(___/_
# ======================================================================

MAKEFLAGS += --no-print-directory

all: Makefile.in check-mtime
#	@$(MAKE) -C engines
#	@if [ $$? != 0 ]; then exit 1; fi
	@$(MAKE) -C src
	@if [ $$? != 0 ]; then exit 1; fi
	@$(MAKE) -C tcl
	@if [ $$? != 0 ]; then exit 1; fi
	@$(MAKE) -C man
	@echo ""
	@echo "Now it is recommended to use \"make check-build\"."

check-build: Makefile.in
	@$(MAKE) -C src check-build

check-mtime:
	@if [ Makefile.in -ot configure ]; then                    \
		echo "Makefile.in is older than the configure script."; \
		echo "It is recommended to re-configure. Touch";        \
		echo "Makefile.in if you think you don't need this.";   \
		exit 1;                                                 \
	fi

depend:
#	@$(MAKE) -C engines depend
	@$(MAKE) -C src depend
	@$(MAKE) -C tcl depend

clean:
#	@$(MAKE) -C engines clean
	@$(MAKE) -C src clean
	@$(MAKE) -C tcl clean
	@$(MAKE) -C man clean
	@echo ""
	@echo "Now you may use \"make\" to build the program."

install: check-mtime install-subdirs # update-etc-magic

uninstall:
#	@$(MAKE) -C engines uninstall
	@$(MAKE) -C src uninstall
	@$(MAKE) -C tcl uninstall
	@$(MAKE) -C man install

Makefile.in:
	@echo "****** Please use the 'configure' script before building Scidb ******"
	@exit 1

install-subdirs:
#	@$(MAKE) -C engines install
	@$(MAKE) -C src install
	@$(MAKE) -C tcl install
	@$(MAKE) -C man install

update-magic:
	@echo "Update magic file"
	@if [ -f /usr/share/file/magic ]; then                                     \
		if [ -z "`cat /usr/share/file/magic | grep Scidb`" ]; then              \
			if [[ ! -r /etc/magic || -z "`cat /etc/magic | grep Scidb`" ]]; then \
				if [ "`id -u`" -eq 0 ]; then                                      \
					magic="/etc/magic";                                            \
				else                                                              \
					magic="$(HOME)/.magic";                                        \
				fi;                                                               \
				if [ ! -a $$magic ]; then                                         \
					touch $$magic;                                                 \
				fi;                                                               \
				if [ -w $$magic ]; then                                           \
					if [ -z "`cat $$magic | grep Scidb`" ]; then                   \
						cat magic >> $$magic;                                       \
					fi;                                                            \
				fi;                                                               \
			fi;                                                                  \
		fi;                                                                     \
	fi

# vi:set ts=3 sw=3: