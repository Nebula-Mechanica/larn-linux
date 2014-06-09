#!/bin/bash
LARNDIR="/usr/local/share/games/larn/lib/file/"
SAVEDIR="$HOME/.larn/save/"
SCOREDIR="$HOME/.larn/score/"
TMPDIR="/tmp/larn"
SAVEFILE="$SAVEDIR/larn.sav"
SCOREFILE="$SCOREDIR/larn.scr"
echo "Running wrapper..."
if pgrep "^larn$" >/dev/null
then
  echo "Larn is already running!" 2>&1
  exit 1
fi
mkdir -p $TMPDIR
cp -R $LARNDIR/* $TMPDIR
if [ ! -d "$SAVEDIR" ]; then
	mkdir -p "$SAVEDIR";
fi
if [ -f "$SAVEFILE" ]; then
	mv "$SAVEFILE" $TMPDIR;
fi
if [ ! -d "$SCOREDIR" ]; then
	mkdir -p "$SCOREDIR";
fi
if [ -f "$SCOREFILE" ]; then
	mv "$SCOREFILE" $TMPDIR;
fi
cd $TMPDIR
./larn "$@"
if [ -f larn.sav ]; then
	cp larn.sav "$SAVEDIR"
fi
cp larn.scr "$SCOREDIR"
cd $OLDPWD
rm -rf $TMPDIR
echo "Exiting wrapper..."
