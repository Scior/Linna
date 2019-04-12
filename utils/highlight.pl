#!/usr/bin/env perl
use strict;
use warnings;
use utf8;

while(<>) {
    s#(^.+)\ \[#\e[37m$1\e[m\ \[#;
    s#\[INFO\]#\[\e[32;1mINFO\e[m\]#g;
    s#\[WARNING\]#\[\e[33;1mWARNING\e[m\]#g;
    s#\[ERROR\]#\[\e[31;1mERROR\e[m\]#g;
    s/ (#.+)/ \e[34;1m$1\e[m/g;
    print;
}

