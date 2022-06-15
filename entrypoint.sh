#!/bin/bash

if [ ! -z ${MODULE} ]; then
    cpan2deb ${MODULE}
    cp *.deb /tmp
fi
