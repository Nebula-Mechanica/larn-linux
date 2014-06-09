#
# *nix Larn
#
# This version of Larn uses ncurses specific routines.

#
# Source files
#
SRC=\
  action.c \
  ansiterm.c \
  bill.c \
  config.c \
  create.c \
  data.c   \
  diag.c   \
  display.c \
  fortune.c \
  global.c  \
  help.c    \
  iventory.c\
  io.c      \
  kbhit.c   \
  main.c    \
  monster.c \
  moreobj.c \
  movem.c   \
  object.c  \
  regen.c   \
  savelev.c \
  scores.c  \
  spheres.c \
  spells.c  \
  store.c   \
  sysdep.c  \
  tgoto.c   \
  tok.c


#
# goal: debug
#
ifeq ($(MAKECMDGOALS),debug)

CFLAGS=-Wall -Wextra -ansi -pedantic -Wpointer-arith \
-Wstrict-prototypes -Wmissing-prototypes -Wdeclaration-after-statement \
-Wshadow -Wmissing-declarations -Wold-style-definition -Wredundant-decls \
-g -DDEBUG 
LDFLAGS=-lncurses

STRIP_BINARY=no


#
# goal: release 
#
#else ifeq ($(MAKECMDGOALS),release)

else

CFLAGS=-Os -Wall -fomit-frame-pointer 
LDFLAGS=-Wl,-O1 -lncurses

STRIP_BINARY=yes

endif


OBJ=$(SRC:.c=.o)
EXE=larn

CC=gcc
RM=rm
CP=cp


.PHONY : build
build: $(EXE)
	@echo Build complete!

ifeq ($(STRIP_BINARY),yes)
	@echo Stripping binary..
	@strip $(EXE)
endif

.PHONY: debug
debug: build

.PHONY: release
release: build

.PHONY : clean
clean:
	-$(RM) *.o
	-$(RM) $(EXE)

.PHONY : install
install: 
	mkdir -p /usr/local/share/games/larn/lib/file
	cp -R ../lib/file/* /usr/local/share/games/larn/lib/file/
	cp larn /usr/local/share/games/larn/lib/file/
	cp ../larn.sh /usr/local/games/

#.PHONY : distro
#distro:
#	@echo Making distributable
#	@$(CP) *.c ..\\distro\\src\\
#	@$(CP) *.h ..\\distro\\src\\
#	@$(CP) makefile ..\\distro\\src\\
#	@$(CP) readme.txt ..\\distro\\
#	@$(CP) history.txt ..\\distro\\
#	@$(CP) larn.* ..\\distro\\bin

%.o: %.c
	@echo Building $<
	@$(CC) $(CFLAGS) -o $@ -c $<

$(EXE): $(OBJ)
	@$(CC) $(OBJ) $(LDFLAGS) -o $@
