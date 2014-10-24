#!/bin/bash

gnuplot<<EOF
set terminal png font "./msyh.ttf" size 1000,400
set output "./random.png"
set xdata time
set timefmt "%Y-%m-%d %H:%M" 
set format x "%H:%M"
set ylabel "随机数" offset graph 0.1,graph 0.57 rotate by 0 
set grid
set title "随机数分布"
set key right top
plot "./random.data" using 1:3 title "aaaa"
EOF
