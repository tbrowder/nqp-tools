#!/bin/bash

if [[ -z "$1" ]] ; then
    echo "Usage: $0 go"
    echo
    echo "Configure rakudo, as an ordinary user, in its own repository."
    echo
    echo "After configuration: make, make test, make install."
    exit
fi

perl Configure.pl --gen-moar --gen-nqp --backends=moar
