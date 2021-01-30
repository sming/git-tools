#!/bin/bash
#----------------------------------------------------------------
# Script to muck-spreader hooks that will stop me from stomping `master` :(
#----------------------------------------------------------------

#----------------------------------------------------------------
# Usage: pass in the TLD of all your checked-out repos, namely ~/src
#----------------------------------------------------------------


TARGET_DIR=$1
echo "TARGET_DIR: $TARGET_DIR"

REPOS=`find "$TARGET_DIR" -name '.git' -type d -maxdepth 3`

for REPO in $REPOS
do
    echo "Splatting hooks to $REPO ..."

    SCRIPT_DIR=`dirname $0`
    echo "SCRIPT_DIR: $SCRIPT_DIR"

    CURRENT_DIR=`pwd`
    echo "CURRENT_DIR: $CURRENT_DIR"

    cp -fvR "${SCRIPT_DIR}/dot-git/hooks/" ${REPO}/hooks/

    chmod -vR +x "${REPO}/hooks/"
done