#!/bin/bash

# variables
DOTFILES_DIR=$HOME/.dotfiles;
MANIFEST=$DOTFILES_DIR/manifest;
GIT_DIR=$DOTFILES_DIR/.git;
DATE_LAST_PULL=$(date -j -f "%a %b %d %T %Z %Y" "`date -r $GIT_DIR/FETCH_HEAD`" "+%s");
MACHINE=`uname -n`;
SOURCES=$DOTFILES_DIR/sources
CHANGES_MADE=false;

# "constants"
# duration of two weeks in seconds; for comparison of epoch times
let UPDATE_INTERVAL=(60 * 60 * 24 * 14);

# pull most recent copy
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

echo "machine is $MACHINE";
if [[ `grep "$MACHINE" $SOURCES` -eq 0 ]]; then
    echo "$MACHINE is in sources file";
fi

# compare $MANIFEST date to local date
for n in `cat $MANIFEST | awk '{ print $1 }'`; do
    LOCAL_DATE=$(date -j -f "%a %b %d %T %Z %Y" "`date -r $HOME/$n`" "+%s");  # get epoch date of FOI
    MANIFEST_DATE=$(grep $n $MANIFEST | awk '{ print $2 }');
    if [[ $LOCAL_DATE -gt $MANIFEST_DATE ]]; then
        echo "need to copy $HOME/$n to $DOTFILES_DIR";
        echo "need to update \$MANIFEST_DATE for $n";
    elif [[ $LOCAL_DATE -le $MANIFEST_DATE ]]; then
        echo "need to copy $DOTFILES_DIR/$n to $HOME";
    fi
done

# KEEP
# get file info for each file in manifest
# for n in `cat manifest | awk '{ print $1 }'`; do
 #    DATE=$(date -j -f "%a %b %d %T %Z %Y" "`date -r $HOME/$n`" "+%s");  # get epoch date of FOI
  #   echo -e "$n  \\t$DATE\\t$MACHINE" >> manifest; # two extra spaces after $n for tab alignment purposes
# done

# push to repo if anything was modified
if [ "$CHANGES_MADE" = true ]; then
    echo "need to commit and push";
    # git commit -am  "updated on `date` from `uname -n`";
    # git push;
fi
