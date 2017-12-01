#!/bin/bash

#PERL6LIB=../rakudo-debugger/lib
UI=../rakudo-debugger/lib

PERL6=./install/bin/perl6

if [[ -z "$1" ]] ; then
    echo "Usage: all | [123...] | tables"
    echo echo "Runs desired pod or table tests (all or selected ones)."
    echo "  1. 't/spec/S26-documentation/07-tables.t'"
    echo "  2. 't/spec/S26-documentation/07a-tables.t'"
    echo "  3. 't/spec/S26-documentation/07b-tables.t'"
    echo "  4. 't/spec/S26-documentation/07c-tables.t'"
    echo
    exit
fi

# this script MUST be linked to the local rakudo repo dir
if [[ ! -d "./install/bin" ]] ; then
    echo "FATAL:  This MUST be linked to the local rakudo repo dir."
    exit
fi

EXE="$PERL6"
PROVE="prove --exec $EXE"
if [[ $1 = "all" ]] ; then
    make t/spec/S26-documentation/*.t
elif [[ $1 = "1" ]] ; then
    $EXE t/spec/S26-documentation/07-tables.t
elif [[ $1 = "2" ]] ; then
    $EXE t/spec/S26-documentation/07a-tables.t
elif [[ $1 = "3" ]] ; then
    $EXE t/spec/S26-documentation/07b-tables.t
elif [[ $1 = "4" ]] ; then
    $EXE t/spec/S26-documentation/07c-tables.t
elif [[ $1 = "tables" ]] ; then
    $EXE t/spec/S26-documentation/07-tables.t
    $EXE t/spec/S26-documentation/07a-tables.t
    $EXE t/spec/S26-documentation/07b-tables.t
    $EXE t/spec/S26-documentation/07c-tables.t
else
    echo "FATAL: Unknown option '$1'"
fi
