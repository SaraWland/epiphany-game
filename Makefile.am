SUBDIRS = include src data
EXTRA_DIST = autogen.sh README \
	docs/AUTHORS docs/BUGS docs/ChangeLog docs/COPYING \
	docs/INSTALL docs/NEWS docs/TODO docs/Tech docs/Doxyfile

# Copy the binary to the top-level build directory after building
all-local:
	@if [ -f src/epiphany-game$(EXEEXT) ]; then \
		cp -f src/epiphany-game$(EXEEXT) epiphany-game$(EXEEXT); \
		echo "Copied binary to build directory: epiphany-game$(EXEEXT)"; \
	fi

clean-local:
	rm -f epiphany-game$(EXEEXT)




 
