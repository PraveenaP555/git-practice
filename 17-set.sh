#!/bin/bash


set -ex # setting automatic exit if we get error, x is for debug
failure(){
    echo "failed at:  $1:$2"
}

trap 'failure "${LINENO}" "$BASH_COMMAND"' ERR # ERR is the error signal
echo "hello world success"
echoooo "hello world failure"
echo "hello world after failure"