#!/bin/bash

main() {
    local name="$1"
    local img="805248565926.dkr.ecr.eu-west-1.amazonaws.com/foo/${name}:test"
    if docker pull "$img";
    then
        echo "OK -> $img"
    else
        echo "ERROR -> $img"
    fi
}

main "$@"

# 805248565926.dkr.ecr.eu-west-1.amazonaws.com/foo/base1:testb