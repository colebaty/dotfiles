#!/bin/bash

# variables
DOTFILES_DIR=$HOME/.dotfiles;
MANIFEST=$DOTFILES_DIR/manifest;
GIT_DIR=$DOTFILES_DIR/.git;
#DATE_LAST_PULL=$(date -j -f "%a %b %d %T %Z %Y" "`date -r $GIT_DIR/FETCH_HEAD`" "+%s");
DATE_LAST_PULL=$(date -j -f "%a %b %d %T %Z %Y" "`date -r FETCH_HEAD_TEST`" "+%s");
MACHINE=`uname -n`;
SOURCES=$DOTFILES_DIR/sources
CHANGES_MADE=false;

# "constants"
# duration of two weeks in seconds; for comparison of epoch times
let UPDATE_INTERVAL=(60 * 60 * 24 * 14);

# pull if local copy is older than 2wks
let TODAY=$(date -j -f "%a %b %d %T %Z %Y" "`date`" "+%s");

TIME_DELTA=$(($TODAY - $DATE_LAST_PULL))

# echo "\$DATE_LAST_PULL: $DATE_LAST_PULL";
# echo "\$TODAY: $TODAY";
# echo "\$TIME_DELTA: $TIME_DELTA";

if [[ $TIME_DELTA -gt $UPDATE_INTERVAL ]]; then
    echo "need to pull";
else
    echo "no need to pull";
fi

# display machine info
echo "this machine is $MACHINE";
echo -n "$MACHINE is";
grep -q "$MACHINE" $SOURCES     # the order of these commands is important
if [[ $? -ne 0 ]]; then         # because we're expecing $? to be the exit
    echo -n " not";             # code of the grep command
fi
echo " in sources file";

# compare $MANIFEST date to local date
for n in `cat $MANIFEST | awk '{ print $1 }'`; do
    LOCAL_DATE=$(date -j -f "%a %b %d %T %Z %Y" "`date -r $HOME/$n`" "+%s");  # get epoch date of FOI
    MANIFEST_DATE=$(grep $n $MANIFEST | awk '{ print $2 }');
    if [[ $LOCAL_DATE -gt $MANIFEST_DATE ]]; then
        echo "need to copy $HOME/$n to $DOTFILES_DIR";
        echo "need to update $n in $MANIFEST: date and machine";
        CHANGES_MADE=true;
        echo "set \$CHANGES_MADE to true";
    elif [[ $LOCAL_DATE -le $MANIFEST_DATE ]]; then
        echo "need to copy $DOTFILES_DIR/$n to $HOME";
    fi
done

# push to repo if anything was modified
if [ "$CHANGES_MADE" = true ]; then
    echo "need to commit and push";
    echo "updated on $TODAY by $MACHINE"
    # git commit -am  "updated on $TODAY by $MACHINE"
    # git push;
fi
