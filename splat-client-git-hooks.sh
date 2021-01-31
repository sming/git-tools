#!/bin/bash
#----------------------------------------------------------------
# Script to muck-spreader hooks that will stop me from stomping `master` :(
#----------------------------------------------------------------

#----------------------------------------------------------------
# Usage: pass in the TLD of all your checked-out repos, namely ~/src
#----------------------------------------------------------------
SCRIPT_DIR=`dirname $0`
echo "This script's directory: $SCRIPT_DIR"


CURRENT_DIR=`pwd`
echo "Directory invoked from: $CURRENT_DIR"

TARGET_DIR=$1
echo "Target directory to search for repos: $TARGET_DIR"

REPOS=`find "$TARGET_DIR" -name '.git' -type d -maxdepth 3`

echo "———————"
echo "Starting to splat..."
echo "———————"

for REPO in $REPOS
do
    echo "Splatting hooks to $REPO ..."

    cp -fR "${SCRIPT_DIR}/dot-git/hooks/" ${REPO}/hooks/

    chmod -R +x "${REPO}/hooks/"
done

echo "———————"
echo "... done splatting."
echo "———————"
