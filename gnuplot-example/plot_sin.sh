#!/bin/bash

gnuplot<<EOF
set terminal png size 1000,400
set output "./sin.png"
plot sin(x)
EOF
