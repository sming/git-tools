#!/bin/bash

LOCAL_OR_REMOTE_BRANCH_MATCHES_MASTER=`git branch -vv | grep "^\*" |grep -E '\* master |origin\/master'`

if [[ -n $LOCAL_OR_REMOTE_BRANCH_MATCHES_MASTER ]]; then
      echo "WARNING: attempted commit/push to local/remote master branch - aborting."
      exit 1
fi